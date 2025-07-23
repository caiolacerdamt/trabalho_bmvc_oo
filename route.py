from app.controllers.application import Application
from bottle import Bottle, route, run, request, static_file
from bottle import redirect, template, response
from bottle.ext.websocket import websocket, GeventWebSocketServer
import json

ws_connections = {}

app = Bottle()
ctl = Application()

#-----------------------------------------------------------------------------
# Rotas:
@app.route('/static/<filepath:path>')
def serve_static(filepath):
    return static_file(filepath, root='./app/static')

@app.route('/helper')
def helper(info= None):
    return ctl.render('helper')


#-----------------------------------------------------------------------------
# Suas rotas aqui:
@app.route('/')
def index():
    autenticado = ctl.is_authenticated()
    return ctl.render('index', autenticado=autenticado)

@app.route('/denuncias', methods=['GET'])
def denuncias():
    return ctl.denuncias()

@app.route('/denuncias/nova')
def nova_denuncia():
    return ctl.render('nova_denuncia')

@app.route('/denuncias/<id:int>')
def ver_denuncia(id):
    return ctl.render('ver_denuncia', id)

@app.route('/denuncias/<id:int>/editar')
def editar_denuncia(id):
    return ctl.render('editar_denuncia', id)


@app.route('/denuncias/criar', method='POST')
def criar_denuncia():
    return ctl.render('criar_denuncia')

@app.route('/denuncias/<id:int>/atualizar', method='POST')
def atualizar_denuncia(id):
    return ctl.render('atualizar_denuncia', id)

@app.route('/denuncias/<id:int>/excluir', method='POST')
def excluir_denuncia(id):
    return ctl.render('excluir_denuncia', id)

# Rotas de autenticação
@app.route('/portal', method='GET')
def portal():
    return ctl.render('portal', erro=None)

@app.route('/portal', method='POST')
def action_portal():
    username = request.forms.get('username')
    password = request.forms.get('password')
    session_id, username = ctl.authenticate_user(username, password)
    if session_id:
        response.set_cookie('session_id', session_id, httponly=True, secure=False, max_age=3600, path='/')
        redirect(f'/denuncias')
    else:
        return template('app/views/html/portal', erro='Usuário ou senha inválidos!')

@app.route('/logout', method='POST')
def logout():
    ctl.logout_user()
    response.delete_cookie('session_id', path='/')
    redirect('/portal')

@app.route('/cadastro', method='GET')
def cadastro():
    return template('app/views/html/cadastro.tpl', erro=None, sucesso=None)

@app.route('/cadastro', method='POST')
def cadastro_post():
    username = request.forms.get('username')
    password = request.forms.get('password')
    email = request.forms.get('email')
    if ctl.models.create_user(username, password, email):
        return template('app/views/html/cadastro.tpl', erro=None, sucesso='Usuário cadastrado com sucesso! Faça login.')
    else:
        return template('app/views/html/cadastro.tpl', erro='Nome de usuário já existe!', sucesso=None)

#-----------------------------------------------------------------------------

@app.route('/ws/comentarios/<denuncia_id:int>', apply=[websocket])
def comentarios_ws(ws, denuncia_id):
    denuncia_id = str(denuncia_id)
    if denuncia_id not in ws_connections:
        ws_connections[denuncia_id] = set()
    ws_connections[denuncia_id].add(ws)
    try:
        while True:
            msg = ws.receive()
            if msg is None:
                break
            data = json.loads(msg)
            if data.get('acao') == 'excluir':
                ctl.models.remove_comentario(denuncia_id, data['id'])
                # Repasse a exclusão para todos
                for conn in ws_connections[denuncia_id]:
                    conn.send(json.dumps({'acao': 'excluir', 'id': data['id']}))
            else:
                # Novo comentário: gere id único
                import time
                data['id'] = str(int(time.time() * 1000))
                ctl.models.add_comentario(denuncia_id, data)
                for conn in ws_connections[denuncia_id]:
                    conn.send(json.dumps(data))
    finally:
        ws_connections[denuncia_id].remove(ws)


if __name__ == '__main__':

    run(app, host='0.0.0.0', port=8080, debug=True, server=GeventWebSocketServer)
