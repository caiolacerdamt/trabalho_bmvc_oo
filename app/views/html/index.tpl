<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bem-vindo ao Sistema de Denúncias Urbanas</title>
    <link rel="stylesheet" href="/static/css/base.css">
    <link rel="stylesheet" href="/static/css/index.css">
</head>
<body>
    <header>
        <h1>Bem-vindo ao Sistema de Denúncias Urbanas</h1>
    </header>
    <main>
        <section class="bem-vindo">
            <h2>Faça a diferença na sua cidade!</h2>
            <p>Nosso portal permite que você registre, acompanhe e ajude a resolver problemas urbanos como buracos, iluminação, lixo, enchentes e muito mais.</p>
            <p>Para registrar uma denúncia, faça login ou cadastre-se. Se já possui uma conta, acesse o sistema e contribua para uma cidade melhor!</p>
            <div class="cta-buttons">
                % if not autenticado:
                    <a href="/portal" class="btn">Entrar</a>
                % else:
                    <form action="/logout" method="post" style="display:inline;">
                        <button type="submit" class="btn">Logout</button>
                    </form>
                    <span style="margin-left:10px; color:#2176ae; font-weight:600;">Você já está autenticado!</span>
                % end
                <a href="/denuncias" class="btn">Ver Denúncias</a>
            </div>
        </section>
        <section class="destaque">
            <h3>Por que denunciar?</h3>
            <ul>
                <li>Ajude a prefeitura a identificar e resolver problemas rapidamente.</li>
                <li>Contribua para a segurança e bem-estar da sua comunidade.</li>
                <li>Acompanhe o status das suas denúncias em tempo real.</li>
            </ul>
        </section>
    </main>
    <footer>
        <p>&copy; 2024 Sistema de Denúncias Urbanas. Todos os direitos reservados.</p>
    </footer>
</body>
</html> 