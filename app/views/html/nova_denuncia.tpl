<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nova Denúncia - Sistema de Denúncias Urbanas</title>
    <link rel="stylesheet" href="/static/css/base.css">
    <link rel="stylesheet" href="/static/css/formularios.css">
</head>
<body>
    <header>
        <div style="display: flex; align-items: center; justify-content: space-between; width: 100%; flex-wrap: wrap; gap: 1rem;">
            <h1 style="margin: 0;">Nova Denúncia</h1>
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
            <h2>Registrar Nova Denúncia</h2>
            <form action="/denuncias/criar" method="POST" class="form-denuncia">
                <div class="campo">
                    <label for="titulo">Título da Denúncia:</label>
                    <input type="text" id="titulo" name="titulo" required>
                </div>

                <div class="campo">
                    <label for="tipo">Tipo de Denúncia:</label>
                    <select id="tipo" name="tipo" required>
                        <option value="">Selecione o tipo</option>
                        <option value="Iluminação Pública">Iluminação Pública</option>
                        <option value="Buraco nas Ruas">Buraco nas Ruas</option>
                        <option value="Coleta de Lixo">Coleta de Lixo</option>
                        <option value="Problemas de Drenagem">Problemas de Drenagem</option>
                        <option value="Árvores em Risco">Árvores em Risco</option>
                    </select>
                </div>

                <div class="campo">
                    <label for="regiao_administrativa">Região Administrativa:</label>
                    <select id="regiao_administrativa" name="regiao_administrativa" required style="margin-bottom:1rem;">
                        <option value="">Selecione...</option>
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

                <div class="campo">
                    <label for="endereco">Endereço:</label>
                    <input type="text" id="endereco" name="endereco" placeholder="Rua, número - bairro" required>
                </div>

                <div class="campo">
                    <label for="descricao">Descrição:</label>
                    <textarea id="descricao" name="descricao" rows="4" placeholder="Descreva o problema em detalhes" required></textarea>
                </div>

                <div class="acoes">
                    <button type="submit" class="btn-criar">Registrar Denúncia</button>
                    <a href="/denuncias" class="btn-cancelar">Cancelar</a>
                </div>
            </form>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 Sistema de Denúncias Urbanas - Todos os direitos reservados</p>
    </footer>
</body>
</html>