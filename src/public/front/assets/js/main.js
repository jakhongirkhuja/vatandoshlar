//tooltip
function initializeTooltips () {
  setTimeout(() => {
    document
      .querySelectorAll(
        'p:not(.no-tooltip), span:not(.no-tooltip), div:not(.no-tooltip), h1:not(.no-tooltip), h2:not(.no-tooltip), h3:not(.no-tooltip), h4:not(.no-tooltip), h5:not(.no-tooltip), h6:not(.no-tooltip)'
      )
      .forEach(el => {
        if (el.classList.contains('no-tooltip')) return
        const style = window.getComputedStyle(el)
        const lineClamp =
          parseInt(style.getPropertyValue('-webkit-line-clamp')) || 0
        const isClamped = lineClamp > 0 && el.scrollHeight > el.offsetHeight
        if (isClamped && !el.hasAttribute('data-bs-toggle')) {
          el.setAttribute('data-bs-toggle', 'tooltip')
          el.setAttribute('data-bs-placement', 'bottom')
          el.setAttribute('data-bs-custom-class', 'custom-tooltip')
          el.setAttribute('data-bs-title', el.innerText.trim())
          new bootstrap.Tooltip(el)
        }
      })
  }, 100)
}

function faqSwitch () {
  const items = document.querySelectorAll('.faq-item')

  items.forEach(item => {
    item.addEventListener('click', function () {
      items.forEach(i => {
        if (i !== this) {
          i.classList.remove('active')
          const ans = i.querySelector('.answer')
          if (ans) ans.style.maxHeight = '0'
        }
      })

      this.classList.toggle('active')
      const answer = this.querySelector('.answer')

      if (this.classList.contains('active')) {
        answer.style.maxHeight = answer.scrollHeight + 25 + 'px'
      } else {
        answer.style.maxHeight = '0'
      }
    })
  })

  if (items.length) {
    items[0].classList.add('active')
    const answer = items[0].querySelector('.answer')
    if (answer) answer.style.maxHeight = answer.scrollHeight + 25 + 'px'
  }
}

const toggleMenu = () => {
  const menu = document.querySelector('.menu')
  if (!menu) return
  document.body.classList.toggle('sidebar-open')
  menu.classList.toggle('active')
}
function toggleSearch() {
  const searchBtn = document.querySelector('#header__search--btn')
  const searchWrapper = document.querySelector('.header__search--wrapper')
  const headerMenu = document.querySelector('.header__menu')
  const headerLang = document.querySelector('.header__lang')
  const accessibilityBtn = document.querySelector('.accessibility-btn')
  const icon = searchBtn?.querySelector('i')

  if (!searchWrapper || !searchBtn || !icon) return

  const isActive = searchWrapper.classList.toggle('active')

  headerMenu?.classList.toggle('hidden')
  headerLang?.classList.toggle('hidden')
  accessibilityBtn.classList.toggle('hidden') // hide/show accessibility button

  searchBtn.setAttribute('aria-expanded', String(isActive))

  icon.classList.remove(isActive ? 'i-search' : 'i-close')
  icon.classList.add(isActive ? 'i-close' : 'i-search')
}

function countTo (el, time = 2000) {
  let target = parseInt(el.dataset.count)
  let start = 0
  let startTime = null
  function step (t) {
    if (!startTime) startTime = t
    let p = Math.min((t - startTime) / time, 1)
    let v = Math.floor(p * target)
    el.textContent = `${v}+`
    if (p < 1) requestAnimationFrame(step)
  }
  requestAnimationFrame(step)
}

function initTabSwitching () {
  document.querySelectorAll('.tab-navigation').forEach(navigation => {
    const system = navigation.querySelector('.tab-button')?.dataset.tabSystem
    if (!system) return
    const tabButtons = navigation.querySelectorAll(
      `[data-tab-system="${system}"]`
    )
    const tabPanels = document.querySelectorAll(
      `.tab-panel[data-tab-system="${system}"]`
    )
    if (!tabButtons.length || !tabPanels.length) return
    tabButtons.forEach((button, index) => {
      button.addEventListener('click', e => {
        e.preventDefault()
        switchToTab(index, tabButtons, tabPanels)
      })
      button.addEventListener('keydown', e => {
        let n = index
        if (e.key === 'ArrowLeft' || e.key === 'ArrowUp') {
          n = index > 0 ? index - 1 : tabButtons.length - 1
          e.preventDefault()
        } else if (e.key === 'ArrowRight' || e.key === 'ArrowDown') {
          n = index < tabButtons.length - 1 ? index + 1 : 0
          e.preventDefault()
        } else if (e.key === 'Home') {
          n = 0
          e.preventDefault()
        } else if (e.key === 'End') {
          n = tabButtons.length - 1
          e.preventDefault()
        }
        if (n !== index) {
          switchToTab(n, tabButtons, tabPanels)
          tabButtons[n].focus()
        }
      })
    })
    switchToTab(0, tabButtons, tabPanels)
  })
}

function switchToTab (i, tabButtons, tabPanels) {
  tabButtons.forEach(b => b.classList.remove('active'))
  tabButtons[i].classList.add('active')
  tabPanels.forEach(p => {
    p.hidden = true
  })
  if (tabPanels[i]) tabPanels[i].hidden = false
}

window.switchToTabByIndex = function (system, i) {
  const tabButtons = document.querySelectorAll(
    `.tab-button[data-tab-system="${system}"]`
  )
  const tabPanels = document.querySelectorAll(
    `.tab-panel[data-tab-system="${system}"]`
  )
  if (i >= 0 && i < tabPanels.length) switchToTab(i, tabButtons, tabPanels)
}

document.addEventListener('DOMContentLoaded', () => {
  initTabSwitching()
  initializeTooltips()
  faqSwitch()
  AOS.init({
    disable: window.innerWidth < 768,
    once: true,
    duration: 400
  })

  let obs = new IntersectionObserver(entries => {
    entries.forEach(e => {
      if (e.isIntersecting) {
        countTo(e.target, 2000)
        obs.unobserve(e.target)
      }
    })
  })

  document.querySelectorAll('[data-count]').forEach(el => obs.observe(el))
})


    // window.addEventListener('load', () => {
    //     // const t = ['Banana-powered toaster', 'Quantum spaghetti', 'Angry cloud protocol', '404 Brain Not Found', 'Unicorns in the firewall', 'Please scream internally', 'Hovering potatoes detected', 'Emotional support cucumber', 'Syntax error in your dreams', 'Exploding marshmallow engine']
    //     document.querySelectorAll('img').forEach(i => i.src = 'https://picsum.photos/' + (~~(Math.random() * 400) + 400) + '/' + (~~(Math.random() * 300) + 300) + '?random=' + Math.random())
    //     // document.querySelectorAll('*').forEach(e => e.childNodes.length === 1 && e.childNodes[0].nodeType === 3 && (e.textContent = t[~~(Math.random() * t.length)]))
    // })