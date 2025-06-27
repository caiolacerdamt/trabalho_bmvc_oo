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

class Denuncia():
    def __init__(self, titulo, tipo, descricao, endereco, status="Em Análise", id=None):
        self.id = id
        self.titulo = titulo
        self.tipo = tipo
        self.descricao = descricao
        self.endereco = endereco
        self.status = status


