const app = {
  questions: [
    { 
      question: 'Foi cometida uma infração contra mim, como posso resolver?', 
      response: 'Entre em contato com a nossa staff através da aba de tickets, detalhe o contexto de maneira reduzida e apresente as provas do ocorrido.' 
    },
    { 
      question: 'Não estou conseguindo ouvir nem falar com os outros players ao meu redor', 
      response: 'Isso está ocorrendo, provavelmente por conta do seu bate-papo que se encontra desligado. Para ativar seu bate-papo, Pressione ESC, va a aba de configurações, bate-papo, e ligue apertando na primeira opção. Logo após, ajuste os volumes de acordo com suas preferências.' 
    },
    { 
      question: 'Como posso entrar em alguma organização existente na cidade?', 
      response: 'Temos no nosso discord, uma aba de trabalhos em organizações, identificadas como #Querotrabalhar, la vc encontrará as formas de ingressar em cada organização' 
    },
    { 
      question: 'Como posso desativar a musica que algum player está reproduzindo?', 
      response: 'Basta apertar F8, e digitar o seguinte comando: "Som off", sem as aspas, e vc desligará o seu sistema de spotify (Não irá ouvir a musica que ngm colocar), para religar, basta usar o comando "som on"' 
    },
    { 
      question: 'Como faço pra desequipar as armas?', 
      response: 'Basta apertar F8, e digitar o seguinte comando: "Garmas", sem as aspas. Isso fará que suas armas equipadas, voltem para a mochila' 
    },
    { 
      question: 'Como posso sair da organização/Facção que faço parte?', 
      response: 'Aperte F8, e digite o seguinte comando: "org", sem as aspas, na parte superior, terá uma função chamada "pedir contas", basta selecionar a mesma, e você sairá automaticamente. Em caso de organizações policiais, use o comando: mdt, va a aba Dashboard e selecione a função "Pedir contas".' 
    },
  ],

  open: function ({ serviceName }) {
    if (serviceName !== 'god') {
      document.querySelector('#app header p').innerText = `(CALL ${serviceName.toUpperCase()})`;
      document.querySelector('#app footer h3').innerText =
        `Caso tenha sofrido um acidente, faça um chamado para os ${serviceName}s!`;
      document.querySelector('#app main').style.display = 'none';
    } else {
      document.querySelector('#app header p').innerText = '(CALL GOD)';
      document.querySelector('#app footer h3').innerText =
        'Caso nenhuma das suas dúvidas foram sanadas, faça um chamado!';
      document.querySelector('#app main').style.display = 'block';
      app.addQuestions();
    }
    document.querySelector('#app').style.display = 'block';
  },

  close: function () {
    document.querySelector('#app .answers').innerHTML = "";
    document.querySelector('#app').style.display = 'none';
    fetch('http://hub/close', { method: 'POST' });
  },

  addQuestions: function () {
    app.questions.forEach(question => {
      document.querySelector('.answers').innerHTML += `
        <div class="answer">
          <div class="title">
            <p>${question.question}</p>
            <img src="./assets/close.svg" alt="Close" onclick="app.openQuestion(this)" style="cursor: pointer;">
          </div>
          <div class="content">
            <p>${question.response}</p>
          </div>
        </div>
      `
    })
  },

  openQuestion: function (element) {
    const content = element.parentElement.parentElement.querySelector('.content');
    if (window.getComputedStyle(content).display === 'none') {
      if (element.classList.contains('close')) element.classList.remove('close');
      element.classList.add('open');
      content.style.display = 'block';
      content.querySelector('p').classList.add('show')
    } else {
      if (element.classList.contains('open')) element.classList.remove('open');
      element.classList.add('close')
      content.style.display = 'none';
      content.querySelector('p').classList.remove('show')
    }
  },

  sendCall: function () {
    fetch('http://hub/sendCall', {
      method: 'POST',
      body: JSON.stringify({
        description: document.querySelector('input').value
      })
    })
  }
}

const Hub = {
  requestsCount: 0,
  notificationsCount: 0,
  muted: false,
  toggle: function (open) {
    if (open) $("main#hub").fadeIn();
    else $("main#hub").fadeOut();
  },
  toggleMuted: function () {
    if (Hub.muted) {
      Hub.muted = false;
      $("#ouvir").html("silenciar");
    } else {
      Hub.muted = true;
      $("#ouvir").html("ouvir");
    }
  },
  addTemporaryNotification: function (type, title, description, persistent) {
    let temporaryId = Date.now();
    let persistentClass = "";

    if (persistent) persistentClass = " will-be-persistent";

    let elementTemporary = `
        <div class="notify hub-notification${persistentClass}" id="notification-${temporaryId}" hidden>
            <i class="fa-solid fa-bells"></i>
            <div class="text">
                <span><b>${title}</b></span>
                <p>${description}</p>
            </div>
        </div>`;

    $("#hub-tray").prepend(elementTemporary);
    $("#notification-" + temporaryId).fadeIn(200, function () {
      setTimeout(function () {
        $("#notification-" + temporaryId).fadeOut(200, function () {
          $("#notification-" + temporaryId).remove();
        });
      }, 20000);
    });

    Hub.playAudio();
  },
  addNotification: function (type, title, description, persistent) {
    Hub.addTemporaryNotification(type, title, description, persistent);

    if (persistent) {
      let date = Hub.getDate();
      let elementPersistent = `
            <div class="notify-item">
                <small>${title} - ${date}</small>
                <p>${description}</p>
            </div>`;

      $(".notify-bell").fadeIn();
      Hub.updateNotifys();

      if (Hub.notificationsCount == 0) {
        if (Hub.requestsCount > 0)
          $("#hub").removeClass("lists-1").addClass("lists-2");
        $("[notification-type='regular']").fadeIn();
      }

      $(".hub-notifications[notification-type='regular']").prepend(
        elementPersistent
      );
      Hub.notificationsCount++;
    }
  },
  updateNotifys: function () {
    $("listnotify .notify-item").each(function (i) {
      $(".notify-bell .number").html((i += 1));
    });
  },
  clearNotifications: function () {
    $("listnotify").html("");
    $(".notify-bell").fadeOut();
  },
  addRequest: function (type, title, description, id) {
    Hub.addTemporaryNotification(type, title, description, true);
    let date = Hub.getDate();
    let element = `
        <div class="item hub-notification" request-id="${id}">
            <div class="info-item">
                <small>${title} - ${date}</small>
                <p>${description}</p>
            </div>
            <div class="actions-item">
                <button class="hub-notification-option-accept" onclick="Hub.tryAcceptRequest(this)"><i class="fa-solid fa-check"></i></button>
                <button class="hub-notification-option-remove" onclick="Hub.denyRequest(this)"><i class="fa-solid fa-xmark"></i></button>
            </div>
        </div>`;

    $("#hub-empty").fadeOut();
    if (Hub.requestsCount == 0) {
      if (Hub.notificationsCount > 0)
        $("#hub").removeClass("lists-1").addClass("lists-2");

      $("[notification-type='request']").fadeIn();
    }

    $(".hub-notifications[notification-type='request']").prepend(element);
    Hub.requestsCount++;
  },
  tryAcceptRequest: function (element) {
    if ($(element).parent().parent().hasClass("hub-notification-accepted"))
      return false;

    let requestId = $(element).parent().parent().attr("request-id");
    $.post("http://hub/tryAcceptRequest", JSON.stringify({ id: requestId }));
    $(element).parent().parent().remove();
  },
  denyRequest: function (element) {
    $(element)
      .parent()
      .parent()
      .fadeOut(200, function () {
        $(element).parent().parent().remove();
      });

    Hub.requestsCount--;

    if (Hub.requestsCount == 0) {
      $("[notification-type='request']").fadeOut(200, function () {
        $("#hub").removeClass("lists-2").addClass("lists-1");
      });

      if (Hub.notificationsCount == 0) $("#hub-empty").fadeIn();
    }
  },
  setAcceptedRequest: function (requestId, playerId) {
    if (playerId == "ok") {
      $(".hub-notification[request-id='" + requestId + "']")
        .addClass("hub-notification-accepted")
        .children(".actions-item")
        .removeClass("options-2")
        .addClass("options-1")
        .children(".hub-notification-option-accept")
        .remove();
    } else {
      $(".hub-notification[request-id='" + requestId + "']")
        .children(".actions-item")
        .children(".hub-notification-option-accept")
        .addClass("hub-notification-option-accepted")
        .removeClass("hub-notification-option-accept")
        .html("Atendido por " + playerId);
      $(".hub-notification[request-id='" + requestId + "']")
        .children(".actions-item")
        .children(".hub-notification-option-remove")
        .trigger("click");
    }
  },
  playAudio: function () {
    if (!Hub.muted) $("#hub-audio")[0].play();
  },
  getDate: function () {
    let date = new Date();
    const [h, m, D, M] = [
      date.getHours(),
      date.getMinutes(),
      date.getDate(),
      date.getMonth() + 1,
    ]
      .map(String)
      .map((s) => s.padStart(2, 0));
    return `${h}:${m} ${D}/${M}`;
  },
};

function openNotifys() {
  $(".notify-content").is(":visible") ? $(".notify-content").hide("slow") : $(".notify-content").show("slow");
}

window.addEventListener("message", function (event) {
  let received = event.data;
  switch (received.action) {
    case "toggleRequests":
      document.querySelector('#hub-tray').style.opacity = received.disabled ? 0 : 1
      break
    case "open":
      Hub.toggle(true);
      break;
    case "addNotification":
      Hub.addNotification(
        received.type,
        received.title,
        received.description,
        received.persistent
      );
      Hub.updateNotifys();
      break;
    case "addRequest":
      Hub.addRequest(
        received.type,
        received.title,
        received.description,
        received.id
      );
      break;
    case "setAcceptedRequest":
      Hub.setAcceptedRequest(received.id, received.user_id);
      break;
    case "faq:open":
      app.open(received);
      break;
    case "faq:close": 
    app.close()
    break;
  }
});


window.addEventListener('keyup', ({key}) => {
  if (key === 'Escape' && document.querySelector('#app').style.display === 'block') app.close();
})

window.onkeyup = function (data) {
  if (data.which == 27) {
    Hub.toggle(false);
    $(".notify-content").hide("slow");
    $.post("http://hub/close", JSON.stringify({}));
  } else if (data.which == 9) {
    Hub.toggleMuted();
  }
};
