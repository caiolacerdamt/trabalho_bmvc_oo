from app.models.denuncia import Denuncia
from app.models.usuarios import UserAccount
import json
import uuid

class DataRecord():
    def __init__(self):  
        self.denuncias = []
        self.__usuarios = []
        self.__authenticated_users = {}
        self.next_id = 1
        self.read_users()
        self.read_denuncias()

    def read_users(self):
        try:
            with open("app/controllers/db/usuarios.json", "r", encoding="utf-8") as arquivo_json:
                user_data = json.load(arquivo_json)
                self.__usuarios = [UserAccount(**item) for item in user_data]
        except FileNotFoundError:
            self.__usuarios.append(UserAccount('admin', '123456', 'admin@example.com'))
            self.save_users()

    def save_users(self):
        with open("app/controllers/db/usuarios.json", "w", encoding="utf-8") as arquivo_json:
            user_data = [vars(usuario) for usuario in self.__usuarios]
            json.dump(user_data, arquivo_json, indent=2)

    def checkUser(self, username, password):
        for user in self.__usuarios:
            if user.username == username and user.password == password:
                session_id = str(uuid.uuid4())
                self.__authenticated_users[session_id] = user
                return session_id
        return None
    
    def getCurrentUser(self, session_id):
        if session_id in self.__authenticated_users:
            return self.__authenticated_users[session_id]
        return None
    
    def getUserName(self, session_id):
        if session_id in self.__authenticated_users:
            return self.__authenticated_users[session_id].username
        return None
    
    def logout(self, session_id):
        if session_id in self.__authenticated_users:
            del self.__authenticated_users[session_id]

    def read_denuncias(self):
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