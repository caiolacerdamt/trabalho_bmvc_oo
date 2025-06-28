<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{denuncia.titulo}} - Sistema de Denúncias Urbanas</title>
    <link rel="stylesheet" href="/static/css/base.css">
    <link rel="stylesheet" href="/static/css/detalhes.css">
</head>
<body>
    <header>
        <h1>Detalhes da Denúncia</h1>
        <nav>
            <ul>
                <li><a href="/">Página Inicial</a></li>
                <li><a href="/denuncias">Denúncias</a></li>
                <li><a href="/denuncias/nova">Nova Denúncia</a></li>
            </ul>
        </nav>
    </header>

    <main>
        <section class="denuncia-detalhes">
            <div class="card-denuncia-completo">
                <div class="header-detalhes">
                    <h2>{{denuncia.titulo}}</h2>
                    <span class="status {{denuncia.status.lower().replace(' ', '-').replace('á', 'a').replace('ã', 'a')}}">{{denuncia.status}}</span>
                </div>
                
                <div class="info-denuncia">
                    <div class="campo-info">
                        <strong>Tipo:</strong>
                        <span>{{denuncia.tipo}}</span>
                    </div>
                    
                    <div class="campo-info">
                        <strong>Endereço:</strong>
                        <span>{{denuncia.endereco}}</span>
                    </div>
                    
                    <div class="campo-info">
                        <strong>Descrição:</strong>
                        <p>{{denuncia.descricao}}</p>
                    </div>
                </div>

                <div class="acoes-denuncia">
                    <a href="/denuncias/{{denuncia.id}}/editar" class="btn-editar">✏</a>
                    <form action="/denuncias/{{denuncia.id}}/excluir" method="POST" style="display:inline;" onsubmit="return confirm('Tem certeza que deseja excluir esta denúncia?')">
                        <button type="submit" class="btn-excluir">🗑</button>
                    </form>
                    <a href="/denuncias" class="btn-voltar">↩</a>
                </div>
            </div>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 Sistema de Denúncias Urbanas - Todos os direitos reservados</p>
    </footer>
</body>
</html>