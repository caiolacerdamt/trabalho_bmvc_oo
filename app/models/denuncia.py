class Denuncia():
    def __init__(self, titulo, tipo, descricao, endereco, status="Em Análise", id=None, comentarios=None, usuario=None):
        self.id = id
        self.titulo = titulo
        self.tipo = tipo
        self.descricao = descricao
        self.endereco = endereco
        self.status = status
        self.usuario = usuario
        # Garante que sempre exista o atributo comentarios
        if comentarios is None:
            self.comentarios = []
        else:
            self.comentarios = comentarios


