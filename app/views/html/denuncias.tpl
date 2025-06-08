<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Feed de Denúncias Urbanas</title>
    <link rel="stylesheet" href="/static/css/denuncias.css">
</head>
<body>
    <header>
        <h1>Feed de Denúncias Urbanas</h1>
        <nav>
            <ul>
                <li><a href="/">Página Inicial</a></li>
                <li><a href="/denuncias">Denúncias</a></li>
                <li><a href="/nova-denuncia">Nova Denúncia</a></li>
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
            <!-- Card de Denúncia 1 -->
            <article class="card-denuncia">
                <img src="/static/img/buraco.webp" alt="Buraco na rua" class="card-imagem">
                <div class="card-header">
                    <h3>Buraco na Rua Principal</h3>
                    <span class="status em-analise">Em Análise</span>
                </div>
                <div class="card-body">
                    <p class="endereco">Rua das Flores, 123 - Centro</p>
                    <p class="descricao">Buraco grande na pista, causando risco para motoristas e pedestres.</p>
                    <div class="card-footer">
                        <span class="data">Reportado em: 15/03/2024</span>
                        <span class="tipo">Tipo: Buraco nas Ruas</span>
                    </div>
                </div>
            </article>

            <!-- Card de Denúncia 2 -->
            <article class="card-denuncia">
                <img src="/static/img/poste.avif" alt="Poste de luz apagado" class="card-imagem">
                <div class="card-header">
                    <h3>Poste de Luz Apagado</h3>
                    <span class="status em-andamento">Em Andamento</span>
                </div>
                <div class="card-body">
                    <p class="endereco">Avenida Principal, 456 - Bairro Novo</p>
                    <p class="descricao">Poste de luz quebrado há mais de uma semana, deixando a rua escura.</p>
                    <div class="card-footer">
                        <span class="data">Reportado em: 14/03/2024</span>
                        <span class="tipo">Tipo: Iluminação Pública</span>
                    </div>
                </div>
            </article>

            <!-- Card de Denúncia 3 -->
            <article class="card-denuncia">
                <img src="/static/img/lixo.webp" alt="Lixo acumulado" class="card-imagem">
                <div class="card-header">
                    <h3>Lixo Acumulado</h3>
                    <span class="status resolvido">Resolvido</span>
                </div>
                <div class="card-body">
                    <p class="endereco">Rua dos Pássaros, 789 - Jardim</p>
                    <p class="descricao">Lixo acumulado há dias sem coleta, causando mau cheiro e risco de doenças.</p>
                    <div class="card-footer">
                        <span class="data">Reportado em: 13/03/2024</span>
                        <span class="tipo">Tipo: Coleta de Lixo</span>
                    </div>
                </div>
            </article>

            <!-- Card de Denúncia 4 -->
            <article class="card-denuncia">
                <img src="/static/img/arvore.jpg" alt="Árvore em risco" class="card-imagem">
                <div class="card-header">
                    <h3>Árvore Prestes a Cair</h3>
                    <span class="status em-analise">Em Análise</span>
                </div>
                <div class="card-body">
                    <p class="endereco">Rua das Palmeiras, 321 - Vila Nova</p>
                    <p class="descricao">Árvore grande com risco de queda, ameaçando a segurança dos moradores.</p>
                    <div class="card-footer">
                        <span class="data">Reportado em: 12/03/2024</span>
                        <span class="tipo">Tipo: Árvores em Risco</span>
                    </div>
                </div>
            </article>

            <!-- Card de Denúncia 5 -->
            <article class="card-denuncia">
                <img src="/static/img/alagamento.webp" alt="Problema de drenagem" class="card-imagem">
                <div class="card-header">
                    <h3>Alagamento na Rua</h3>
                    <span class="status em-andamento">Em Andamento</span>
                </div>
                <div class="card-body">
                    <p class="endereco">Avenida das Águas, 555 - Centro</p>
                    <p class="descricao">Rua alagada após chuvas, causando transtornos para pedestres e motoristas.</p>
                    <div class="card-footer">
                        <span class="data">Reportado em: 11/03/2024</span>
                        <span class="tipo">Tipo: Problemas de Drenagem</span>
                    </div>
                </div>
            </article>

            <!-- Card de Denúncia 6 -->
            <article class="card-denuncia">
                <img src="/static/img/iluminacao.jpg" alt="Problema de iluminação" class="card-imagem">
                <div class="card-header">
                    <h3>Falta de Iluminação</h3>
                    <span class="status em-analise">Em Análise</span>
                </div>
                <div class="card-body">
                    <p class="endereco">Rua Escura, 777 - Bairro Industrial</p>
                    <p class="descricao">Trecho da rua sem iluminação, aumentando o risco de acidentes e assaltos.</p>
                    <div class="card-footer">
                        <span class="data">Reportado em: 10/03/2024</span>
                        <span class="tipo">Tipo: Iluminação Pública</span>
                    </div>
                </div>
            </article>

            <!-- Card de Denúncia 7 -->
            <article class="card-denuncia">
                <img src="/static/img/buraco2.jpg" alt="Buraco na rua" class="card-imagem">
                <div class="card-header">
                    <h3>Buraco na Avenida</h3>
                    <span class="status resolvido">Resolvido</span>
                </div>
                <div class="card-body">
                    <p class="endereco">Avenida Principal, 888 - Centro</p>
                    <p class="descricao">Buraco profundo na pista, causando danos aos veículos que passam pelo local.</p>
                    <div class="card-footer">
                        <span class="data">Reportado em: 09/03/2024</span>
                        <span class="tipo">Tipo: Buraco nas Ruas</span>
                    </div>
                </div>
            </article>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 Sistema de Denúncias Urbanas - Todos os direitos reservados</p>
    </footer>

    <script type="text/javascript" src="static/js/denuncias.js"></script>
</body>
</html> 