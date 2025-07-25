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
        <div style="display: flex; align-items: center; justify-content: space-between; width: 100%; flex-wrap: wrap; gap: 1rem;">
            <h1 style="margin: 0;">Editar Denúncia</h1>
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

                <div class="campo">
                    <label for="regiao_administrativa">Região Administrativa:</label>
                    <select id="regiao_administrativa" name="regiao_administrativa" required style="margin-bottom:1rem;">
                        <option value="">Selecione...</option>
                        <option value="Águas Claras" % if denuncia.regiao_administrativa == 'Águas Claras': %selected% endif %>Águas Claras</option>
                        <option value="Brazlândia" % if denuncia.regiao_administrativa == 'Brazlândia': %selected% endif %>Brazlândia</option>
                        <option value="Candangolândia" % if denuncia.regiao_administrativa == 'Candangolândia': %selected% endif %>Candangolândia</option>
                        <option value="Ceilândia" % if denuncia.regiao_administrativa == 'Ceilândia': %selected% endif %>Ceilândia</option>
                        <option value="Cruzeiro" % if denuncia.regiao_administrativa == 'Cruzeiro': %selected% endif %>Cruzeiro</option>
                        <option value="Fercal" % if denuncia.regiao_administrativa == 'Fercal': %selected% endif %>Fercal</option>
                        <option value="Gama" % if denuncia.regiao_administrativa == 'Gama': %selected% endif %>Gama</option>
                        <option value="Guará" % if denuncia.regiao_administrativa == 'Guará': %selected% endif %>Guará</option>
                        <option value="Itapoã" % if denuncia.regiao_administrativa == 'Itapoã': %selected% endif %>Itapoã</option>
                        <option value="Jardim Botânico" % if denuncia.regiao_administrativa == 'Jardim Botânico': %selected% endif %>Jardim Botânico</option>
                        <option value="Lago Norte" % if denuncia.regiao_administrativa == 'Lago Norte': %selected% endif %>Lago Norte</option>
                        <option value="Lago Sul" % if denuncia.regiao_administrativa == 'Lago Sul': %selected% endif %>Lago Sul</option>
                        <option value="Núcleo Bandeirante" % if denuncia.regiao_administrativa == 'Núcleo Bandeirante': %selected% endif %>Núcleo Bandeirante</option>
                        <option value="Paranoá" % if denuncia.regiao_administrativa == 'Paranoá': %selected% endif %>Paranoá</option>
                        <option value="Park Way" % if denuncia.regiao_administrativa == 'Park Way': %selected% endif %>Park Way</option>
                        <option value="Planaltina" % if denuncia.regiao_administrativa == 'Planaltina': %selected% endif %>Planaltina</option>
                        <option value="Plano Piloto" % if denuncia.regiao_administrativa == 'Plano Piloto': %selected% endif %>Plano Piloto</option>
                        <option value="Recanto das Emas" % if denuncia.regiao_administrativa == 'Recanto das Emas': %selected% endif %>Recanto das Emas</option>
                        <option value="Riacho Fundo" % if denuncia.regiao_administrativa == 'Riacho Fundo': %selected% endif %>Riacho Fundo</option>
                        <option value="Riacho Fundo II" % if denuncia.regiao_administrativa == 'Riacho Fundo II': %selected% endif %>Riacho Fundo II</option>
                        <option value="Samambaia" % if denuncia.regiao_administrativa == 'Samambaia': %selected% endif %>Samambaia</option>
                        <option value="Santa Maria" % if denuncia.regiao_administrativa == 'Santa Maria': %selected% endif %>Santa Maria</option>
                        <option value="São Sebastião" % if denuncia.regiao_administrativa == 'São Sebastião': %selected% endif %>São Sebastião</option>
                        <option value="SCIA/Estrutural" % if denuncia.regiao_administrativa == 'SCIA/Estrutural': %selected% endif %>SCIA/Estrutural</option>
                        <option value="SIA" % if denuncia.regiao_administrativa == 'SIA': %selected% endif %>SIA</option>
                        <option value="Sobradinho" % if denuncia.regiao_administrativa == 'Sobradinho': %selected% endif %>Sobradinho</option>
                        <option value="Sobradinho II" % if denuncia.regiao_administrativa == 'Sobradinho II': %selected% endif %>Sobradinho II</option>
                        <option value="Sudoeste/Octogonal" % if denuncia.regiao_administrativa == 'Sudoeste/Octogonal': %selected% endif %>Sudoeste/Octogonal</option>
                        <option value="Taguatinga" % if denuncia.regiao_administrativa == 'Taguatinga': %selected% endif %>Taguatinga</option>
                        <option value="Varjão" % if denuncia.regiao_administrativa == 'Varjão': %selected% endif %>Varjão</option>
                        <option value="Vicente Pires" % if denuncia.regiao_administrativa == 'Vicente Pires': %selected% endif %>Vicente Pires</option>
                    </select>
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