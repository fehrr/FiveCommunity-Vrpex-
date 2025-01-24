window.addEventListener('message', ({ data }) => {
    if(data.setDisplay) {
      if (data.deathtimer > 0) {
        document.querySelector('.message p b').innerHTML = `${data.deathtimer} SEGUNDOS`;
      } else {
        document.querySelector('.message p b').innerHTML = `APERTE [ E ] PARA RETORNAR`;
      }
      document.body.style.display = 'flex';
    } else {
      document.body.style.display = 'none';
    }
  })