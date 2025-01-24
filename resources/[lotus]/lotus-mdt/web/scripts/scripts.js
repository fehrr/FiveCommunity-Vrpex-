const app = {
  ranks: [],
  open: function ({ user, members, requests, ranks, isAdmin }) {
    app.ranks = Object.entries(ranks);
    app.ranks.sort(([_A, valueA], [_B, valueB]) => valueA.tier - valueB.tier)

    document.body.style.display = 'flex';

    app.dashboard.members.length = 0
    app.registers.requests.length = 0

    app.dashboard.members.push(...Object.values(members))
    app.registers.requests.push(...Object.values(requests))

    app.dashboard.constructElements()

    app.dashboard.reloadMembers()
    app.registers.reloadRequests()
    document.querySelector('section.sidebar .profile .infos .name').innerHTML = `
      <h3>${user.name}</h3>
      <p>${user.group.role}</p>
    `;

    const time = new Date().getTime() - new Date(user.uptime * 1000).getTime()
    const atualTime = new Date(time)
    // document.querySelector('section.sidebar .profile .infos .uptime span').innerText = `${String(atualTime.getHours()).padStart(2, '0')}:${String(atualTime.getMinutes()).padStart(2, '0')}:${String(atualTime.getSeconds()).padStart(2, '0')}`
    document.querySelector('section.sidebar .profile .infos .uptime span').innerText = `${String(Math.floor(time / 1000 / 60 / 60)).padStart(2, '0')}:${String(Math.floor(time / 1000 / 60)).padStart(2, '0')}:${String(Math.floor(time / 1000)).padStart(2, '0')}`


    if (isAdmin || ranks[user.group.role].permissions.hire) {
      const inputGroupsElement = document.querySelector('.container > .invite > div > select#inputGroups')
      inputGroupsElement.innerHTML = app.ranks.filter(([_, value]) => isAdmin || value.tier < user.group.tier).map(([key, value]) => `
        <option value = '${key}'>
          ${key}
        </option>
      `).join(" ")
    } else {
      document.querySelector('.members #actions').style.display = 'none';
    }

    /* if (['coronelgtf', 'inspetorespecialgtf', 'recrutadorcivil', 'supervisorcot', 'comandochoque', 'comando', 'coronel', 'major', 'tenente', 'delegado', 'admin'].filter((u) => user.group.role.toLowerCase().includes(u)).length === 0) {
      if (!user.isAdmin) {
        document.querySelector('.members #actions').style.display = 'none';
      }
    } else {
      const indexOfRole = user.isAdmin ? this.ranksOfRole.length + 1 : this.ranksOfRole.findIndex(r => r.toLowerCase() == user.group.role.toLowerCase())
      document.querySelector('.container > .invite > div > select#inputGroups').innerHTML =
      this.ranksOfRole
        .filter((_, i) => {
          if (user.isAdmin) return true
          return i < indexOfRole
        })
        .map((rank) => `
          <option value = '${rank}'>
            ${rank}
          </option>
        `)
        .join(' ');
    } */
  },

  close: function () {
    document.body.style.display = 'none';
    window.location.reload();
  },

  post: function (url, body) {
    return fetch('https://lotus-mdt/' + url, {
      method: 'POST',
      body: JSON.stringify(body)
    })
  },

  dashboard: {
    members: [],
    sortStyle: '01',

    constructElements: function () {
      const onlineContainer = document.querySelector(`#dashboard .members .tbody[data-status="1"]`)
      const offlineContainer = document.querySelector(`#dashboard .members .tbody[data-status="0"]`)

      onlineContainer.innerHTML = '';
      offlineContainer.innerHTML = '';

      const membersOffline = this.members.filter(member => member.status == 0)
      const membersOnline = this.members.filter(member => member.status == 1)

      offlineContainer.innerHTML = `
        ${membersOffline.map(member => `
          <div class = 'member'>
            <span>${member.name}</span>
            <span>${member.user_id}</span>
            <span>${member.group.role}</span>
            <span>${member.last_login}</span>
          </div>
        `).join(" ")}
      `;

      onlineContainer.innerHTML = `
        ${membersOnline.map(member => `
          <div class = 'member'>
            <span>${member.name}</span>
            <span>${member.user_id}</span>
            <span>${member.group.role}</span>
            <span>${member.last_login}</span>
          </div>
        `).join(" ")}
      `;

      document.querySelector('#dashboard .header .actives').innerHTML =
        `${membersOnline.length}/<b>${this.members.length}</b>`
    },

    selectMenu: function (element, menuId) {
      if (element.classList.contains(menuId)) return;

      document.querySelector('.sidebar ul li.selected')?.classList.remove('selected')
      element.classList.add('selected')

      document.querySelector('section.content > div.selected')?.classList.remove('selected')
      document.querySelector('section.content > #' + menuId)?.classList.add('selected')
    },
    filterMembers: function (element, status) {
      app.dashboard.reloadMembers(status)
      document.querySelector('#dashboard .members .filter button.selected')?.classList.remove('selected')
      element.classList.add('selected')
    },
    filterSearch: function (element) {
      const value = element.value;
      document.querySelectorAll(`#dashboard .members .tbody`).forEach((el) => el.style.display = 'none')
      const container = document.querySelector('#dashboard .members .tbody[data-status="search"]')
      container.style.display = 'flex'
      container.innerHTML = ''
      const filteredMembers = app.dashboard.members.filter(member =>
        String(member.user_id).includes(value)
        || member.name.toLowerCase().includes(value)
        || member.group.role.toLowerCase().includes(value)
      )
      container.innerHTML = filteredMembers.map(member => `
        <div class = 'member'>
          <span>${member.name}</span>
          <span>${member.user_id}</span>
          <span>${member.group.role}</span>
          <span>${member.last_login}</span>
        </div>
      `).join(" ");
    },
    reloadMembers: function (status = 1) {
      document.querySelectorAll(`#dashboard .members .tbody`).forEach((el) => el.style.display = 'none')

      const container = document.querySelector(`#dashboard .members .tbody[data-status="${status}"]`)
      container.style.display = 'flex'
    },
    pressCode: function (code) {
      app.post('pressCode', {
        code: code.toUpperCase(),
      })
    },
    demote: function () {
      app.post('demote')
      app.close()
      app.post('close')
    },

    sort: function (type) {
      if (type === 'role') {
        if (this.sortStyle === '01') {
          app.dashboard.sortStyle = '10'
          app.dashboard.members.sort((a, b) => a.group.tier - b.group.tier)
        } else {
          app.dashboard.sortStyle = '01'
          app.dashboard.members.sort((a, b) => b.group.tier - a.group.tier)
        }
        console.log()
        app.dashboard.constructElements()
      }
    }
  },

  consult: {
    selectCategory: function (element, type) {
      if (element.classList.contains('selected')) return;

      document.querySelector('#consult .content .categories div.selected').classList.remove('selected')
      element.classList.add('selected')

      document.querySelector('#consult .content input.selected').classList.remove('selected')
      document.querySelector('#consult .content input#' + type).classList.add('selected')
    },

    search: function (type) {
      const searchInput = document.querySelector('#consult .content input#' + type)
      app.post('consult', {
        type,
        value: searchInput.value,
      })
        .then(res => res.json())
        .then(res => {
          if (type === 'prisons') {
            const finalMessage = Object.entries(res).map(([key, value]) => {
              const time = new Date(Number(key) * 1000)
              return `
                <div class = 'item'>
                  <span>${String(time.getDate()).padStart(2, '0')}/${String(time.getMonth()).padStart(2, '0')}/${String(time.getFullYear()).padStart(2, '0')}</span>
                  <span>${value.motivo}</span>
                </div>
              `;
            })
            document.querySelector('#consult .content .result .result-text').innerHTML = `
              ${res.length !== 0 ? `
                <div class = 'list'>
                  ${finalMessage.join('')}
                </div>
              `: 'Nenhuma prisão!'}
            `;
          } else {
            document.querySelector('#consult .content .result .result-text').innerHTML = res
          }
        })
    }
  },

  registers: {
    requests: [],

    sendMessage: function () {
      const messageInput = document.querySelector('#registers .content .chat .input > input[type=text]')
    },

    reloadRequests: function () {
      const container = document.querySelector('#registers .content .container-request')
      container.innerHTML = ''
      for (const request of app.registers.requests) {
        const createdAt = new Date(request.created_at)
        const createdAtString = `${createdAt.getDate()}.${String(createdAt.getMonth() + 1).padStart(2, '0')}.${createdAt.getFullYear()} às ${String(createdAt.getHours()).padStart(2, '0')}:${String(createdAt.getMinutes()).padStart(2, '0')}`
        const timestamp = new Date(request.timestamp)
        const timestampString = `${timestamp.getDate()}.${String(timestamp.getMonth() + 1).padStart(2, '0')}.${timestamp.getFullYear()} às ${String(timestamp.getHours()).padStart(2, '0')}:${String(timestamp.getMinutes()).padStart(2, '0')}`

        container.innerHTML += `
          <div class = 'request'>
            <img src="./assets/bandido.png" alt="">
            <div>
              <div class = 'main'>
                <h5>Ação: ${request.title}</h5>
                <p>Enviada em ${createdAtString}</p>
              </div>
              <div class = 'functions'>
                <div>
                  <button onclick = 'app.registers.accept(${request.id})'>Aceitar</button>
                  <button onclick = 'app.registers.refuse(${request.id})'>Recusar</button>
                </div>
                <span>Definido para <p>${timestampString}</p></span>
              </div>
            </div>
          </div>
        `;
      }
    },

    accept: function (id) {
      app.post('requestAccept', {
        id
      })
    },

    refuse: function (id) {
      app.post('requestRefuse', {
        id
      })
    }
  },

  report: {
    finish: function () {
      const [id, amount] = document.querySelectorAll('#report .content .data input')
      const reason = document.querySelector('textarea').value

      app.post('report', {
        id: id.value,
        amount: amount.value,
        reason: reason,
      })
    }
  },

  arrest: {
    applyPunish: function () {
      const identifier = document.querySelectorAll('#arrest input')[0].value
      const time = document.querySelectorAll('#arrest input')[1].value
      const fine = document.querySelectorAll('#arrest input')[2].value
      const reason = document.querySelector('#arrest textarea').value

      app.post('applyPunish', {
        identifier,
        time,
        fine,
        reason
      })
    }
  },

  invite: {
    open: () => {
      document.querySelector('.invite').style.display = 'flex';
      document.querySelector('.invite .hire').style.display = 'flex';
      document.querySelector('.invite .exonerate').style.display = 'none';
    },

    nameRegistered: ({ target }) => {
      const value = target.value
      app.post('nameRegistered', { value })
    },

    cancel: () => {
      document.querySelector('.invite input').value = ""
      app.invite.close();
    },

    confirm: () => {
      const id = document.querySelector('.invite input').value
      const group = document.querySelector('.invite #inputGroups').value
      if (!id) return
      app.post('confirmInvite', {
        id,
        group
      })
      app.invite.close();
    },

    close: () => {
      document.querySelector('.invite').style.display = 'none';
    },

    updateName: ({ name }) => {
      document.querySelector('.invite > div[style="display: flex;"] > span').textContent = name
    }
  },
  exonerate: {
    open: () => {
      document.querySelector('.invite').style.display = 'flex';
      document.querySelector('.invite .hire').style.display = 'none';
      document.querySelector('.invite .exonerate').style.display = 'flex';
    },

    nameRegistered: ({ target }) => {
      const value = target.value
      app.post('nameRegistered', { value })
    },

    cancel: () => {
      document.querySelector('.invite input').value = ""
      app.invite.close();
    },

    confirm: () => {
      const id = document.querySelector('.invite > div[style="display: flex;"] > input').value
      if (!id) return
      console.log(JSON.stringify(app.dashboard.members))
      const role = app.dashboard.members.find(member => member.user_id == id).group.role
      app.post('confirmExonerate', {
        id,
        role
      })
      app.invite.close();
    },
  }
}

window.app = app;
window.addEventListener('message', ({ data }) => {
  if (data.action === 'open') app.open(data)
  if (data.action === 'close') app.close()
  if (data.action === 'updateInviteName') app.invite.updateName(data)
})

document.addEventListener('keydown', function ({ keyCode }) {
  switch (keyCode) {
    case 27:
      app.close()
      app.post('close')
      break;
  }
});

const messageInput = document.querySelector('#registers .content .chat .input > input[type=text]')
messageInput.addEventListener("keypress", function (event) {
  if (event.key === "Enter") {
    event.preventDefault();
    document.querySelector('#registers .content .chat .input > img').click();
  }
});