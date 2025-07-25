class Denuncia():
    def __init__(self, titulo, tipo, descricao, endereco, status="Em Análise", id=None, comentarios=None, usuario=None, regiao_administrativa=None):
        self.id = id
        self.titulo = titulo
        self.tipo = tipo
        self.descricao = descricao
        self.endereco = endereco
        self.status = status
        self.usuario = usuario
        self.regiao_administrativa = regiao_administrativa
        # Garante que sempre exista o atributo comentarios
        if comentarios is None:
            self.comentarios = []
        else:
            self.comentarios = comentarios


