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
        <h1>Nova Denúncia</h1>
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