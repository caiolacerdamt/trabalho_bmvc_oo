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
        <div style="display: flex; align-items: center; justify-content: space-between; width: 100%; flex-wrap: wrap; gap: 1rem;">
            <h1 style="margin: 0;">Denúncias</h1>
            <nav style="flex: 1;">
                <ul style="display: flex; gap: 1.5rem; align-items: center; margin: 0; padding: 0; list-style: none; flex-wrap: wrap;">
                    <li><a href="/">Página Inicial</a></li>
                    <li><a href="/denuncias">Denúncias</a></li>
                    <li><a href="/denuncias/nova">Nova Denúncia</a></li>
                </ul>
            </nav>
            <form action="/logout" method="post" style="margin: 0;">
                <button type="submit" class="btn-logout">Logout</button>
            </form>
        </div>
    </header>

    <main>
        <!-- Cards de Status -->
        <section class="status-cards">
            <div class="status-card em-analise">
                <div class="status-icon">📋</div>
                <div class="status-info">
                    <h3>Em Análise</h3>
                    <span class="status-count">{{contadores.get('em_analise', 0)}}</span>
                </div>
            </div>
            <div class="status-card em-andamento">
                <div class="status-icon">⚡</div>
                <div class="status-info">
                    <h3>Em Andamento</h3>
                    <span class="status-count">{{contadores.get('em_andamento', 0)}}</span>
                </div>
            </div>
            <div class="status-card resolvido">
                <div class="status-icon">✅</div>
                <div class="status-info">
                    <h3>Resolvido</h3>
                    <span class="status-count">{{contadores.get('resolvido', 0)}}</span>
                </div>
            </div>
        </section>

        <section class="filtros">
            <div class="filtro-tipos filtro-box">
                <label for="filtro-tipo">Tipo de Denúncia:</label>
                <select id="filtro-tipo" class="filtro-select">
                    <option value="todos">Todos os tipos</option>
                    <option value="Iluminação Pública">Iluminação Pública</option>
                    <option value="Buraco nas Ruas">Buraco nas Ruas</option>
                    <option value="Coleta de Lixo">Coleta de Lixo</option>
                    <option value="Problemas de Drenagem">Problemas de Drenagem</option>
                    <option value="Árvores em Risco">Árvores em Risco</option>
                </select>
            </div>
            <div class="filtro-regiao filtro-box">
                <label for="filtro-regiao">Região Administrativa:</label>
                <select id="filtro-regiao" class="filtro-select">
                    <option value="todas">Todas as regiões</option>
                    <option value="Águas Claras">Águas Claras</option>
                    <option value="Brazlândia">Brazlândia</option>
                    <option value="Candangolândia">Candangolândia</option>
                    <option value="Ceilândia">Ceilândia</option>
                    <option value="Cruzeiro">Cruzeiro</option>
                    <option value="Fercal">Fercal</option>
                    <option value="Gama">Gama</option>
                    <option value="Guará">Guará</option>
                    <option value="Itapoã">Itapoã</option>
                    <option value="Jardim Botânico">Jardim Botânico</option>
                    <option value="Lago Norte">Lago Norte</option>
                    <option value="Lago Sul">Lago Sul</option>
                    <option value="Núcleo Bandeirante">Núcleo Bandeirante</option>
                    <option value="Paranoá">Paranoá</option>
                    <option value="Park Way">Park Way</option>
                    <option value="Planaltina">Planaltina</option>
                    <option value="Plano Piloto">Plano Piloto</option>
                    <option value="Recanto das Emas">Recanto das Emas</option>
                    <option value="Riacho Fundo">Riacho Fundo</option>
                    <option value="Riacho Fundo II">Riacho Fundo II</option>
                    <option value="Samambaia">Samambaia</option>
                    <option value="Santa Maria">Santa Maria</option>
                    <option value="São Sebastião">São Sebastião</option>
                    <option value="SCIA/Estrutural">SCIA/Estrutural</option>
                    <option value="SIA">SIA</option>
                    <option value="Sobradinho">Sobradinho</option>
                    <option value="Sobradinho II">Sobradinho II</option>
                    <option value="Sudoeste/Octogonal">Sudoeste/Octogonal</option>
                    <option value="Taguatinga">Taguatinga</option>
                    <option value="Varjão">Varjão</option>
                    <option value="Vicente Pires">Vicente Pires</option>
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
                    <p class="regiao-adm" style="color:#2176ae; font-weight:600; margin-bottom:0.5rem;">{{denuncia.regiao_administrativa or 'Região não informada'}}</p>
                    <p class="endereco">{{denuncia.endereco}}</p>
                    <p class="descricao">{{denuncia.descricao}}</p>
                    <div class="card-footer">
                        <span class="tipo">Tipo: {{denuncia.tipo}}</span>
                        <div class="acoes">
                            <a href="/denuncias/{{denuncia.id}}" class="btn-ver">Ver</a>
                            % if denuncia.usuario == usuario_atual:
                                <a href="/denuncias/{{denuncia.id}}/editar" class="btn-editar">Editar</a>
                            % end
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