<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>{{denuncia.titulo}} - Sistema de Denúncias Urbanas</title>
    <link rel="stylesheet" href="/static/css/base.css">
    <link rel="stylesheet" href="/static/css/detalhes.css">
    <style>
        .detalhes-container {
            max-width: 900px;
            margin: 2.5rem auto;
            background: #fff;
            border-radius: 18px;
            box-shadow: 0 6px 32px rgba(33, 118, 174, 0.08);
            padding: 0 0 2.5rem 0;
        }
        .detalhes-header {
            background: linear-gradient(90deg, #2176ae 0%, #34c759 100%);
            color: #fff;
            border-radius: 18px 18px 0 0;
            padding: 2.5rem 2.5rem 1.5rem 2.5rem;
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            position: relative;
        }
        .detalhes-header h2 {
            font-size: 2.2rem;
            font-weight: 800;
            margin-bottom: 0.7rem;
            letter-spacing: 0.5px;
        }
        .detalhes-status {
            display: flex;
            align-items: center;
            gap: 0.7rem;
            margin-bottom: 0.5rem;
        }
        .detalhes-status .status {
            font-size: 1.1rem;
            font-weight: 700;
            padding: 0.5rem 1.3rem;
            border-radius: 20px;
            background: rgba(255,255,255,0.18);
            border: 2px solid #fff;
            text-transform: uppercase;
        }
        .detalhes-header .acoes {
            position: absolute;
            top: 2.5rem;
            right: 2.5rem;
            display: flex;
            gap: 0.7rem;
        }
        .detalhes-header .acoes a, .detalhes-header .acoes form {
            display: inline-block;
        }
        .detalhes-header .acoes .btn-editar, .detalhes-header .acoes .btn-excluir, .detalhes-header .acoes .btn-voltar {
            width: 44px;
            height: 44px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.3rem;
            border: none;
            background: #fff;
            color: #2176ae;
            box-shadow: 0 2px 8px rgba(33, 118, 174, 0.08);
            transition: background 0.2s, color 0.2s;
            margin-left: 0;
        }
        .detalhes-header .acoes .btn-editar:hover {
            background: #34c759;
            color: #fff;
        }
        .detalhes-header .acoes .btn-excluir:hover {
            background: #e74c3c;
            color: #fff;
        }
        .detalhes-header .acoes .btn-voltar:hover {
            background: #2176ae;
            color: #fff;
        }
        .detalhes-info {
            padding: 2.5rem;
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 2.5rem 2rem;
        }
        .info-card {
            background: #f8f9fa;
            border-radius: 12px;
            padding: 1.5rem 1.2rem;
            box-shadow: 0 1px 4px rgba(33, 118, 174, 0.04);
            display: flex;
            flex-direction: column;
            gap: 0.7rem;
        }
        .info-card strong {
            color: #2176ae;
            font-size: 1.05rem;
            font-weight: 700;
            margin-bottom: 0.2rem;
        }
        .info-card span, .info-card p {
            color: #222;
            font-size: 1.08rem;
        }
        .info-card p {
            margin: 0;
        }
        @media (max-width: 900px) {
            .detalhes-info {
                grid-template-columns: 1fr;
                gap: 1.5rem;
                padding: 1.5rem;
            }
            .detalhes-header {
                padding: 2rem 1.2rem 1.2rem 1.2rem;
            }
        }
        @media (max-width: 600px) {
            .detalhes-container {
                padding: 0 0 1rem 0;
            }
            .detalhes-header {
                padding: 1.2rem 0.7rem 1rem 0.7rem;
            }
            .detalhes-info {
                padding: 1rem;
            }
        }
    </style>
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
        <div class="detalhes-container">
            <div class="detalhes-header">
                <h2><span class="icone-titulo">📢</span>{{denuncia.titulo}}</h2>
                <div class="detalhes-status">
                    % if usuario_atual == 'admin':
                        <form action="/denuncias/{{denuncia.id}}/alterar_status" method="post" style="display:inline-flex;align-items:center;gap:0.5em;">
                            <select name="status" style="font-size:1.05em;padding:0.3em 0.8em;border-radius:8px;border:1.5px solid #2176ae;outline:none;">
                                <option value="Em Análise" % if denuncia.status == 'Em Análise': %selected% endif %>Em Análise</option>
                                <option value="Em Andamento" % if denuncia.status == 'Em Andamento': %selected% endif %>Em Andamento</option>
                                <option value="Resolvido" % if denuncia.status == 'Resolvido': %selected% endif %>Resolvido</option>
                            </select>
                            <button type="submit" style="background:#2176ae;color:#fff;border:none;padding:0.3em 1em;border-radius:8px;font-weight:600;cursor:pointer;">Alterar</button>
                        </form>
                    % elif denuncia.status == 'Em Análise':
                        <span class="status em-analise-destaque">
                            <span class="icone-status">⏳</span> {{denuncia.status}}
                        </span>
                    % else:
                        <span class="status {{denuncia.status.lower().replace(' ', '-').replace('á', 'a').replace('ã', 'a')}}">
                            <span class="icone-status">
                                % if denuncia.status == 'Em Andamento':
                                    🚧
                                % elif denuncia.status == 'Resolvido':
                                    ✅
                                % else:
                                    📋
                                % end
                            </span> {{denuncia.status}}
                        </span>
                    % end
                </div>
                <div class="acoes">
                    % if denuncia.usuario == usuario_atual:
                        <a href="/denuncias/{{denuncia.id}}/editar" class="btn-editar" title="Editar">
                            <span class="icone-acao">✏️</span>
                        </a>
                        <form action="/denuncias/{{denuncia.id}}/excluir" method="POST" style="display:inline;" onsubmit="return confirm('Tem certeza que deseja excluir esta denúncia?')">
                            <button type="submit" class="btn-excluir" title="Excluir">
                                <span class="icone-acao">🗑️</span>
                            </button>
                        </form>
                    % end
                    <a href="/denuncias" class="btn-voltar" title="Voltar">
                        <span class="icone-acao">↩️</span>
                    </a>
                </div>
            </div>
            <div class="detalhes-info">
                <div class="info-card">
                    <strong>Tipo</strong>
                    <span>🏷️ {{denuncia.tipo}}</span>
                </div>
                <div class="info-card">
                    <strong>Endereço</strong>
                    <span>📍 {{denuncia.endereco}}</span>
                </div>
                <div class="info-card" style="grid-column:1/-1;">
                    <strong>Descrição</strong>
                    <p>{{denuncia.descricao}}</p>
                </div>
            </div>
            <!-- Comentários -->
            <section class="comentarios" style="max-width:700px;margin:2.5rem auto 0 auto;background:#f8f9fa;padding:2rem 2rem 1.5rem 2rem;border-radius:16px;box-shadow:0 2px 12px rgba(33,118,174,0.04);">
                <h3 style="font-size:1.4rem;font-weight:700;margin-bottom:1.2rem;color:#2176ae;">Comentários</h3>
                <ul id="lista-comentarios" style="list-style:none;padding:0;margin-bottom:1.5rem;">
                    % if denuncia.comentarios:
                        % for c in denuncia.comentarios:
                            <li class="comentario-item" data-id="{{c.get('id','')}}" style="background:#fff;border-radius:10px;padding:1rem 1.2rem;margin-bottom:1rem;display:flex;align-items:center;justify-content:space-between;box-shadow:0 1px 4px rgba(33,118,174,0.03);">
                                <div>
                                    <strong style="color:#2176ae;">{{c.get('usuario', 'Anônimo')}}</strong>: <span style="color:#333;">{{c.get('texto', '')}}</span>
                                    <span style="font-size:0.85em;color:#888;margin-left:8px;">({{c.get('data', '')}})</span>
                                </div>
                                % if c.get('usuario', 'Anônimo') == usuario_atual:
                                <button class="btn-excluir-comentario" title="Excluir comentário" onclick="removerComentario(this)" style="background:#e74c3c;border:none;color:#fff;border-radius:50%;width:32px;height:32px;display:flex;align-items:center;justify-content:center;cursor:pointer;font-size:1.1em;margin-left:10px;"><span style="pointer-events:none;">🗑</span></button>
                                % end
                            </li>
                        % end
                    % end
                </ul>
                <div style="display:flex;gap:0.5rem;align-items:center;">
                    <input id="campo-comentario" type="text" placeholder="Digite seu comentário" style="flex:1;padding:0.8rem 1.1rem;border-radius:8px;border:1px solid #d0d7de;font-size:1rem;outline:none;transition:border 0.2s;">
                    <button onclick="enviarComentario()" style="background:#2176ae;color:#fff;border:none;padding:0.8rem 1.5rem;border-radius:8px;font-weight:600;font-size:1rem;cursor:pointer;transition:background 0.2s;">Enviar</button>
                </div>
            </section>
            <script>
            const denunciaId = "{{denuncia.id}}";
            const usuario = "{{usuario_atual}}";
            const ws = new WebSocket("ws://" + window.location.host + "/ws/comentarios/" + denunciaId);
            ws.onmessage = function(event) {
                const data = JSON.parse(event.data);
                if (data.acao === 'excluir') {
                    removerComentarioPorId(data.id);
                } else {
                    adicionarComentarioNaTela(data);
                }
            };
            function enviarComentario() {
                const campo = document.getElementById("campo-comentario");
                const texto = campo.value.trim();
                if (!texto) return;
                const comentario = {
                    usuario: usuario,
                    texto: texto,
                    data: new Date().toLocaleString(),
                    id: String(Date.now())
                };
                ws.send(JSON.stringify(comentario));
                campo.value = "";
            }
            function adicionarComentarioNaTela(comentario) {
                if (document.querySelector(`li.comentario-item[data-id='${comentario.id}']`)) return;
                const lista = document.getElementById("lista-comentarios");
                const item = document.createElement("li");
                item.className = "comentario-item";
                item.setAttribute('data-id', comentario.id);
                item.style = "background:#fff;border-radius:10px;padding:1rem 1.2rem;margin-bottom:1rem;display:flex;align-items:center;justify-content:space-between;box-shadow:0 1px 4px rgba(33,118,174,0.03);";
                const conteudo = document.createElement("div");
                conteudo.innerHTML = `<strong style='color:#2176ae;'>${comentario.usuario}</strong>: <span style='color:#333;'>${comentario.texto}</span> <span style='font-size:0.85em;color:#888;margin-left:8px;'>(${comentario.data})</span>`;
                item.appendChild(conteudo);
                if (comentario.usuario === usuario) {
                    const btn = document.createElement("button");
                    btn.className = "btn-excluir-comentario";
                    btn.title = "Excluir comentário";
                    btn.style = "background:#e74c3c;border:none;color:#fff;border-radius:50%;width:32px;height:32px;display:flex;align-items:center;justify-content:center;cursor:pointer;font-size:1.1em;margin-left:10px;";
                    btn.innerHTML = '<span style="pointer-events:none;">🗑</span>';
                    btn.onclick = function() { removerComentario(btn); };
                    item.appendChild(btn);
                }
                lista.appendChild(item);
            }
            function removerComentario(botao) {
                const li = botao.closest("li");
                if (li) {
                    const id = li.getAttribute('data-id');
                    ws.send(JSON.stringify({acao: 'excluir', id: id}));
                }
            }
            function removerComentarioPorId(id) {
                const li = document.querySelector(`li.comentario-item[data-id='${id}']`);
                if (li) li.remove();
            }
            document.getElementById('campo-comentario').addEventListener('keydown', function(e) {
                if (e.key === 'Enter') {
                    e.preventDefault();
                    enviarComentario();
                }
            });
            </script>
        </div>
    </main>
    <footer>
        <p>&copy; 2024 Sistema de Denúncias Urbanas - Todos os direitos reservados</p>
    </footer>
</body>
</html>