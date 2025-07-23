<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Portal de Login</title>
    <link rel="stylesheet" href="/static/css/base.css">
    <link rel="stylesheet" href="/static/css/portal.css">
</head>
<body>
    <div class="login-container">
        <div class="login-box">
            <h1>Bem-vindo de volta!</h1>
            <p class="login-desc">Acesse sua conta para registrar ou acompanhar denúncias urbanas.</p>
            % if erro:
                <div class="erro-login">{{erro}}</div>
            % end
            <form action="/portal" method="post" class="form-login">
                <div class="campo">
                    <label for="username">Usuário:</label>
                    <input id="username" name="username" type="text" required />
                </div>
                <div class="campo">
                    <label for="password">Senha:</label>
                    <input id="password" name="password" type="password" required />
                </div>
                <div class="campo">
                    <input value="Entrar" type="submit" class="btn-login" />
                </div>
            </form>
            <div style="text-align:center;margin-top:1.2rem;">
                <a href="/cadastro" style="color:#2176ae;font-weight:600;text-decoration:none;">Criar nova conta</a>
            </div>
        </div>
    </div>
</body>
</html> 