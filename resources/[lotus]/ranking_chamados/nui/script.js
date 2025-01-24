$(document).ready(function () {

    var actionContainer = $("#container");
    window.addEventListener('message', function (event) {

        let item = event.data;

        if (item.showmenu) {
            actionContainer.fadeIn(500);
            $('.select').removeClass('select');
            $('#lista').html('');

            item.ranking.slice(0, 20).map(function (item, index) {
                $('#lista').append(`                        
                    <div class="item">
                        <div class="itemPos" id="id${index + 1}">${index + 1}°</div>
                        <div class="itemName" id="name${index}">Boliva RevolutioN</div>
                        <div class="itemValor">${item.qtd}</div>
                    </div>
                `);


                $('#id1').addClass('first');
                $('#id2').addClass('second');
                $('#id3').addClass('third');
            });


            item.name.slice(0, 20).map(function(item, index){
                $('#name'+index).html(`${item.name}`)
            });
        } else {
            actionContainer.fadeOut(500);
        }

    });


    document.onkeyup = function (data) {
        if (data.which == 27) {
            if ($('#container').is(":visible")) {
                $.post("http://ranking_chamados/close", JSON.stringify({}), function (datab) { });
            }
        }
    };
})