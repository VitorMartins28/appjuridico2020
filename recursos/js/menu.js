$(document).ready(function() {

    $('.list-cliente').click(function() {
        $('.conteudo').load('src/clientes/visao/list-cliente.html')
    })

    $('.list-tipo_processo').click(function() {
        $('.conteudo').load('src/tipos_processos/visao/list-tipos_processo.html')
    })

})