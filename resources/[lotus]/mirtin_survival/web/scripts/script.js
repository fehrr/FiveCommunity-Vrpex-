const spawn = (name) => {
  fetch('http://mirtin_survival/spawn', { 
    method: 'POST', 
    body: JSON.stringify({ name })
  })
}

function formatTime (seconds) {
  const minutes = Math.floor(seconds / 60);
  const restSeconds = seconds % 60;
  const time = `${minutes.toString().padStart(2, '0')}:${restSeconds.toString().padStart(2, '0')}`;
  return time;
}

function callFireman () {
  fetch('http://mirtin_survival/callFireman', { method: 'POST' })
  document.querySelector('#notify').style.display = 'block'
  setTimeout(() => document.querySelector('#notify').style.display = 'none', 4 * 1000);
}

let called = false
function callStaff () {
  if (called) return
  setTimeout(() => called = false, 5000)
  fetch('http://mirtin_survival/callStaff', { method: 'POST' })
  called = true
}

window.addEventListener("message", ({ data }) => {
  if (data.action === 'open') {
    if (data.deathtimer > 0) {
      document.querySelector(".actions").style.display = 'flex'
      document.querySelector(".locales").style.display = 'none'
      document.querySelector(".time").innerHTML = formatTime(data.deathtimer);
    } else {
      document.querySelector(".actions").style.display = 'none'
      document.querySelector(".locales").style.display = 'flex'
      document.querySelector(".time").innerHTML = formatTime(data.deathtimer);
    }
    document.body.style.display = "flex";
  } else if (data.action === 'close') {
    document.body.style.display = "none";
  }
});

if (!window.invokeNative) {
  window.postMessage({ action: 'open', deathtimer: 1 })
}