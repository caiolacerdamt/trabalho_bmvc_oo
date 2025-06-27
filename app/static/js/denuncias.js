console.log('JavaScript carregado!');

document.addEventListener('DOMContentLoaded', function() {
    const filtroTipo = document.getElementById('filtro-tipo');
    const cards = document.querySelectorAll('.card-denuncia');
    const feedDenuncias = document.querySelector('.feed-denuncias');

    const mensagemNenhumaDenuncia = document.createElement('div');
    mensagemNenhumaDenuncia.className = 'nenhuma-denuncia';
    mensagemNenhumaDenuncia.style.cssText = `
        text-align: center;
        padding: 2rem;
        background-color: #f8f9fa;
        border-radius: 8px;
        margin: 2rem 0;
        color: #666;
        font-size: 1.2rem;
        display: none;
    `;
    mensagemNenhumaDenuncia.textContent = 'Nenhuma denúncia encontrada para este tipo.';
    feedDenuncias.appendChild(mensagemNenhumaDenuncia);

    filtroTipo.addEventListener('change', function() {
        const tipoSelecionado = this.value;
        let denunciasVisiveis = 0;
        
        cards.forEach(card => {
            const tipoDenuncia = card.querySelector('.tipo').textContent.split(': ')[1];
            
            if (tipoSelecionado === 'todos' || tipoDenuncia === tipoSelecionado) {
                card.style.display = 'block';
                card.style.animation = 'fadeIn 0.5s ease-out';
                denunciasVisiveis++;
            } else {
                card.style.display = 'none';
            }
        });

        if (denunciasVisiveis === 0) {
            mensagemNenhumaDenuncia.style.display = 'block';
        } else {
            mensagemNenhumaDenuncia.style.display = 'none';
        }
    });

    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };
    
    const observer = new IntersectionObserver(function(entries) {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
            }
        });
    }, observerOptions);
    
    cards.forEach((card, index) => {
        card.style.opacity = '0';
        card.style.transform = 'translateY(30px)';
        card.style.transition = `opacity 0.6s ease ${index * 0.1}s, transform 0.6s ease ${index * 0.1}s`;
        observer.observe(card);
    });
});

function criarBotaoTopo() {
    const botaoTopo = document.createElement('button');
    botaoTopo.innerHTML = '↑';
    botaoTopo.id = 'botao-topo';
    botaoTopo.style.cssText = `
        position: fixed;
        bottom: 20px;
        right: 20px;
        width: 40px;
        height: 40px;
        border-radius: 50%;
        background-color: #2c3e50;
        color: white;
        border: none;
        cursor: pointer;
        display: none;
        font-size: 20px;
        box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        transition: all 0.3s ease;
        z-index: 1000;
    `;

    document.body.appendChild(botaoTopo);

    window.addEventListener('scroll', function() {
        const botao = document.getElementById('botao-topo');
        if (window.scrollY > 100) {
            botao.style.display = 'block';
        } else {
            botao.style.display = 'none';
        }
    });

    botaoTopo.addEventListener('click', function() {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });

    botaoTopo.addEventListener('mouseover', function() {
        this.style.backgroundColor = '#3498db';
        this.style.transform = 'scale(1.1)';
    });

    botaoTopo.addEventListener('mouseout', function() {
        this.style.backgroundColor = '#2c3e50';
        this.style.transform = 'scale(1)';
    });
}

document.addEventListener('DOMContentLoaded', criarBotaoTopo);


document.addEventListener('DOMContentLoaded', function() {
    
    const filtroTipo = document.getElementById('filtro-tipo');
    const cardsDenuncias = document.querySelectorAll('.card-denuncia');
    
    if (filtroTipo) {
        filtroTipo.addEventListener('change', function() {
            const tipoSelecionado = this.value;
            
            cardsDenuncias.forEach(card => {
                const tipoDenuncia = card.querySelector('.tipo').textContent.replace('Tipo: ', '');
                
                if (tipoSelecionado === 'todos' || tipoDenuncia === tipoSelecionado) {
                    card.style.display = 'block';
                    card.style.animation = 'fadeIn 0.5s ease-out';
                } else {
                    card.style.display = 'none';
                }
            });
        });
    }
    
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };
    
    const observer = new IntersectionObserver(function(entries) {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.style.opacity = '1';
                entry.target.style.transform = 'translateY(0)';
            }
        });
    }, observerOptions);
    
    cardsDenuncias.forEach((card, index) => {
        card.style.opacity = '0';
        card.style.transform = 'translateY(30px)';
        card.style.transition = `opacity 0.6s ease ${index * 0.1}s, transform 0.6s ease ${index * 0.1}s`;
        observer.observe(card);
    });
    
    const formularios = document.querySelectorAll('.form-denuncia');
    
    formularios.forEach(form => {
        form.addEventListener('submit', function(e) {
            const campos = this.querySelectorAll('input[required], select[required], textarea[required]');
            let valido = true;
            
            campos.forEach(campo => {
                if (!campo.value.trim()) {
                    valido = false;
                    campo.style.borderColor = '#e74c3c';
                    campo.style.boxShadow = '0 0 0 3px rgba(231, 76, 60, 0.1)';
                    
                    setTimeout(() => {
                        campo.style.borderColor = '#e1e8ed';
                        campo.style.boxShadow = 'none';
                    }, 3000);
                } else {
                    campo.style.borderColor = '#e1e8ed';
                    campo.style.boxShadow = 'none';
                }
            });
            
            if (!valido) {
                e.preventDefault();
                mostrarNotificacao('Por favor, preencha todos os campos obrigatórios.', 'erro');
            }
        });
    });
    
    const botoesExcluir = document.querySelectorAll('.btn-excluir');
    
    botoesExcluir.forEach(botao => {
        botao.addEventListener('click', function(e) {
            if (!confirm('Tem certeza que deseja excluir esta denúncia? Esta ação não pode ser desfeita.')) {
                e.preventDefault();
            }
        });
    });
    
    function mostrarNotificacao(mensagem, tipo = 'info') {
        const notificacao = document.createElement('div');
        notificacao.className = `notificacao notificacao-${tipo}`;
        notificacao.innerHTML = `
            <div class="notificacao-conteudo">
                <span class="notificacao-mensagem">${mensagem}</span>
                <button class="notificacao-fechar">&times;</button>
            </div>
        `;

        notificacao.style.cssText = `
            position: fixed;
            top: 20px;
            right: 20px;
            background: ${tipo === 'erro' ? '#e74c3c' : tipo === 'sucesso' ? '#2ecc71' : '#3498db'};
            color: white;
            padding: 1rem 1.5rem;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.2);
            z-index: 10000;
            transform: translateX(400px);
            transition: transform 0.3s ease;
            max-width: 300px;
        `;
        
        document.body.appendChild(notificacao);
        
        setTimeout(() => {
            notificacao.style.transform = 'translateX(0)';
        }, 100);
        

        const botaoFechar = notificacao.querySelector('.notificacao-fechar');
        botaoFechar.addEventListener('click', () => {
            fecharNotificacao(notificacao);
        });
        
        setTimeout(() => {
            fecharNotificacao(notificacao);
        }, 5000);
    }
    
    function fecharNotificacao(notificacao) {
        notificacao.style.transform = 'translateX(400px)';
        setTimeout(() => {
            if (notificacao.parentNode) {
                notificacao.parentNode.removeChild(notificacao);
            }
        }, 300);
    }
    
    cardsDenuncias.forEach(card => {
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-10px) scale(1.02)';
        });
        
        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0) scale(1)';
        });
    });
    
    formularios.forEach(form => {
        form.addEventListener('submit', function() {
            const botaoSubmit = this.querySelector('button[type="submit"]');
            if (botaoSubmit) {
                const textoOriginal = botaoSubmit.textContent;
                botaoSubmit.textContent = 'Processando...';
                botaoSubmit.disabled = true;
                
                setTimeout(() => {
                    botaoSubmit.textContent = textoOriginal;
                    botaoSubmit.disabled = false;
                }, 3000);
            }
        });
    });
    
    const linksInternos = document.querySelectorAll('a[href^="#"]');
    
    linksInternos.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            const targetId = this.getAttribute('href').substring(1);
            const targetElement = document.getElementById(targetId);
            
            if (targetElement) {
                targetElement.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });
    
    function atualizarContadores() {
        const statusCounts = {
            'em-analise': 0,
            'em-andamento': 0,
            'resolvido': 0
        };
        
        cardsDenuncias.forEach(card => {
            const statusElement = card.querySelector('.status');
            if (statusElement) {
                const statusClass = Array.from(statusElement.classList).find(cls => 
                    cls.includes('analise') || cls.includes('andamento') || cls.includes('resolvido')
                );
                if (statusClass) {
                    statusCounts[statusClass] = (statusCounts[statusClass] || 0) + 1;
                }
            }
        });
        let contadoresContainer = document.querySelector('.contadores-status');
        if (!contadoresContainer) {
            contadoresContainer = document.createElement('div');
            contadoresContainer.className = 'contadores-status';
            contadoresContainer.style.cssText = `
                display: flex;
                gap: 1rem;
                margin-bottom: 2rem;
                justify-content: center;
                flex-wrap: wrap;
            `;
            
            const filtrosSection = document.querySelector('.filtros');
            if (filtrosSection) {
                filtrosSection.appendChild(contadoresContainer);
            }
        }
        
        contadoresContainer.innerHTML = `
            <div class="contador" style="background: linear-gradient(45deg, #ffeeba, #ffc107); padding: 0.5rem 1rem; border-radius: 20px; color: #856404; font-weight: 600;">
                Em Análise: ${statusCounts['em-analise'] || 0}
            </div>
            <div class="contador" style="background: linear-gradient(45deg, #b8daff, #007bff); padding: 0.5rem 1rem; border-radius: 20px; color: white; font-weight: 600;">
                Em Andamento: ${statusCounts['em-andamento'] || 0}
            </div>
            <div class="contador" style="background: linear-gradient(45deg, #c3e6cb, #28a745); padding: 0.5rem 1rem; border-radius: 20px; color: white; font-weight: 600;">
                Resolvido: ${statusCounts['resolvido'] || 0}
            </div>
        `;
    }
    
    if (cardsDenuncias.length > 0) {
        atualizarContadores();
    }
    
    if (filtroTipo) {
        filtroTipo.addEventListener('change', atualizarContadores);
    }
    
    console.log('Sistema de Denúncias Urbanas carregado com sucesso!');
});
