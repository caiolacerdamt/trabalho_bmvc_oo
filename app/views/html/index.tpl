<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bem-vindo ao Sistema de Denúncias Urbanas</title>
    <link rel="stylesheet" href="/static/css/base.css">
    <link rel="stylesheet" href="/static/css/index.css">
</head>
<body style="display: flex; flex-direction: column; min-height: 100vh;">
    <header>
        <div style="display: flex; align-items: center; justify-content: space-between; width: 100%; flex-wrap: wrap; gap: 1rem;">
            <h1 style="margin: 0;">Página Inicial</h1>
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
    <main style="max-width: 1400px; margin: 0 auto; padding: 0 2vw 3vw 2vw; flex: 1; display: flex; flex-direction: column;">
        <section class="banner-home" style="background: linear-gradient(90deg, #2176ae 0%, #34c759 100%); color: #fff; border-radius: 18px; margin: 2.5rem 0 3rem 0; padding: 3.5rem 4vw; display: flex; align-items: center; gap: 4vw; flex-wrap: wrap; min-height: 260px;">
            <div style="flex:2; min-width: 320px;">
                <h2 style="font-size:2.7rem; font-weight:800; margin-bottom:1.2rem;">Bem-vindo ao Sistema de Denúncias Urbanas</h2>
                <p style="font-size:1.25rem; margin-bottom:1.5rem;">Sua voz faz a diferença! Ajude a transformar sua cidade denunciando problemas urbanos de forma rápida, fácil e transparente.</p>
                <div class="cta-buttons" style="margin-bottom:1.2rem;">
                    % if not autenticado:
                        <a href="/portal" class="btn" style="background:#fff; color:#2176ae; font-weight:700;">Entrar</a>
                        <a href="/cadastro" class="btn" style="background:#fff; color:#34c759; font-weight:700;">Cadastrar</a>
                    % else:
                        <span style="margin-left:10px; color:#fff; font-weight:600;">Você já está autenticado!</span>
                    % end
                    <a href="/denuncias" class="btn" style="background:#fff; color:#2176ae; font-weight:700;">Ver Denúncias</a>
                </div>
            </div>
            <div style="flex:1; min-width: 260px; text-align:center;">
                <span style="font-size:7rem;">🏙️</span>
                <div style="font-size:1.25rem; margin-top:1.2rem;">Cidadania Digital</div>
            </div>
        </section>
        <section class="acesso-rapido" style="display:grid; grid-template-columns: repeat(auto-fit, minmax(300px,1fr)); gap:2.5rem; margin-bottom:3.5rem;">
            <div class="card-atalho" style="background:#f8f9fa; border-radius:14px; padding:2.2rem 1.5rem; box-shadow:0 2px 8px rgba(33,118,174,0.06); text-align:center; min-height: 220px;">
                <span style="font-size:2.7rem;">📝</span>
                <h4 style="margin:1rem 0 0.5rem 0; font-size:1.25rem;">Nova Denúncia</h4>
                <p style="font-size:1.08rem; color:#444;">Registre um novo problema urbano em poucos cliques.</p>
                <a href="/denuncias/nova" class="btn" style="margin-top:1.1rem;">Denunciar</a>
            </div>
            <div class="card-atalho" style="background:#f8f9fa; border-radius:14px; padding:2.2rem 1.5rem; box-shadow:0 2px 8px rgba(33,118,174,0.06); text-align:center; min-height: 220px;">
                <span style="font-size:2.7rem;">🔍</span>
                <h4 style="margin:1rem 0 0.5rem 0; font-size:1.25rem;">Consultar Denúncias</h4>
                <p style="font-size:1.08rem; color:#444;">Veja o mapa e o histórico de denúncias da sua cidade.</p>
                <a href="/denuncias" class="btn" style="margin-top:1.1rem;">Consultar</a>
            </div>
        </section>
        <section class="depoimento-home" style="background:#f8f9fa; border-radius:14px; box-shadow:0 2px 8px rgba(33,118,174,0.04); padding:2.5rem 2.5rem; margin-bottom:3.5rem; max-width:900px; margin-left:auto; margin-right:auto;">
            <blockquote style="font-size:1.25rem; color:#2176ae; font-style:italic; margin:0 0 1.2rem 0;">“Consegui resolver um problema antigo de iluminação na minha rua em poucos dias usando o portal. Recomendo a todos!”</blockquote>
            <div style="font-weight:700; color:#444;">— Maria Souza, moradora de Brasília</div>
        </section>
    </main>
    <footer style="margin-top:auto;">
        <p>&copy; 2024 Sistema de Denúncias Urbanas. Todos os direitos reservados.</p>
    </footer>
</body>
</html> 