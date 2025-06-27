from app.models.denuncia import Denuncia
import json

class DataRecord():
    def __init__(self):  
        self.denuncias = []
        self.next_id = 1
        try:
            with open("app/controllers/db/denuncias.json", "r", encoding="utf-8") as arquivo_json:
                data = json.load(arquivo_json)
                self.denuncias = [Denuncia(**item) for item in data]
                if self.denuncias:
                    self.next_id = max([d.id for d in self.denuncias]) + 1
        except FileNotFoundError:
            self.denuncias = []
            self.save_to_file()

    def create(self, dados):
        nova_denuncia = Denuncia(
            titulo = dados['titulo'],
            tipo = dados['tipo'],
            descricao= dados['descricao'],
            endereco = dados['endereco'],
            status = dados.get('status', 'Em Análise'),
            id = self.next_id
        )
        self.denuncias.append(nova_denuncia)
        self.next_id += 1
        self.save_to_file()
        return nova_denuncia
    
    def read_all(self):
        return self.denuncias
    
    def read_by_id(self, id):
        for denuncia in self.denuncias:
            if denuncia.id == int(id):
                return denuncia
        return None
    
    def update(self, id, dados):
        denuncia = self.read_by_id(id)
        if denuncia:
            denuncia.titulo = dados['titulo']
            denuncia.tipo = dados['tipo']
            denuncia.descricao = dados['descricao']
            denuncia.endereco = dados['endereco']
            denuncia.status = dados['status']
            self.save_to_file()
            return denuncia
        return None
    
    def delete(self, id):
        self.denuncias = [d for d in self.denuncias if d.id != int(id)]
        self.save_to_file()
        return True
    
    def save_to_file(self):
        data = []
        for d in self.denuncias:
            data.append({
                'id': d.id,
                'titulo': d.titulo,
                'tipo': d.tipo,
                'descricao': d.descricao,
                'endereco': d.endereco,
                'status': d.status
            })
        with open("app/controllers/db/denuncias.json", "w", encoding="utf-8") as arquivo_json:
            json.dump(data, arquivo_json, indent=2, ensure_ascii=False)