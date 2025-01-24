var position = 2;
var pending = false;
var vehiclesList = []

$(document).ready(() => requestCars());

function requestCars() {
  $.post("http://bm_module/requestGarages", JSON.stringify({}), (data) => {

    if (data.cars.length == 0){
      document.querySelectorAll("#garageContent")[0].style.display = 'none'
      document.querySelectorAll("#garageContent")[1].style.display = 'block'
      return
    }

    document.querySelectorAll("#garageContent")[0].style.display = 'block'
    document.querySelectorAll("#garageContent")[1].style.display = 'none'
    
    pending = data.cars[0].ipva === true || data.cars[0].status === true

    vehiclesList = data.cars;

    document.querySelector('#preview').innerHTML = `
      <div class = 'vehiclePreview'>
        <h1>${data.cars[0].name}</h1>
        <p>CATEGORIA: <b>${data.cars[0].type}</b></p>
        <p>PLACA: <strong>${data.cars[0].plate}</strong></p>
        <img src="http://45.40.99.21:4020/lotus/carros/${data.cars[0].vehicle}.png" alt="vehicle">
      </div>
      <div class = 'vehicleStats'>
        <h2>DADOS GERAIS</h2> 
        <div class = 'stats'>
          <div class = 'stat'>
            <i class = 'fa-solid fa-coins'></i>
            <div class = 'text'>
              <p>STATUS DA TAXA</p>
              <span>${data.cars[0].ipva ? 'PAGO' : 'NÃO PAGO'}</span>
            </div>
          </div>
          <div class = 'stat'>
            <i class = 'fa-solid fa-coins'></i>
            <div class = 'text'>
              <p>STATUS DO VEÍCULO</p>
              <span>${data.cars[0].status ? 'PRESO' : 'LIBERADO'}</span>
            </div>
          </div>
        </div>
        <div class = 'informations'>
          <div class = 'info'>
            <p>STATUS DA FRENAGEM</p>
            <div class = 'progressContainer'>
              <div class = 'progress'>
                <div class = 'value' style = 'width: ${Math.floor(data.cars[0].braking)}%'></div>
              </div>
              <p>${Math.floor(data.cars[0].braking)}%</p>
            </div>
          </div>
          <div class = 'info'>
            <p>STATUS DA AGILIDADE</p>
            <div class = 'progressContainer'>
              <div class = 'progress'>
                <div class = 'value' style = 'width: ${Math.floor(data.cars[0].agility)}%'></div>
              </div>
              <p>${Math.floor(data.cars[0].agility)}%</p>
            </div>
          </div>
          <div class = 'info'>
            <p>STATUS DA ADERÊNCIA</p>
            <div class = 'progressContainer'>
              <div class = 'progress'>
                <div class = 'value' style = 'width: ${Math.floor(data.cars[0].aceleration)}%'></div>
              </div>
              <p>${Math.floor(data.cars[0].aceleration)}%</p>
            </div>
          </div>
          <div class = 'info'>
            <p id = 'weight'>VELOCIDADE MÁXIMA</p>
            <div class = 'progressContainer'>
              <p>${Math.floor(data.cars[0].maxspeed)} KM/H</p>
            </div>
          </div>
        </div>
        <div class = 'buttons'>
          <button onclick = 'withdraw(${data.cars[0].ipva})'>RETIRAR</button>
          <button onclick = 'save(false)'>GUARDAR</button>
          <button onclick = 'save(true)'>GUARDAR PRÓXIMO</button>
        </div>
      </div>
    `
    document.querySelector('.vehicles').innerHTML = '';
    data.cars.forEach(vehicle => {
      const div = document.createElement('div');
      div.classList.add('vehicle')
      div.setAttribute('data-name', vehicle.vehicle)
      div.innerHTML = `
        <p>${vehicle.name}</p>
        <img src="http://45.40.99.21:4020/lotus/carros/${vehicle.vehicle}.png" alt="vehicle">
        <span>${vehicle.ipva ? 'BLOQUEADO' : 'LIBERADO'}</span>
      `
      document.querySelector('.vehicles').appendChild(div);
      div.addEventListener('click', () => {
        pending = vehicle.ipva === true || vehicle.status === true
        document.querySelector('#preview').innerHTML = `
          <div class = 'vehiclePreview'>
            <h1>${vehicle.name}</h1>
            <p>CATEGORIA: <b>${vehicle.type}</b></p>
            <p>PLACA: <strong>${vehicle.plate}</strong></p>
            <img src="http://45.40.99.21:4020/lotus/carros/${vehicle.vehicle}.png" alt="vehicle">
          </div>
          <div class = 'vehicleStats'>
            <h2>DADOS GERAIS</h2> 
            <div class = 'stats'>
              <div class = 'stat'>
                <i class = 'fa-solid fa-coins'></i>
                <div class = 'text'>
                  <p>STATUS DA TAXA</p>
                  <span>${vehicle.ipva ? 'PAGO' : 'NÃO PAGO'}</span>
                </div>
              </div>
              <div class = 'stat'>
                <i class = 'fa-solid fa-coins'></i>
                <div class = 'text'>
                  <p>STATUS DO VEÍCULO</p>
                  <span>${vehicle.status ? 'PRESO' : 'LIBERADO'}</span>
                </div>
              </div>
            </div>
            <div class = 'informations'>
              <div class = 'info'>
                <p>STATUS DA FRENAGEM</p>
                <div class = 'progressContainer'>
                  <div class = 'progress'>
                    <div class = 'value' style = 'width: ${Math.floor(vehicle.braking)}%'></div>
                  </div>
                  <p>${Math.floor(vehicle.braking)}%</p>
                </div>
              </div>
              <div class = 'info'>
                <p>STATUS DA AGILIDADE</p>
                <div class = 'progressContainer'>
                  <div class = 'progress'>
                    <div class = 'value' style = 'width: ${Math.floor(vehicle.agility)}%'></div>
                  </div>
                  <p>${Math.floor(vehicle.agility)}%</p>
                </div>
              </div>
              <div class = 'info'>
                <p>STATUS DA ADERÊNCIA</p>
                <div class = 'progressContainer'>
                  <div class = 'progress'>
                    <div class = 'value' style = 'width: ${Math.floor(vehicle.aceleration)}%'></div>
                  </div>
                  <p>${Math.floor(vehicle.aceleration)}%</p>
                </div>
              </div>
              <div class = 'info'>
                <p id = 'weight'>VELOCIDADE MÁXIMA</p>
                <div class = 'progressContainer'>
                  <p>${Math.floor(vehicle.maxspeed)} KM/H</p>
                </div>
              </div>
            </div>
            <div class = 'buttons'>
              <button onclick = 'withdraw(${vehicle.ipva})'>RETIRAR</button>
              <button onclick = 'save(false)'>GUARDAR</button>
              <button onclick = 'save(true)'>GUARDAR PRÓXIMO</button>
            </div>
          </div>
        `
        vehicleSelected(div);
      })
    })
    vehicleSelected(document.querySelectorAll('.vehicle')[0])
  })
}

function searchVehicle ({ target }) {
  document.querySelector('.vehicles').innerHTML = '';
  const vehicleFiltered = vehiclesList.filter(vehicle => String(vehicle.name).toLowerCase().includes(target.value.toLowerCase()));
  vehicleFiltered.forEach(vehicle => {
    const div = document.createElement('div');
    div.classList.add('vehicle')
    div.setAttribute('data-name', vehicle.vehicle)
    div.innerHTML = `
      <p>${vehicle.name}</p>
      <img src="http://45.40.99.21:4020/lotus/carros/${vehicle.vehicle}.png" alt="vehicle">
      <span>${vehicle.ipva ? 'BLOQUEADO' : 'LIBERADO'}</span>
    `
    document.querySelector('.vehicles').appendChild(div);
    div.addEventListener('click', () => {
      pending = vehicle.ipva === true || vehicle.status === true
      document.querySelector('#preview').innerHTML = `
        <div class = 'vehiclePreview'>
          <h1>${vehicle.name}</h1>
          <p>CATEGORIA: <b>${vehicle.type}</b></p>
          <p>PLACA: <strong>${vehicle.plate}</strong></p>
          <img src="./assets/vehicle.svg" alt="vehicle">
        </div>
        <div class = 'vehicleStats'>
          <h2>DADOS GERAIS</h2> 
          <div class = 'stats'>
            <div class = 'stat'>
              <i class = 'fa-solid fa-coins'></i>
              <div class = 'text'>
                <p>STATUS DA TAXA</p>
                <span>${vehicle.ipva ? 'PAGO' : 'NÃO PAGO'}</span>
              </div>
            </div>
            <div class = 'stat'>
              <i class = 'fa-solid fa-coins'></i>
              <div class = 'text'>
                <p>STATUS DO VEÍCULO</p>
                <span>${vehicle.status ? 'PRESO' : 'LIBERADO'}</span>
              </div>
            </div>
          </div>
          <div class = 'informations'>
            <div class = 'info'>
              <p>STATUS DA FRENAGEM</p>
              <div class = 'progressContainer'>
                <div class = 'progress'>
                  <div class = 'value' style = 'width: ${vehicle.braking}%'></div>
                </div>
                <p>${vehicle.braking}%</p>
              </div>
            </div>
            <div class = 'info'>
              <p>STATUS DA AGILIDADE</p>
              <div class = 'progressContainer'>
                <div class = 'progress'>
                  <div class = 'value' style = 'width: ${vehicle.agility}%'></div>
                </div>
                <p>${vehicle.agility}%</p>
              </div>
            </div>
            <div class = 'info'>
              <p>STATUS DA ADERÊNCIA</p>
              <div class = 'progressContainer'>
                <div class = 'progress'>
                  <div class = 'value' style = 'width: ${vehicle.aceleration}%'></div>
                </div>
                <p>${vehicle.aceleration}%</p>
              </div>
            </div>
            <div class = 'info'>
              <p id = 'weight'>VELOCIDADE MÁXIMA</p>
              <div class = 'progressContainer'>
                <p>${Math.floor(vehicle.maxspeed)} KM/H</p>
              </div>
            </div>
          </div>
          <div class = 'buttons'>
            <button onclick = 'withdraw(${vehicle.ipva})'>RETIRAR</button>
            <button onclick = 'save(false)'>GUARDAR</button>
            <button onclick = 'save(true)'>GUARDAR PRÓXIMO</button>
          </div>
        </div>
      `
      vehicleSelected(div);
    })
  })
} 

function withdraw(ipva) {
  fetch('http://bm_module/spawnCar', {
    method: 'POST',
    body: JSON.stringify({
      name: document.querySelector('.vehicle.selected').getAttribute('data-name'),
      pending: pending
    })
  })
  fetch('http://bm_module/onClose', {
    method: 'POST',
    body: JSON.stringify({ close: 'garages' })
  })
  close();
}

function save(proximity) {
  fetch('http://bm_module/storeCar', {
    method: 'POST',
    body: JSON.stringify({
      name: document.querySelector('.vehicle.selected').getAttribute('data-name'),
      status: proximity
    })
  })
  fetch('http://bm_module/onClose', {
    method: 'POST',
    body: JSON.stringify({ close: 'garages' })
  })
  close();
}

function vehicleSelected(element) {
  document.querySelectorAll('.vehicles .vehicle').forEach(vehicle => vehicle.classList.remove('selected'))
  element.classList.add('selected')
}

function close () {
  window.location.reload()
}

function updateSides (side) {
  const container = document.querySelector(".vehicles");
  const vehicles = document.querySelectorAll(".vehicle");
  if (side === "left" && position > 0) {
    position -= 1;
    const newVehicle = vehicles[position];
    newVehicle.scrollIntoView({
      behavior: "smooth",
      block: "center",
      inline: "center"
    });
  }
  if (side === "right" && position + 1 < vehicles.length) {
    position += 1;
    const newVehicle = vehicles[position];
    if (container.scrollLeft === container.scrollWidth) return;
    newVehicle.scrollIntoView({
      behavior: "smooth",
      block: "center",
      inline: "center"
    });
  }
}

window.addEventListener('keyup', ({ key }) => {
  if (key === 'Escape') {
    fetch('http://bm_module/onClose', {
      method: 'POST',
      body: JSON.stringify({ close: 'garages' })
    })
    close();
  }
})

