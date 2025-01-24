const healthElement = document.querySelector('body #content .self .needs .health .progress .value')
const armourElement = document.querySelector('.needs.armour .progress .value')

function updateHealthBar(value) {
  document.querySelector('.needs.health .progress .value ').style.width = `${value}%`
  document.querySelector('.velocimeter2 #health').style.strokeDashoffset = 100 - value
  document.querySelector('.circle #health').style.strokeDashoffset = 100 - value
}

function updateArmourBar(value) {
  document.querySelector('.needs.armour .progress .value').style.width = `${value}%`
  if (value === 0) document.querySelector('.velocimeter2 #armour').style.opacity = 0
  else document.querySelector('.velocimeter2 #armour').style.opacity = 1
  document.querySelector('.velocimeter2 #armour').style.strokeDashoffset = 100 - value
  document.querySelector('.circle #armour').style.strokeDashoffset = 100 - value
}

window.addEventListener('message', ({ data }) => {
  if (data.action === 'hud:cupom') return document.querySelector('#cupom').style.opacity = data.show ? 1 : 0
  if (data.action === 'hud:close') return document.body.style.opacity = 0
  if (data.action !== 'hud:open') return

  document.body.style.opacity = 1

  updateArmourBar(Math.min(data.armour, 100))
  updateHealthBar((data.health - 101) / (300 - 101) * 100)

  if (data.weapon?.show) {
    document.querySelector(".weapon").innerHTML = `
      <div class = 'informations'>
        <span><b>${data.weapon.current}</b>/${data.weapon.max}</span>  
      </div>
      <img src = './assets/weapons/${data.weapon.image}.png'>
    `
    document.querySelector(".weapon").style.display = "flex"
  } else {
    document.querySelector(".weapon").style.display = "none"
  }

  document.querySelectorAll('body .self .needs').forEach(el => el.style.display = 'flex')

  if (data.vehicle.show) {
    // document.querySelector('.weapon').style.display = 'none'
    // document.querySelectorAll('body .self .needs').forEach(el => el.style.display = 'none')
  }

  if (data.volume === 1) {
    document.querySelectorAll('.modes .mode')[0].classList.add('active')
    document.querySelectorAll('.modes .mode')[1].classList.remove('active')
    document.querySelectorAll('.modes .mode')[2].classList.remove('active')
  } else if (data.volume === 2) {
    document.querySelectorAll('.modes .mode')[0].classList.add('active')
    document.querySelectorAll('.modes .mode')[1].classList.add('active')
    document.querySelectorAll('.modes .mode')[2].classList.remove('active')
  } else if (data.volume === 3) {
    document.querySelectorAll('.modes .mode')[0].classList.add('active')
    document.querySelectorAll('.modes .mode')[1].classList.add('active')
    document.querySelectorAll('.modes .mode')[2].classList.add('active')
  }

  if (data.assaultTime !== null) document.querySelector(".assault").style.display = data.assaultTime ? 'flex' : 'none'
  if (data.street) {
    document.querySelector('.location p').textContent = data.street
    if (data.vehicle.show) {
      document.querySelector('.location').style.bottom = '16.5rem';
    } else {
      document.querySelector('.location').style.bottom = '2.2rem';
    }

    document.querySelector('.location').style.opacity = '1';
  } else {
    document.querySelector('.location').style.opacity = '0';
  }

  const modes = document.querySelectorAll('.basic.mic .modes .mode')

  for (let i = 0; i < modes.length; i++) {
    if (i <= data.volume - 1) {
      modes[i].style.background = data.talking ? '#FFF' : 'rgba(255, 255, 255, 0.55)'
    }
  }
  

  if (data.frequency > 0) {
    document.querySelector('.basic.frequency  p').textContent = (data.frequency + ' MHz')
    document.querySelector('.basic.frequency').style.display = 'flex'
  }
  else document.querySelector('.basic.frequency').style.display = 'none'

  if (data.clock) document.querySelector('.basic.clock  p').textContent = data.clock || '00:00'

  if (data.action === 'isNovat') {
    document.querySelector(".novat").style.display = data.isNovat ? "flex" : 'none';
  }

  document.querySelector('.safezone').style.display = data.safezone ? 'flex' : 'none'
})

if (!window.invokeNative) {
  window.postMessage({
    action: 'isNovat',
    isNovat: true
  })
  window.postMessage({
    action: 'hud:open',
    health: 230,
    armour: 50,
    clock: '20:00',
    talking: true,
    frequency: 44,
    volume: 1,
    street: 'Rua bolevar',
    assaultTime: 1,
    safezone: true,
    weapon: {
      show: true,
      image: '-86904375',
      current: 2,
      max: 10
    },
    vehicle: {
      armour: 0,
      engine: 0,
      fuel: 100,
      light: false,
      lock: false,
      march: 2,
      nitro: 100,
      rpm: 100,
      seatbelt: true,
      speed: 40,
      show: true
    }
  })
}
