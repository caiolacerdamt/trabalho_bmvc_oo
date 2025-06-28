# -*- coding: utf-8 -*-
import sys
import locale

if sys.platform.startswith('win'):
    try:
        locale.setlocale(locale.LC_ALL, 'Portuguese_Brazil.1252')
    except:
        try:
            locale.setlocale(locale.LC_ALL, 'pt_BR.UTF-8')
        except:
            pass
else:
    try:
        locale.setlocale(locale.LC_ALL, 'pt_BR.UTF-8')
    except:
        pass

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
            'excluir_denuncia': self.excluir_denuncia
        }
        self.models = DataRecord()

    def render(self, page, *args, **kwargs):
       content = self.pages.get(page, self.helper)
       return content(*args, **kwargs)


    def helper(self):
        return template('app/views/html/helper')
    
    def denuncias(self):
        todas_denuncias = self.models.read_all()
        
        # Contadores de status
        contadores = {
            'em_analise': 0,
            'em_andamento': 0,
            'resolvido': 0
        }
        
        for denuncia in todas_denuncias:
            # Normalizar status removendo acentos e espaços
            status_normalizado = denuncia.status.lower()
            status_normalizado = status_normalizado.replace(' ', '_')
            status_normalizado = status_normalizado.replace('á', 'a').replace('ã', 'a')
            
            if status_normalizado in contadores:
                contadores[status_normalizado] += 1
        
        return template('app/views/html/denuncias', denuncias=todas_denuncias, contadores=contadores)
    
    def nova_denuncia(self):
        return template('app/views/html/nova_denuncia')
    
    def ver_denuncia(self, id):
        denuncia = self.models.read_by_id(id)
        if not denuncia:
            redirect('/denuncias')
        return template('app/views/html/ver_denuncia', denuncia=denuncia)
    
    def editar_denuncia(self, id):
        denuncia = self.models.read_by_id(id)
        if not denuncia:
            redirect('/denuncias')
        return template('app/views/html/editar_denuncia', denuncia=denuncia)
    
    def criar_denuncia(self):
        dados = {
            'titulo': request.forms.get('titulo'),
            'tipo': request.forms.get('tipo'),
            'descricao': request.forms.get('descricao'),
            'endereco': request.forms.get('endereco')
        }
        self.models.create(dados)
        redirect('/denuncias')

    def atualizar_denuncia(self, id):
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
        self.models.delete(id)
        redirect('/denuncias')

