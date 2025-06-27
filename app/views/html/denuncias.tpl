<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feed de Denúncias Urbanas</title>
    <link rel="stylesheet" href="/static/css/base.css">
    <link rel="stylesheet" href="/static/css/denuncias-page.css">
</head>
<body>
    <header>
        <h1>Feed de Denúncias Urbanas</h1>
        <nav>
            <ul>
                <li><a href="/">Página Inicial</a></li>
                <li><a href="/denuncias">Denúncias</a></li>
                <li><a href="/denuncias/nova">Nova Denúncia</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <section class="filtros">
            <h2>Filtrar Denúncias</h2>
            <div class="filtro-tipos">
                <label for="filtro-tipo">Tipo de Denúncia:</label>
                <select id="filtro-tipo">
                    <option value="todos">Todos os tipos</option>
                    <option value="Iluminação Pública">Iluminação Pública</option>
                    <option value="Buraco nas Ruas">Buraco nas Ruas</option>
                    <option value="Coleta de Lixo">Coleta de Lixo</option>
                    <option value="Problemas de Drenagem">Problemas de Drenagem</option>
                    <option value="Árvores em Risco">Árvores em Risco</option>
                </select>
            </div>
        </section>

        <section class="feed-denuncias">
            % for denuncia in denuncias:
            <article class="card-denuncia">
                <div class="card-header">
                    <h3><a href="/denuncias/{{denuncia.id}}">{{denuncia.titulo}}</a></h3>
                    <span class="status {{denuncia.status.lower().replace(' ', '-').replace('á', 'a').replace('ã', 'a')}}">{{denuncia.status}}</span>
                </div>
                <div class="card-body">
                    <p class="endereco">{{denuncia.endereco}}</p>
                    <p class="descricao">{{denuncia.descricao}}</p>
                    <div class="card-footer">
                        <span class="tipo">Tipo: {{denuncia.tipo}}</span>
                        <div class="acoes">
                            <a href="/denuncias/{{denuncia.id}}" class="btn-ver">Ver</a>
                            <a href="/denuncias/{{denuncia.id}}/editar" class="btn-editar">Editar</a>
                        </div>
                    </div>
                </div>
            </article>
            % end
        </section>
    </main>

    <footer>
        <p>&copy; 2024 Sistema de Denúncias Urbanas - Todos os direitos reservados</p>
    </footer>

    <script type="text/javascript" src="/static/js/denuncias.js"></script>
</body>
</html>