from bottle import template, redirect, request
from app.controllers.datarecord import DataRecord


class Application():

    def __init__(self):
        self.pages = {
            'denuncias': self.denuncias,
            'nova_denuncia': self.nova_denuncia,
            'ver_denuncia': self.ver_denuncia,
            'editar_denuncia': self.editar_denuncia,
            'criar_denuncia': self.criar_denuncia,
            'atualizar_denuncia': self.atualizar_denuncia,
            'excluir_denuncia': self.excluir_denuncia,
            'portal': self.portal,
            'index': self.index
        }
        self.models = DataRecord()
        self.__current_username = None

    def render(self, page, *args, **kwargs):
       content = self.pages.get(page, self.helper)
       return content(*args, **kwargs)
    
    def get_session_id(self):
        return request.get_cookie('session_id')
    
    def is_authenticated(self, username=None):
        session_id = self.get_session_id()
        current_username = self.models.getUserName(session_id)
        if username:
            return username == current_username
        return current_username is not None

    def authenticate_user(self, username, password):
        session_id = self.models.checkUser(username, password)
        if session_id:
            self.logout_user()
            self.__current_username = self.models.getUserName(session_id)
            return session_id, username
        return None, None
    
    def logout_user(self):
        self.__current_username = None
        session_id = self.get_session_id()
        if session_id:
            self.models.logout(session_id)

    def get_current_user(self):
        session_id = self.get_session_id()
        return self.models.getCurrentUser(session_id)

    def helper(self):
        return template('app/views/html/helper')
    
    def denuncias(self):
        if not self.is_authenticated():
            return redirect('/portal')
        todas_denuncias = self.models.read_all()
        
        contadores = {
            'em_analise': 0,
            'em_andamento': 0,
            'resolvido': 0
        }
        
        for denuncia in todas_denuncias:
            status_normalizado = denuncia.status.lower()
            #status_normalizado = status_normalizado.replace(' ', '_')
            #status_normalizado = status_normalizado.replace('á', 'a').replace('ã', 'a')
            
            if status_normalizado in contadores:
                contadores[status_normalizado] += 1
        
        return template('app/views/html/denuncias', denuncias=todas_denuncias, contadores=contadores)
    
    def nova_denuncia(self):
        if not self.is_authenticated():
            return redirect('/portal')
        return template('app/views/html/nova_denuncia')
    
    def ver_denuncia(self, id):
        if not self.is_authenticated():
            return redirect('/portal')
        denuncia = self.models.read_by_id(id)
        if not denuncia:
            redirect('/denuncias')
        return template('app/views/html/ver_denuncia', denuncia=denuncia)
    
    def editar_denuncia(self, id):
        if not self.is_authenticated():
            return redirect('/portal')
        denuncia = self.models.read_by_id(id)
        if not denuncia:
            redirect('/denuncias')
        return template('app/views/html/editar_denuncia', denuncia=denuncia)
    
    def criar_denuncia(self):
        if not self.is_authenticated():
            return redirect('/portal')
        dados = {
            'titulo': request.forms.get('titulo'),
            'tipo': request.forms.get('tipo'),
            'descricao': request.forms.get('descricao'),
            'endereco': request.forms.get('endereco')
        }
        self.models.create(dados)
        redirect('/denuncias')

    def atualizar_denuncia(self, id):
        if not self.is_authenticated():
            return redirect('/portal')
        dados = {
            'titulo': request.forms.get('titulo'),
            'tipo': request.forms.get('tipo'),
            'descricao': request.forms.get('descricao'),
            'endereco': request.forms.get('endereco'),
            'status': request.forms.get('status')
        }
        self.models.update(id, dados)
        redirect(f'/denuncias/{id}')

    def excluir_denuncia(self, id):
        if not self.is_authenticated():
            return redirect('/portal')
        self.models.delete(id)
        redirect('/denuncias')

    def portal(self, erro=None):
        return template('app/views/html/portal', erro=erro)

    def index(self, **kwargs):
        autenticado = kwargs.get('autenticado', False)
        return template('app/views/html/index', autenticado=autenticado)

