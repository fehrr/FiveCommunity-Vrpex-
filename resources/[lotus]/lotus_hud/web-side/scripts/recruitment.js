const recruitment = {
  queueRecruitments: [],
  recruitmentInScreen: false,

  renderRecruitment: function ({ message, x, y, time }) {
    if (message) this.queueRecruitments.push({
      message: message,
      x: x,
      y: y,
      time: time
    })

    if (!this.recruitmentInScreen && this.queueRecruitments.length > 0) {
      this.recruitmentInScreen = true

      const queue = this.queueRecruitments[0]

      const div = document.createElement('div')
      div.classList.add("notify", "recruitment")
      div.innerHTML = `
        <div style="background: transparent; padding: 2px 4px; width: fit-content" class = 'notify'>
          <div class = 'content' style="width: fit-content">
            <div class = 'notifyTitle'> 
            <div class = 'title'>
            <div class = 'bar'>
              <svg width="62" height="65" viewBox="0 0 62 65" fill="none" xmlns="http://www.w3.org/50000/svg">
								<g>
									<path d="M32.9513 50.4096C31.7387 51.0872 30.2613 51.0872 29.0487 50.4096L16.0487 43.1448C14.7837 42.4379 14 41.1021 14 39.6531L14 25.3464C14 23.8973 14.7838 22.5615 16.0488 21.8546L29.0488 14.5903C30.2614 13.9127 31.7386 13.9127 32.9512 14.5903L45.9512 21.8546C47.2162 22.5615 48 23.8973 48 25.3464L48 39.653C48 41.1021 47.2163 42.4379 45.9513 43.1448L32.9513 50.4096Z" fill="#CA56DD59"/>
									<path d="M32.7074 49.9731C31.6463 50.566 30.3537 50.566 29.2926 49.9731L16.2926 42.7083C15.1858 42.0898 14.5 40.921 14.5 39.6531L14.5 25.3464C14.5 24.0784 15.1858 22.9096 16.2927 22.2911L29.2927 15.0268C30.3537 14.4339 31.6463 14.4339 32.7073 15.0268L45.7073 22.2911C46.8142 22.9096 47.5 24.0784 47.5 25.3464L47.5 39.653C47.5 40.921 46.8142 42.0898 45.7074 42.7083L32.7074 49.9731Z" stroke="#CA56DD59"/>
								</g>
							</svg>
							<img src='./assets/hud/icons/belt.svg'>
            </div>
              <p style="margin: 0">RECRUTAMENTO</p>
            </div>
          </div>
            <p style = '${message.length > 700 ? 'font-size: 0.70rem; line-height: 0.70rem;' : 'font-size: 0.75956rem; max-width: 300px'}'>${message}</p>
            <p style = '${message.length > 700 ? 'font-size: 0.70rem; line-height: 0.70rem;' : 'font-size: 0.75956rem; color: white'}'>APERTE "Y" PARA MARCAR NO MAPA</p>
            </div>
            <div class = 'progress' style = 'background: #CA56DD59'>
              <div class = 'value' style = 'animation: widthProgress ${time}ms linear forwards; background: #CA56DD}'></div>
            </div>
          </div>
        </div>
      `

      document.querySelector(".notify_list").appendChild(div)
      fetch('https://lotus_hud/newLocation', {
        method: 'POST',
        body: JSON.stringify({
          x: queue.x,
          y: queue.y
        })
      })

      setTimeout(() => {
        const indexNotify = this.queueRecruitments.findIndex((q) => q.message === queue.message)
        if (indexNotify === -1) return;
      }, queue.time - 350)

      setTimeout(() => {
        this.recruitmentInScreen = false
        const indexNotify = this.queueRecruitments.findIndex((q) => q.message === queue.message)
        if (indexNotify === -1) return;
        this.queueRecruitments.splice(indexNotify, 1)

        div.remove()
        this.renderRecruitment({ message: null })
      }, queue.time)
    }
  },

  remove: function () {
    document.querySelector('.notifyContainer .notify.recruitment').remove()
  },

  sendCall: function () {
    const message = document.querySelector('textarea').value
    if (!message || /^<\/br>*$/.test(message) || /(<\/br>)+/.test(message) || message.trim() === '') {
      fetch('https://lotus_hud/closeRecruitment', { method: 'POST' })
    } else {
      const formattedMessage = message.replace(/\n/g, '</br>');
      fetch('https://lotus_hud/messageSent', {
        method: 'POST',
        body: JSON.stringify({ message: formattedMessage })
      })
    }
  }
}

window.recruitment = recruitment

// if (!window.invokeNative) {
//   recruitment.renderRecruitment({
//     message: 'Recrutamento de Polícia !',
//     x: 10,
//     y: 10,
//     time: 20000
//   })
// }