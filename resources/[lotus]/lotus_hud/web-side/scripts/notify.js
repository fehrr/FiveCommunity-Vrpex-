class NotifyController {
	queueSystem = []
	canNotificate = true

	types = {
		success: {
			primary: '#76CD6759',
			gradient: '#76CD67'
		},
		refused: {
			primary: '#CD676759',
			gradient: '#CD6767'
		},
		important: {
			primary: '#6790CD59',
			gradient: '#6790CD'
		},
		hospital: {
			primary: '#E4424259',
			gradient: '#E44242'
		},
		police: {
			primary: '#FFFFFF26',
			gradient: '#424DB4'
		},
		mechanic: {
			primary: '#9D9D9D59',
			gradient: '#9D9D9D'
		},
		// avisoadm: {
		// 	primary: '#8545EF59',
		// 	gradient: '#8545EF'
		// },
		party: {
			primary: '#1c1c1c',
			gradient: 'white'
		},
		avisocreche: {
			primary: '#45DBEF59',
			gradient: '#45DBEF'
		},
		natal: {
			primary: '#EF454559',
			gradient: '#EF4545'
		},
		avisoadv: {
			primary: '#CD676759',
			gradient: '#CD6767'
		},
		avisobombeiro: {
			primary: '#DB2D2D59',
			gradient: '#CD6767'
		},
		verao: {
			primary: '#CDA46759',
			gradient: '#CDA467'
		},
		avisovip: {
			primary: '#CDA46759',
			gradient: '#f5cb42'
		},
	}

	create({ type, title, message, time, queue, isRender }) {
		if (queue) {
			this.queueSystem.push({ type, title, message, time, queue })
			if (this.queueSystem.length === 1 || isRender) {
				const element = this.createElement(type, title, message, time)
				setTimeout(() => {
					element.remove()
					this.queueSystem = this.queueSystem.filter((q) => q.message !== message)

					if (this.queueSystem.length === 0) return;
					this.create({ ...this.queueSystem[0], isRender: true })
				}, time)
			}
		} else {
			const element = this.createElement(type, title, message, time)
			setTimeout(() => {
				element.remove()
			}, time)
		}
	}

	createElement(type, title, message, time) {
		const div = document.createElement('div')
		div.classList.add('notify', type)
		div.innerHTML = `
			<div class='content'>
				<div class="notifyTitle">
					<div class='title'>
						<div class='bar'>
							<svg width="62" height="65" viewBox="0 0 62 65" fill="none" xmlns="http://www.w3.org/50000/svg">
								<g>
									<path d="M32.9513 50.4096C31.7387 51.0872 30.2613 51.0872 29.0487 50.4096L16.0487 43.1448C14.7837 42.4379 14 41.1021 14 39.6531L14 25.3464C14 23.8973 14.7838 22.5615 16.0488 21.8546L29.0488 14.5903C30.2614 13.9127 31.7386 13.9127 32.9512 14.5903L45.9512 21.8546C47.2162 22.5615 48 23.8973 48 25.3464L48 39.653C48 41.1021 47.2163 42.4379 45.9513 43.1448L32.9513 50.4096Z" fill="${this.types[type]?.gradient ?? "#8545EF"}"/>
									<path d="M32.7074 49.9731C31.6463 50.566 30.3537 50.566 29.2926 49.9731L16.2926 42.7083C15.1858 42.0898 14.5 40.921 14.5 39.6531L14.5 25.3464C14.5 24.0784 15.1858 22.9096 16.2927 22.2911L29.2927 15.0268C30.3537 14.4339 31.6463 14.4339 32.7073 15.0268L45.7073 22.2911C46.8142 22.9096 47.5 24.0784 47.5 25.3464L47.5 39.653C47.5 40.921 46.8142 42.0898 45.7074 42.7083L32.7074 49.9731Z" stroke="${this.types[type]?.gradient ?? '#8545EF'}"/>
								</g>
							</svg>
							<img onerror="./assets/hud/icons/belt.svg" onerror="this.src='./assets/hud/icons/belt.svg'" src='./assets/hud/icons/${this.types[type] ? type : 'belt'}.svg'>
						</div>
					</div>
					<h6 style="color: white;">${title}</h6>
				</div>
				<p style='${message.length > 700 ? 'font-size: 0.70rem; line-height: 0.70rem;' : 'font-size: 0.89rem;'}'>${message}</p>
				<div class='progress' style='background: ${this.types[type]?.primary || '#00000040'}'>
					<div class='value' style='animation: widthProgress ${time}ms linear forwards; background: ${this.types[type]?.gradient || 'linear-gradient(164deg, #7243D8 -11.2%, #44228E 116.23%)'}'></div>
				</div>
			</div>
		`;
		document.querySelector(".notify_list").appendChild(div)
		return div
	}

	delete(div, time) {
		setTimeout(() => div.remove(), time);
	}
}

let notifyDisabled = true
const notify = new NotifyController()
window.addEventListener('message', ({ data }) => {
	if (data.action === 'canNotificate') notifyDisabled = data.status
	if (data.action === 'notify') {
		if (!notifyDisabled && data.type !== 'avisoadm') return 
		notify.create(data)
	}
	if (data.action === 'makapoints') {
		if (data.show) {
			document.querySelector('#content .makapoints strong').innerHTML = data.points
			document.querySelector('#content .makapoints').style.display = 'flex'
		}
		else document.querySelector('#content .makapoints').style.display = 'none'
	}
})

if (!window.invokeNative) {
	document.body.style.backgroundColor = '#1c1c1c'
	window.postMessage({ action: 'canNoticate', status: false })
	window.postMessage({ action: 'notify', type: 'party', message: 'Welcome to the VIP Party! Enjoy the exclusive perks and have a great time!', queue: false, time: 50000, title: 'VIP Party' })
	window.postMessage({ action: 'notify', type: 'police', message: 'Attention VIP members: Please be aware of the increased security measures in place for your safety.', queue: false, time: 50000, title: 'VIP Police' })
	window.postMessage({ action: 'notify', type: 'refused', message: 'We regret to inform you that your VIP request has been refused. Please contact our support team for further assistance.', queue: false, time: 50000, title: 'VIP Refused' })
	window.postMessage({ action: 'notify', type: 'avisoadv', message: 'VIP Advisory: Important information regarding upcoming events and exclusive offers will be sent to your registered email address.', queue: false, time: 50000, title: 'VIP Advisory' })
	window.postMessage({ action: 'notify', type: 'avisostaff', message: 'Attention VIP members: Our dedicated staff is available 24/7 to assist you with any inquiries or requests. Feel free to reach out to us!', queue: false, time: 50000, title: 'VIP Staff' })
	window.postMessage({ action: 'notify', type: 'avisoadm', message: 'teste.', queue: false, time: 50000, title: 'Important Notification' })
	window.postMessage({ action: 'notify', type: 'avisovip', message: 'teste', queue: false, time: 50000, title: 'TESTE AVISO ADM' })

}