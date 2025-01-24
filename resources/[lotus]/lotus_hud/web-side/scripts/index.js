import './velocimeter.js'
import './player.js'
import './notify.js'
import './recruitment.js'
import './progress.js'
import './config.js'

window.addEventListener('message', ({ data }) => {
  if (data.action === 'isNovat') document.querySelector('.server .novat').style.display = data.isNovat ? 'flex' : 'none' 
  if (data.action === 'isAssaultTime') document.querySelector('.server .assault').style.display = data.assaultTime ? 'flex' : 'none'   
  if (data.action === 'notify:open') {
    const container = document.querySelector('#app')
    container.style.display = 'block';
    container.querySelector("textarea").focus()
  }

  if (data.action === 'notify:close') document.querySelector('#app').style.display = 'none';
  if (data.action === 'notify:recruitment') recruitment.renderRecruitment(data);
  if (data.action === 'remove' && recruitment.recruitmentInScreen !== false) recruitment.remove()
  if (data.action === 'config') document.querySelector('.config').style.display = data.show ? 'block' : 'none'

  if (data.action === 'appendUser') {
    if (document.getElementById(data.user_id)) return;
    document.querySelector('.users').innerHTML += `
      <span id = "${data.user_id}">
      <svg width="10" height="15" viewBox="0 0 10 15" fill="none" xmlns="http://www.w3.org/2000/svg">
        <path d="M7.76726 5.2254C7.76726 6.01509 7.77909 6.80478 7.76726 7.5933C7.74135 8.99719 6.6942 10.2016 5.37217 10.3689C3.99889 10.5444 2.71403 9.67807 2.34339 8.31864C2.28035 8.09446 2.24662 7.86249 2.24312 7.62897C2.23467 6.01157 2.21947 4.39361 2.24312 2.77679C2.26115 1.65134 2.825 0.830042 3.7685 0.33049C4.69792 -0.161457 5.64761 -0.103536 6.52071 0.501892C7.31832 1.05409 7.75994 1.84146 7.76726 2.85811C7.7729 3.64721 7.76726 4.43747 7.76726 5.2254Z" fill="white"/>
        <path d="M4.4267 13.8412V12.7105C3.95411 12.5648 3.47306 12.4812 3.04665 12.2747C1.08755 11.3265 0.0584265 9.72138 0.00491445 7.46345C-0.00297155 7.13237 -0.000155121 6.8007 0.00491445 6.46903C0.0105473 6.04435 0.236419 5.77876 0.576079 5.78753C0.903348 5.79572 1.10163 6.05896 1.11797 6.46843C1.145 7.12826 1.10895 7.80448 1.23681 8.44442C1.61478 10.3321 3.32097 11.6277 5.21023 11.5371C7.04485 11.4487 8.61022 9.96705 8.83103 8.07414C8.89299 7.54476 8.87101 7.00483 8.88228 6.4696C8.89073 6.06013 9.09464 5.79631 9.42191 5.78753C9.75988 5.77817 9.99139 6.04433 9.9942 6.46843C9.99927 7.39383 10.0505 8.32976 9.71989 9.21363C9.0248 11.0679 7.75854 12.2361 5.85125 12.6064C5.76 12.6239 5.66988 12.6462 5.56961 12.6684V13.8383C6.22753 13.8383 6.87248 13.8383 7.51688 13.8383C7.63862 13.8337 7.76049 13.8415 7.88076 13.8617C8.01087 13.8885 8.12717 13.9635 8.208 14.0727C8.28883 14.1819 8.32867 14.3179 8.32012 14.4554C8.30963 14.5923 8.25309 14.721 8.16041 14.819C8.06772 14.9169 7.94479 14.9779 7.81317 14.9912C7.75695 14.9958 7.70054 14.9972 7.64418 14.9953C5.87941 14.9953 4.1152 15.0012 2.3493 14.9871C2.15773 14.9776 1.97339 14.9083 1.82038 14.7882C1.6452 14.6496 1.62323 14.4186 1.71673 14.2004C1.82319 13.9506 2.02091 13.8394 2.28002 13.8389C2.89024 13.8389 3.50028 13.8389 4.11013 13.8389L4.4267 13.8412Z" fill="white"/>
      </svg>-
      ${data.name}
    `;
    return
  }

  if (data.action === 'removeUser') return document.getElementById(String(data.user_id)).remove();

  if (data.action === 'cupom:visibled') {
    if (data.visibled) document.querySelector('#cupom').style.display = 'block'
    else document.querySelector('#cupom').style.display = 'none'
  }
})


window.addEventListener('keydown', (e) => {
  if (e.key === 'Escape') {
    document.querySelector('.config').style.display = 'none';
    fetch(`https://lotus_hud/close`, { method: 'POST', body : JSON.stringify({}) })
  }
})