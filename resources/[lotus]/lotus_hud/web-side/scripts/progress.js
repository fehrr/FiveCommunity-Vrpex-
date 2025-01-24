const strokePath = document.querySelector('#progressContainer .progress')
let interval
function StartProgress(time) {
  document.getElementById("progressContainer").style.display = 'block';

  strokePath.style.animation = `endProgress ${time}ms linear`
  var startTime = Date.now()
  if (interval) clearInterval(interval)
  interval = setInterval(function() {
    var elapsedTime = Date.now() - startTime;
    var percentage = (elapsedTime / time) * 100;
    percentage = Math.min(100, Math.max(0, Math.round(percentage)));

    document.getElementById("percentDisplay").innerText = percentage + "%";

    if (elapsedTime >= time) {
      clearInterval(interval);
      document.getElementById("progressContainer").style.display = 'none';
    }
  }, 50)
  setTimeout(() => {
    strokePath.style.animation = false
  }, time)
}

window.addEventListener('message', ({ data }) => {
  if (data.action === 'progress') return StartProgress(data.seconds * 1000)
})

if (!window.invokeNative) {
  window.postMessage({
    action: 'progress',
    seconds: 2
  })
}
