const OPTIONS = {
  hud: {
    display: ['.player2', '.player'],
    localStorageKey: 'hud',
    localStorageValue: '1',
    activeIndex: 0,
    inactiveIndex: 1,
  },
  hud2: {
    display: ['.player', '.player2'],
    localStorageKey: 'hud',
    localStorageValue: '2',
    activeIndex: 1,
    inactiveIndex: 0,
  },
  velocimeter: {
    display: ['.velocimeter', '.velocimeter2'],
    localStorageKey: 'velocimeter',
    localStorageValue: '1',
    activeIndex: 2,
    inactiveIndex: 3,
  },
  velocimeter2: {
    display: ['.velocimeter2', '.velocimeter'],
    localStorageKey: 'velocimeter',
    localStorageValue: '2',
    activeIndex: 3,
    inactiveIndex: 2,
  },
};

function handleConfig(element, option) {
  const { display, localStorageKey, localStorageValue, activeIndex, inactiveIndex } = OPTIONS[option];

  document.querySelector(display[0]).style.display = 'flex';
  document.querySelector(display[1]).style.display = 'none';

  element && element.classList.add('active');
  document.querySelectorAll('.config .card')[activeIndex].classList.add('active');
  document.querySelectorAll('.config .card')[inactiveIndex].classList.remove('active');

  localStorage.setItem(localStorageKey, localStorageValue);
}

const hud = localStorage.getItem('hud');
const velocimeter = localStorage.getItem('velocimeter');

if (!hud) localStorage.setItem('hud', '1');
if (!velocimeter) localStorage.setItem('velocimeter', '1');

if (hud === '1') {
  handleConfig(null, 'hud');
} else {
  handleConfig(null, 'hud2');
}

if (velocimeter === '1') {
  handleConfig(null, 'velocimeter');
} else {
  handleConfig(null, 'velocimeter2');
}
