const open = () => {
  document.querySelector('main').innerHTML = ''; 
  shortcuts.forEach(shortcut => {
    document.querySelector('main').innerHTML += `
      <div class="info">
        <p>${shortcut.message}</p>
        <span>${shortcut.command}</span>
      </div>
    `
  })
  document.body.style.display = 'flex';
}

const close = () => {
  document.querySelector('main').innerHTML = ''; 
  document.body.style.display = 'none';
}

window.addEventListener('keyup', ({key}) => {
  if (key === 'Escape') {
    fetch('http://lotus-shortcuts/close', { method: 'POST' })
    close()
  }
})

window.addEventListener('message', ({data}) => {
  if (data.action === 'open') open()
  if (data.action === 'close') close()
})

if (!window.invokeNative) {
  window.postMessage({
    action: 'open'
  })
}
