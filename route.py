from app.controllers.application import Application
from bottle import Bottle, route, run, request, static_file
from bottle import redirect, template, response

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

#-----------------------------------------------------------------------------


if __name__ == '__main__':

    run(app, host='0.0.0.0', port=8080, debug=True)
