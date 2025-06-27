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
@app.route('/denuncias', methods=['GET'])
def denuncias():
    return ctl.render('denuncias')

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



#-----------------------------------------------------------------------------


if __name__ == '__main__':

    run(app, host='0.0.0.0', port=8080, debug=True)
