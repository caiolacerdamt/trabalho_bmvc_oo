<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar: {{denuncia.titulo}} - Sistema de Denúncias Urbanas</title>
    <link rel="stylesheet" href="/static/css/base.css">
    <link rel="stylesheet" href="/static/css/formularios.css">
</head>
<body>
    <header>
        <h1>Editar Denúncia</h1>
        <nav>
            <ul>
                <li><a href="/">Página Inicial</a></li>
                <li><a href="/denuncias">Denúncias</a></li>
                <li><a href="/denuncias/nova">Nova Denúncia</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <section class="formulario-denuncia">
            <h2>Editar Denúncia: {{denuncia.titulo}}</h2>
            <form action="/denuncias/{{denuncia.id}}/atualizar" method="POST" class="form-denuncia">
                <div class="campo">
                    <label for="titulo">Título da Denúncia:</label>
                    <input type="text" id="titulo" name="titulo" value="{{denuncia.titulo}}" required>
                </div>

                <div class="campo">
                    <label for="tipo">Tipo de Denúncia:</label>
                    <select id="tipo" name="tipo" required>
                        <option value="Iluminação Pública" % if denuncia.tipo == "Iluminação Pública": %selected% endif %}>Iluminação Pública</option>
                        <option value="Buraco nas Ruas" % if denuncia.tipo == "Buraco nas Ruas": %selected% endif %}>Buraco nas Ruas</option>
                        <option value="Coleta de Lixo" % if denuncia.tipo == "Coleta de Lixo": %selected% endif %}>Coleta de Lixo</option>
                        <option value="Problemas de Drenagem" % if denuncia.tipo == "Problemas de Drenagem": %selected% endif %}>Problemas de Drenagem</option>
                        <option value="Árvores em Risco" % if denuncia.tipo == "Árvores em Risco": %selected% endif %}>Árvores em Risco</option>
                    </select>
                </div>

                <div class="campo">
                    <label for="status">Status:</label>
                    <select id="status" name="status" required>
                        <option value="Em Análise" % if denuncia.status == "Em Análise": %selected% endif %}>Em Análise</option>
                        <option value="Em Andamento" % if denuncia.status == "Em Andamento": %selected% endif %}>Em Andamento</option>
                        <option value="Resolvido" % if denuncia.status == "Resolvido": %selected% endif %}>Resolvido</option>
                    </select>
                </div>

                <div class="campo">
                    <label for="endereco">Endereço:</label>
                    <input type="text" id="endereco" name="endereco" value="{{denuncia.endereco}}" required>
                </div>

                <div class="campo">
                    <label for="descricao">Descrição:</label>
                    <textarea id="descricao" name="descricao" rows="4" required>{{denuncia.descricao}}</textarea>
                </div>

                <div class="acoes">
                    <button type="submit" class="btn-atualizar">Atualizar Denúncia</button>
                    <a href="/denuncias/{{denuncia.id}}" class="btn-cancelar">Cancelar</a>
                </div>
            </form>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 Sistema de Denúncias Urbanas - Todos os direitos reservados</p>
    </footer>
</body>
</html>