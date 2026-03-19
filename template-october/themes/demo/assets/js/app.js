$(document).ready(function () {
  // Mobile menu
  var menu = $(".menu");
  var burger = $(".burger");
  var menuCloseButton = $(".menu__close");
  var body = $("body");

  burger.click(function () {
    menu.addClass("active");
    body.addClass("hidden");
  });

  menuCloseButton.click(function () {
    menu.removeClass("active");
    body.removeClass("hidden");
  });

  // Phone mask
  $.fn.setCursorPosition = function (pos) {
    if ($(this).get(0).setSelectionRange) {
      $(this).get(0).setSelectionRange(pos, pos);
    } else if ($(this).get(0).createTextRange) {
      var range = $(this).get(0).createTextRange();
      range.collapse(true);
      range.moveEnd("character", pos);
      range.moveStart("character", pos);
      range.select();
    }
  };

  $("input[type='tel']")
    .click(function () {
      $(this).setCursorPosition(3);
    })
    .mask("+7(999) 999-9999");

  // Image gallery
  Fancybox.bind('[data-fancybox="charters-fancy"]', {
    // Your custom options
  });

  $('a[href^="#"]').on("click", function (event) {
    var target = $($(this).attr("href"));

    if (target.length) {
      event.preventDefault();
      $("html, body").animate(
        {
          scrollTop: target.offset().top - 120,
        },
        500
      );
    }
  });
});

const exampleSlider = new Swiper(".example__items", {
  speed: 500,
  spaceBetween: 10,
  slidesPerView: 2,
  // effect: "fade",
  // loop: true,
  grabCursor: true,
  // autoplay: {
  //   delay: 3000,
  //   disableOnInteraction: false,
  // },

  // navigation: {
  //   nextEl: ".example__next",
  //   prevEl: ".example__prev",
  // },

  pagination: {
    el: ".example__pagination",
    clickable: true,
  },

  breakpoints: {
    480: {
      slidesPerView: 3,
      spaceBetween: 10,
    },
    700: {
      slidesPerView: 4,
      spaceBetween: 10,
    },
    992: {
      slidesPerView: 4,
      spaceBetween: 32,
    },
  },
});