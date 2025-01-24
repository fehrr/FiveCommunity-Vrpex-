
var categoryType = null;
var page = 0;
var vehiclesList = []
var bestSellers = []
var myVehiclesList = []
var pageVehiclesList = [];

$(document).ready(() => open());

function open() {
  fetch('http://bm_module/requestConceVehicles', { method: 'POST' })
  .then(response => response.json())
  .then(data => {
      vehiclesList.push(...data.list)
      updateBestSellers(data.list)
      updateList(vehiclesList)
    }).catch(err => console.log(err));
  fetch('https://bm_module/requestMyVehicles', { method: 'POST' })
    .then(response => response.json())
    .then(data => {
      myVehiclesList.push(...data.list)
      updateList(myVehiclesList, true)
    }).catch(err => console.log(err));
}

function back () {
  document.querySelector('#vehiclesInfos').style.display = 'none';
  document.querySelector('#vehiclesTypes').style.display = 'block';
}

function setType (type) {
  categoryType = type
  if (type === 'myVehicles') {
    if (myVehiclesList.length === 0) return;
    pageVehiclesList = myVehiclesList
    updateList(myVehiclesList, true, type);
  } else {
    const vehiclesFiltered = vehiclesList.filter(vehicle => vehicle.type === type);
    if (vehiclesFiltered.length === 0) return;
    pageVehiclesList = vehiclesFiltered
    updateList(vehiclesFiltered, false);
  }
  document.querySelector('#home').style.display = 'none';
  document.querySelector('header').style.display = 'none';
  document.querySelector('#category').style.display = 'block';
}

function updateList (vehicles, isMy) {
  document.querySelector('#category .vehicles').innerHTML = "";
  document.querySelector('#category .flyer img').src = `http://45.40.99.21:4020/lotus/carros/${vehicles[0].spawn}.png`;
  document.querySelector('#category .flyer .text span').innerHTML = String(categoryType).toUpperCase();
  vehicles.forEach(vehicle => {
    const div = document.createElement('div');
    div.classList.add('vehicle');
    div.innerHTML = `
      <h4>${vehicle.name}</h4>
      <img src = 'http://45.40.99.21:4020/lotus/carros/${vehicle.spawn}.png'>
      <span onclick="${vehicle.type === 'vip' ? `buyVehicle('${vehicle.spawn}', true)` : ''}">${vehicle.type !== 'vip' ? `<p>R$ ${Number(vehicle.price).toLocaleString("pt-br")}</p>` : 'ABRIR SITE'}</span>
    `
    document.querySelector('#category .vehicles').appendChild(div);
    div.addEventListener('click', () => {
      vehicleSelected(vehicle, vehicles, isMy);
    })
  })
  page = 1
}

function createPoints (points) {
  var result = '';
  var maxSlot = 12;
  for (var i = 0; i <= maxSlot; i++) {
    if (i < points) {
      result += '<div class = "active"></div>'
    } else {
      result += '<div></div>'
    }
  }
  return result
}

function setFirstVehicle (vehicle, isMy = false) {
  document.querySelector('.vehicleStat').innerHTML = `
  <h3>${vehicle[0]?.name}</h3>
  <img src="http://45.40.99.21:4020/lotus/carros/${vehicle[0]?.spawn}.png" alt="Vehicle Image">
  <div class="stats">
    <div class="stat">
      <p>Velocidade</p>
      <div class="statAmount">
        <p>${Math.floor(vehicle[0]?.maxspeed)}</p>
      </div>
    </div>
    <div class="stat">
      <p>Baú</p>
      <div class="statAmount">
        <p>${Math.floor(vehicle[0]?.trunk)} KG</p>
      </div>
    </div>
    <div class="stat">
      <p>Frenagem</p>
      <div class="statAmount">
        ${createPoints(vehicle[0]?.braking)}
      </div>
    </div>
    <div class="stat">
      <p>Agilidade</p>
      <div class="statAmount">
        ${createPoints(vehicle[0]?.agility)}
      </div>
    </div>
    <div class="stat">
      <p>Aderência</p>
      <div class="statAmount">
        ${createPoints(vehicle[0]?.aceleration)}
      </div>
    </div>
    <div class="buttons">
      ${isMy 
        ? `<button onclick="sell('${vehicle[0]?.spawn}')">VENDER PARA LOJA</button>` 
        : `<button onclick="buyVehicle('${vehicle[0]?.spawn}', '${vehicle[0]?.type === 'vip' ? 'vip' : ''}')">COMPRAR</button>`
      }
      ${isMy 
        ? `<button onclick="transfer('${vehicle[0]?.spawn}')">TRANSFERIR POSSE</button>` 
        : `<button onclick="testDrive('${vehicle[0]?.spawn}')">TEST-DRIVE</button>`
      }
    </div>
  </div>
`
}

function vehicleSelected (vehicle, vehicles, isMy = false) {
  page = 2;
  document.querySelector('#vehiclePreview .flyer').innerHTML = `
    <div class = 'preview'>
      <div class = 'interactions'>
        <h4>VEÍCULO</h4>
        <h2>${String(vehicle.name).toUpperCase()}</h2>
        <div class = 'buttons'>
          ${isMy ? `<button onclick="sell('${vehicle.spawn}', '${vehicle.type === 'vip' ? 'vip' : ''}')">VENDER</button>`  : `<button onclick="buyVehicle('${vehicle.spawn}', '${vehicle.type === 'vip' ? 'vip' : ''}')">COMPRAR</button>` }
          ${isMy ? `<button onclick="transfer('${vehicle.spawn}', '${vehicle.type === 'vip' ? 'vip' : ''}')">TRANSFERIR</button>` : `<button onclick="testDrive('${vehicle.spawn}')">TEST-DRIVE</button>`}
        </div>
      </div>
      <img src = 'http://45.40.99.21:4020/lotus/carros/${vehicle.spawn}.png'>
    </div>
    <div class = 'vehicleStats'>
      <div class = 'info'>
        <i class="fa-solid fa-box"></i>
        <p>ESTOQUE: ${vehicle.stock ?? 1}</p>
      </div>
      <div class = 'info'>
        <i class="fa-sharp fa-solid fa-car-side"></i>
        <p>${Math.floor(vehicle.trunk)} KG</p>
      </div>
      <div class = 'info'>
        <i class="fa-solid fa-gauge"></i>
        <p>${Math.floor(vehicle.maxspeed)} KM/H</p>
      </div>
      <div class = 'info'>
        <i class="fa-solid fa-gas-pump"></i>
        <p>${vehicle.fuelType ?? 'GASOLINA'}</p>
      </div>
      <div class = 'info'>
        <i class="fa-solid fa-seat-airline"></i>
        <p>${vehicle.seats ?? 4} ASSENTOS</p>
      </div>
    </div>
  `
  document.querySelector('#vehiclePreview .vehicles').innerHTML = ""
  document.querySelector("#vehiclePreview .moreVehicles h5").innerHTML = `CONFIRA MAIS VEICULOS <b style="text-transform: uppercase;">${vehicle.type}</b>`
  vehicles.forEach(vehicle => {
    const div = document.createElement('div');
    div.classList.add('vehicle');
    div.innerHTML = `
      <h4>${vehicle.name}</h4>
      <img src = 'http://45.40.99.21:4020/lotus/carros/${vehicle.spawn}.png'>
      <span onclick="${vehicle.type === 'vip' ? `buyVehicle('${vehicle.spawn}', true)` : ''}">${vehicle.type !== 'vip' ? `<p>R$ ${Number(vehicle.price).toLocaleString("pt-br")}</p>` : 'ABRIR SITE'}</span>
    `
    document.querySelector('#vehiclePreview .vehicles').appendChild(div);
    div.addEventListener('click', () => {
      vehicleSelected(vehicle, vehicles, isMy);
    })
  })
  document.querySelector('header').style.display = 'none';
  document.querySelector('#home').style.display = 'none';
  document.querySelector('#category').style.display = 'none';
  document.querySelector('#vehiclePreview').style.display = 'flex';
}

function updateBestSellers (vehicles) {
  document.querySelector('#home .vehicles').innerHTML = ""
  vehicles.forEach(vehicle => {
    const div = document.createElement('div');
    div.classList.add('vehicle');
    div.innerHTML = `
      <h4>${vehicle.name}</h4>
      <img src = 'http://45.40.99.21:4020/lotus/carros/${vehicle.spawn}.png'>
      <span onclick="${vehicle.type === 'vip' ? `buyVehicle('${vehicle.spawn}', true)` : ''}">${vehicle.type !== 'vip' ? `<p>R$ ${Number(vehicle.price).toLocaleString("pt-br")}</p>` : 'ABRIR SITE'}</span>
    `
    document.querySelector('#home .vehicles').appendChild(div);
    div.addEventListener('click', () => {
      vehicleSelected(vehicle, vehicles, isMy);
    })
  })
}

function close () {
  myVehiclesList = []
  vehiclesList = []
  promotional = {}
}

function buyVehicle(spawn, vip = false) {
  if (vip) {
    window.invokeNative('openUrl', 'https://021.hydrus.gg/categories/9799')
  } else {
    fetch('http://bm_module/buyVehicle', {
      method: 'POST',
      body: JSON.stringify({ vehicle: spawn })
    })
  }
}

function testDrive(spawn) {
  fetch('http://bm_module/testDrive', {
    method: 'POST',
    body: JSON.stringify({ vehicle: spawn })
  })
}

function searchVehicle({ target }) {
  const value = target.value.toLowerCase();
  if (value.length === 0) {
    updateList(pageVehiclesList);
  } else {
    updateList(pageVehiclesList.filter(vehicle => String(vehicle.name).toLocaleLowerCase().includes(value)));
  }
}

function sell(spawn, isVip = false ) {
  if (isVip) return;
  fetch('http://bm_module/sellVehicle', { 
    method: 'POST',
    body: JSON.stringify({ vehicle: spawn })
  })
}

function transfer(spawn, isVip = false ) {
  if (isVip) return;
  fetch('http://bm_module/transferVehicle', { 
    method: 'POST',
    body: JSON.stringify({ vehicle: spawn })
  })
}

function setPage() {
  if (page === 1) {
    document.querySelector('header').style.display = 'block';
    document.querySelector('#category').style.display = 'none';
    document.querySelector('#home').style.display = 'flex';
  }
  if (page === 2) {
    document.querySelector('header').style.display = 'none';
    document.querySelector('#home').style.display = 'none';
    document.querySelector('#vehiclePreview').style.display = 'none';
    document.querySelector('#category').style.display = 'block';
    page = 1
  }
}


var position = 2;
function updateSlide (side, element) {
  const container = element.parentElement.querySelector('.vehicles')
  const vehicles = element.parentElement.querySelector('.vehicles').querySelectorAll(".vehicle");
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