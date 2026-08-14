/* =========================================================
   BARRACRED CONECTA v2 — JavaScript Mesclado
   Fusão do nova-conecta + conecta-app
   ========================================================= */

// ============ UTILITÁRIOS ============
function select(el) {
  return typeof el === 'string' ? document.querySelector(el) : el;
}

function selectAll(el) {
  return typeof el === 'string' ? document.querySelectorAll(el) : el;
}

function isVariableDefined(el) {
  return typeof el !== 'undefined' && el !== null;
}

// ============ BANNER HERO (vídeo do YouTube) ============
// O hero agora usa um vídeo de fundo (YouTube embed) em vez do carrossel de imagens.

// ============ SCROLL NAVBAR ============
window.addEventListener("scroll", function () {
  const navbar = document.querySelector(".glass-nav");
  const navLinks = document.querySelectorAll('.navbar-nav .nav-link');

  if (window.scrollY > 50) {
    navbar.classList.add("scrolled");
  } else {
    navbar.classList.remove("scrolled");
    navLinks.forEach(link => link.classList.remove('active'));
    const homeLink = document.querySelector('.navbar-nav .nav-link[href="#home"]');
    if (homeLink) homeLink.classList.add('active');
  }
});

// ============ PRELOADER ============
function preLoader() {
  const preloader = select('.preloader');
  if (!isVariableDefined(preloader)) return;

  window.addEventListener('load', function () {
    preloader.className += ' animate__animated animate__fadeOut';
    setTimeout(function () {
      preloader.style.display = 'none';
    }, 200);
  });
}

// ============ WAVE CANVAS ============
function waveCanvas() {
  var canvas = document.getElementById('waveCanvas');
  if (!isVariableDefined(canvas)) return;

  var ctx = canvas.getContext('2d');

  function resizeCanvas() {
    canvas.width = canvas.parentNode.offsetWidth;
    canvas.height = window.innerWidth < 576 ? 180 : (window.innerWidth < 992 ? 210 : 240);
  }

  resizeCanvas();
  window.addEventListener('resize', resizeCanvas);

  let step = 0;
  const lines = 4;

  function loop() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    step += .8;
    for (let i = 0; i < lines; i++) {
      ctx.fillStyle = i === 0 ? 'rgba(255,255,255,.96)' : 'rgba(255,255,255,.72)';
      var angle = (step + i * 180 / lines) * Math.PI / 180;
      var deltaHeight = Math.sin(angle) * 42;
      var deltaHeightRight = Math.cos(angle) * 34;
      var base = canvas.height * .38;
      ctx.beginPath();
      ctx.moveTo(0, base + deltaHeight);
      ctx.bezierCurveTo(canvas.width / 2, base + deltaHeight - 34, canvas.width / 2, base + deltaHeightRight - 34, canvas.width, base + deltaHeightRight);
      ctx.lineTo(canvas.width, canvas.height);
      ctx.lineTo(0, canvas.height);
      ctx.lineTo(0, base + deltaHeight);
      ctx.closePath();
      ctx.fill();
    }
    requestAnimationFrame(loop);
  }
  loop();
}

// ============ BACK TO TOP ============
function backToTop() {
  const backBtn = document.querySelector('.back-top');
  if (!backBtn) return;

  window.addEventListener('scroll', function () {
    if (window.pageYOffset >= 500) {
      backBtn.classList.add('btn-show');
    } else {
      backBtn.classList.remove('btn-show');
    }
  });

  backBtn.addEventListener('click', function (e) {
    e.preventDefault();
    window.scrollTo({ top: 0, behavior: 'smooth' });
  });
}

// ============ TINY SLIDER ============
function tinySlider() {
  var $carousel = select('.tiny-slider-inner');
  if (!isVariableDefined($carousel)) return;

  var tnsCarousel = selectAll('.tiny-slider-inner');
  tnsCarousel.forEach(slider => {
    var slider1 = slider;
    var sliderMode = slider1.getAttribute('data-mode') ? slider1.getAttribute('data-mode') : 'carousel';
    var sliderAxis = slider1.getAttribute('data-axis') ? slider1.getAttribute('data-axis') : 'horizontal';
    var sliderSpace = slider1.getAttribute('data-gutter') ? slider1.getAttribute('data-gutter') : 30;
    var sliderEdge = slider1.getAttribute('data-edge') ? slider1.getAttribute('data-edge') : 0;

    var sliderItems = slider1.getAttribute('data-items') ? slider1.getAttribute('data-items') : 4;
    var sliderItemsXl = slider1.getAttribute('data-items-xl') ? slider1.getAttribute('data-items-xl') : Number(sliderItems);
    var sliderItemsLg = slider1.getAttribute('data-items-lg') ? slider1.getAttribute('data-items-lg') : Number(sliderItemsXl);
    var sliderItemsMd = slider1.getAttribute('data-items-md') ? slider1.getAttribute('data-items-md') : Number(sliderItemsLg);
    var sliderItemsSm = slider1.getAttribute('data-items-sm') ? slider1.getAttribute('data-items-sm') : Number(sliderItemsMd);
    var sliderItemsXs = slider1.getAttribute('data-items-xs') ? slider1.getAttribute('data-items-xs') : Number(sliderItemsSm);

    var sliderSpeed = slider1.getAttribute('data-speed') ? slider1.getAttribute('data-speed') : 500;
    var sliderautoWidth = slider1.getAttribute('data-autowidth') === 'true';
    var sliderArrow = slider1.getAttribute('data-arrow') !== 'false';
    var sliderDots = slider1.getAttribute('data-dots') !== 'false';

    var sliderAutoPlay = slider1.getAttribute('data-autoplay') !== 'false';
    var sliderAutoPlayTime = slider1.getAttribute('data-autoplaytime') ? slider1.getAttribute('data-autoplaytime') : 4000;
    var sliderHoverPause = slider1.getAttribute('data-hoverpause') === 'true';
    var sliderLoop = true;
    var sliderRewind = false;
    var sliderAutoHeight = slider1.getAttribute('data-autoheight') === 'true';
    var sliderfixedWidth = slider1.getAttribute('data-fixedwidth') === 'true';
    var sliderTouch = slider1.getAttribute('data-touch') !== 'false';
    var sliderDrag = slider1.getAttribute('data-drag') !== 'false';

    var ifRtl = document.getElementsByTagName("html")[0].getAttribute("dir");
    var sliderDirection;
    if (ifRtl === 'rtl') sliderDirection = 'rtl';

    var tnsSlider = tns({
      container: slider,
      mode: sliderMode,
      axis: sliderAxis,
      gutter: sliderSpace,
      edgePadding: sliderEdge,
      speed: sliderSpeed,
      autoWidth: sliderautoWidth,
      controls: sliderArrow,
      nav: sliderDots,
      autoplay: sliderAutoPlay,
      autoplayTimeout: sliderAutoPlayTime,
      autoplayHoverPause: sliderHoverPause,
      autoplayButton: false,
      autoplayButtonOutput: false,
      controlsPosition: 'top',
      navPosition: 'top',
      autoplayPosition: 'top',
      controlsText: ['&#8249;', '&#8250;'],
      loop: sliderLoop,
      rewind: sliderRewind,
      autoHeight: sliderAutoHeight,
      fixedWidth: sliderfixedWidth,
      touch: sliderTouch,
      mouseDrag: sliderDrag,
      arrowKeys: true,
      items: sliderItems,
      textDirection: sliderDirection,
      responsive: {
        0: { items: Number(sliderItemsXs) },
        576: { items: Number(sliderItemsSm) },
        768: { items: Number(sliderItemsMd) },
        992: { items: Number(sliderItemsLg) },
        1200: { items: Number(sliderItemsXl) }
      }
    });

    if (slider.classList.contains('team')) {
      slider.closest('.team-carousel-wrap').addEventListener('mouseenter', function () {
        tnsSlider.pause();
      });
      slider.closest('.team-carousel-wrap').addEventListener('mouseleave', function () {
        tnsSlider.play();
      });
    }
  });
}

// ============ SCROLL SPY ============
function scrollSpy() {
  const navLinks = Array.from(document.querySelectorAll('.navbar-nav .nav-link[href^="#"]'));
  const navbarCollapse = document.querySelector('.navbar-collapse');

  if (!navLinks.length) return;

  const sections = navLinks
    .map(link => {
      const id = link.getAttribute('href');
      return id && id.length > 1 ? document.querySelector(id) : null;
    })
    .filter(Boolean);

  if (!sections.length) return;

  function setActiveBySection() {
    const header = document.querySelector('.site-header');
    const headerOffset = header ? header.offsetHeight + 32 : 120;
    const scrollPosition = window.scrollY + headerOffset;
    let activeId = sections[0].id;

    sections.forEach(section => {
      if (section.offsetTop <= scrollPosition) {
        activeId = section.id;
      }
    });

    navLinks.forEach(link => {
      link.classList.toggle('active', link.getAttribute('href') === `#${activeId}`);
    });
  }

  let ticking = false;
  window.addEventListener('scroll', () => {
    if (!ticking) {
      window.requestAnimationFrame(() => {
        setActiveBySection();
        ticking = false;
      });
      ticking = true;
    }
  }, { passive: true });

  window.addEventListener('resize', setActiveBySection);
  window.addEventListener('hashchange', setActiveBySection);

  navLinks.forEach(link => {
    link.addEventListener('click', () => {
      if (navbarCollapse && navbarCollapse.classList.contains('show')) {
        const collapseInstance = bootstrap.Collapse.getOrCreateInstance(navbarCollapse, { toggle: false });
        collapseInstance.hide();
      }
      setTimeout(setActiveBySection, 80);
    });
  });

  setActiveBySection();
}

// ============ TURMAS FILTER (conecta-app) ============
function turmasFilter() {
  document.querySelectorAll('.tf-btn').forEach(btn => {
    btn.addEventListener('click', () => {
      document.querySelectorAll('.tf-btn').forEach(b => b.classList.remove('active'));
      btn.classList.add('active');
      const year = btn.dataset.year;
      document.querySelectorAll('.aluno-card').forEach(card => {
        const show = year === 'todas' || card.dataset.year === year;
        card.style.display = show ? '' : 'none';
        if (show) card.classList.add('in');
      });
    });
  });
}

// ============ SCROLL REVEAL (decorativo) ============
function initReveal() {
  if (!('IntersectionObserver' in window)) return;

  const targets = document.querySelectorAll(
    '.section-heading, .content-card, .glass-card, .mission-card, .modern-feature-card, ' +
    '.project-card, .team-item, .aluno-card, .stop-card, .photo-tile, .image-frame, ' +
    '.cta-panel, .info-pills, .dark-glass-card'
  );

  targets.forEach((el, i) => {
    el.classList.add('reveal-up');
    el.style.transitionDelay = (i % 6) * 60 + 'ms';
  });

  const observer = new IntersectionObserver((entries) => {
    entries.forEach((entry) => {
      if (entry.isIntersecting) {
        entry.target.classList.add('in');
        observer.unobserve(entry.target);
      }
    });
  }, { threshold: 0.12, rootMargin: '0px 0px -8% 0px' });

  targets.forEach((el) => observer.observe(el));
}

// ============ NAVBAR TOGGLE (desktop minimize) ============
function navbarToggle() {
  const brand = document.querySelector('.glass-nav .navbar-brand');
  const glassNav = document.querySelector('.glass-nav');
  if (!glassNav || !brand) return;

  brand.addEventListener('click', function (e) {
    if (window.innerWidth >= 1200) {
      e.stopPropagation();
      e.preventDefault();
      glassNav.classList.toggle('navbar-minimized');
    }
  }, true);
}

// ============ GALLERY INFINITE CLONE ============
function galleryClone() {
  document.querySelectorAll('.gallery-track').forEach(function(track) {
    var items = track.innerHTML;
    track.innerHTML = items + items;
  });
}

// ============ MISSION CAROUSEL ============
function missionCarousel() {
  const slides = [document.getElementById('missionSlideLogo'), document.getElementById('missionSlideBuilding')];
  if (!slides[0] || !slides[1]) return;
  let current = 0;
  setInterval(() => {
    slides[current].classList.remove('active');
    current = (current + 1) % slides.length;
    slides[current].classList.add('active');
  }, 5000);
}

// ============ INIT ============
document.addEventListener("DOMContentLoaded", function () {
  preLoader();
  waveCanvas();
  backToTop();
  scrollSpy();
  tinySlider();
  turmasFilter();
  initReveal();
  navbarToggle();
  galleryClone();
  missionCarousel();
});