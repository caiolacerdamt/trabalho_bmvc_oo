<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Criar Conta</title>
    <link rel="stylesheet" href="/static/css/base.css">
    <link rel="stylesheet" href="/static/css/portal.css">
</head>
<body>
    <div class="login-container">
        <div class="login-box">
            <h1>Crie sua conta</h1>
            <p class="login-desc">Preencha os campos para se cadastrar no sistema.</p>
            % if erro:
                <div class="erro-login" style="color:#e74c3c;background:#fffbe6;border-radius:8px;padding:0.7em 1em;margin-bottom:1em;">{{erro}}</div>
            % end
            % if sucesso:
                <div class="sucesso-login" style="color:#2e7d4f;background:#e6f9ed;border-radius:8px;padding:0.7em 1em;margin-bottom:1em;">{{sucesso}}</div>
            % end
            <form action="/cadastro" method="post" class="form-login">
                <div class="campo">
                    <label for="username">Usuário:</label>
                    <input id="username" name="username" type="text" required />
                </div>
                <div class="campo">
                    <label for="password">Senha:</label>
                    <input id="password" name="password" type="password" required />
                </div>
                <div class="campo">
                    <label for="email">E-mail:</label>
                    <input id="email" name="email" type="email" required style="width:100%;padding:0.8rem 1.1rem;border-radius:8px;border:1px solid #d0d7de;font-size:1rem;outline:none;transition:border 0.2s;" />
                </div>
                <div class="campo">
                    <input value="Cadastrar" type="submit" class="btn-login" style="background:#2176ae;" />
                </div>
            </form>
            <div style="text-align:center;margin-top:1.2rem;">
                <a href="/portal" style="color:#2176ae;font-weight:600;text-decoration:none;">Já tem conta? Entrar</a>
            </div>
        </div>
    </div>
</body>
</html> 