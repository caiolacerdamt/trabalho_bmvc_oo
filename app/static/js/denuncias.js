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

                card.style.opacity = '0';
                setTimeout(() => {
                    card.style.opacity = '1';
                }, 50);
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
