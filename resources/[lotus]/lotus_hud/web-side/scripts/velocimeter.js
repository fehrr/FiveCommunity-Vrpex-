window.addEventListener('message', ({ data }) => {
  if (!data.vehicle) return;

  const isVisible = Boolean(data.vehicle.show);

  if (!isVisible) {
    handleVisibility(false);
    return;
  }

  handleVisibility(true);

  const { rpm, speed, engine, light, seatbelt, lock, march } = data.vehicle;

  updateSpeed(rpm);
  updateEngine(engine);

  document.querySelector('.velocimeter #KMH').innerHTML = formatSpeed(speed);
  document.querySelector('.velocimeter2 #speed').innerHTML = formatSpeed(speed);

  updateBooleanState('.door path', lock)
  updateBooleanState('.lights path', light)
  updateBooleanState('.seat path', seatbelt)



  updateEngine2(engine);
});

function handleVisibility(isVisible) {
  const velocimeterPreference = localStorage.getItem("velocimeter");

  const velocimeter = document.querySelector('.velocimeter');
  const velocimeter2 = document.querySelector('.velocimeter2');
  const player = document.querySelector('.player');
  const player2 = document.querySelector('.player2');

  velocimeter.style.display = velocimeterPreference === '1' || !velocimeterPreference ? (isVisible ? 'flex' : 'none') : 'none';
  velocimeter2.style.display = velocimeterPreference === '2' ? (isVisible ? 'block' : 'none') : 'none';

  const hudValue = localStorage.getItem("hud");
  if (velocimeterPreference === "1") {
    player2.style.display = hudValue === '1' ? 'flex' : 'none';
    player.style.display = hudValue === '1' ? 'none' : 'flex';
  } else if (velocimeterPreference === "2") {
    if (!isVisible) {
      player2.style.display = hudValue === '1' ? 'flex' : 'none';
      player.style.display = hudValue === '1' ? 'none' : 'flex';
    } else {
      player.style.display = 'none';
      player2.style.display = 'none';
    }
  }
}

function updateSpeed(percentage) {
  document.querySelector('.velocimeter #speedometer').style.strokeDashoffset = 100 - percentage;
  document.querySelectorAll('.velocimeter2 #speedometer').forEach((el) => el.style.strokeDashoffset = 100 - percentage);
}

function updateEngine(percentage) {
  try {
    document.querySelector('.velocimeter #engine').style.strokeDashoffset = 100 - percentage;
  } catch (error) {
  }
  document.querySelector('.velocimeter2 #engine').style.strokeDashoffset = 100 - percentage;
}

function updateEngine2(engine) {
  const opacity = engine <= 0 ? '.45' : '1';
  try {
    document.querySelector('.velocimeter #engine2').style.fillOpacity = opacity;
  } catch (error) {
  }
}

function updateBooleanState(selector, state) {
  const opacity = Boolean(state) ? '1' : '.45';
  document.querySelectorAll(selector).forEach((p) => p.style.fillOpacity = opacity);
}

function formatSpeed(speed) {
  return speed < 10 ? `<b>00</b>${Math.floor(speed)}` : speed < 100 ? `<b>0</b>${Math.floor(speed)}` : Math.floor(speed);
}

if (!window.invokeNative) {
  let speed = 0;
  let engine = 100;
  setInterval(() => {
    speed = Math.min(speed + 1, 100);
    engine = Math.max(engine - 1, 0);
    updateSpeed(speed);
    updateEngine(engine);
  }, 20);
}

const hud = localStorage.getItem('hud');
const velocimeter = localStorage.getItem('velocimeter');

window.addEventListener('message', ({ data }) => {
  if (data.action === 'nitro:show') {
    const convertedPercentage = -100 + data.percentage;
    document.querySelectorAll('nitro')[0].style.strokeDashoffset = convertedPercentage;
    document.querySelectorAll('nitro')[1].style.strokeDashoffset = 100 - data.percentage;
    document.querySelectorAll('.nitroC')[0].style.display = 'block'
    document.querySelectorAll('.nitroC')[1].style.display = 'block'
  };
  if (data.action === 'nitro:hide') {
    document.querySelectorAll('.nitroC')[0].style.display = 'none'
    document.querySelectorAll('.nitroC')[1].style.display = 'none'
  };
})