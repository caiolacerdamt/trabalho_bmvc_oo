class Denuncia():
    def __init__(self, titulo, tipo, descricao, endereco, status="Em Análise", id=None):
        self.id = id
        self.titulo = titulo
        self.tipo = tipo
        self.descricao = descricao
        self.endereco = endereco
        self.status = status


