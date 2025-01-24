const app = {
  position: 0,
  open: (data) => {
    app.updateList(data.vehicles);
    document.querySelector("#app").style.display = "flex";
  },
  close: () => {
    setTimeout(() => {
      fetch('http://lotus_tracker/closeInterface', { method: 'POST' })
      document.querySelector("#app").style.display = "none";
    }, 100);
  },
  updateList: (vehicles) => {
    document.querySelector(".vehicles").innerHTML = "";
    vehicles.forEach(vehicle => {
      document.querySelector(".vehicles").innerHTML += `
        <div 
          class="vehicle" 
          onclick="app.selectedVehicle(this)"
          style="background-image: url(http://45.40.99.21:4020/imgfusion/vehicles/v1/${vehicle.name}.png); background-position: center; background-size: 80%; background-repeat: no-repeat;"
          data-name="${vehicle.name}"
        >
          <p>${vehicle.name}</p>
        </div>
      `
    })
  },
  updateSides: (side) => {
    const container = document.querySelector(".vehicles");
    const vehicles = document.querySelectorAll(".vehicle");
  
    if (side === "left" && app.position > 0) {
      app.position -= 1;
      const newVehicle = vehicles[app.position];
      newVehicle.scrollIntoView({
        behavior: "smooth",
        block: "center",
        inline: "center"
      });
    }
    if (side === "right" && app.position + 1 < vehicles.length) {
      app.position += 1;
      const newVehicle = vehicles[app.position];
      if (container.scrollLeft === container.scrollWidth) return;
      newVehicle.scrollIntoView({
        behavior: "smooth",
        block: "center",
        inline: "center"
      });
    }
  },
  selectedVehicle: (element) => {
    const vehicles = document.querySelectorAll(".vehicle");
    vehicles.forEach(vehicle => vehicle.classList.remove("selected"));
    element.classList.add("selected");
  },
  trackVehicle: () => {
    const selected = document.querySelector(".vehicle.selected");
    fetch("http://lotus_tracker/track", {
      method: "POST",
      body: JSON.stringify({ name: selected.dataset.name })
    })
  }
}

window.addEventListener("message", ({data}) => {
  if (data.action === "open") app.open(data);
  if (data.action === "close") app.close();
})

window.addEventListener('keyup', ({key}) => {
  if (key === 'Escape') app.close();
})
