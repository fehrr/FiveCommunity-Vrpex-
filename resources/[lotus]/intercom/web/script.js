let globalIndex = '';
let globalName = '';

window.addEventListener('message', ({ data }) => {
    if (data.action == 'open') {
        $('#container').css('opacity', '1');

        $('.nameFac').html(data.info.name.toUpperCase());


        $('.listButtons').html('')

        Object.keys(data.info.buttons).map((item, index) => {
            $('.listButtons').append(`
                <button class="select_menu_wrapper">
                    <div class="flex">
                        <p>${item}</p><span>INTERFONAR</span>
                    </div>
                    <div class="bell" onclick="callIntercom('${data.info.name}', '${item}')">
                        <img src="./imgs/bell.svg" alt="">
                    </div>
                </button>
            `);
        })
    }
})


document.onkeyup = function (data) {
    if (data.which == 27) {
        $.post(`http://${window.GetParentResourceName()}/close`, JSON.stringify({}));
        $('#container').css('opacity', '0')
    }
};


const callIntercom = (name, index) => {
    
    $.post(`http://${window.GetParentResourceName()}/useButton`, JSON.stringify({
        name,
        button: index
    }))
}


