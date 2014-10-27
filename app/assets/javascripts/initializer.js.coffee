$ ->

  $('.show-shops').on 'click', ->
    $('body').animate({scrollTop: "#{$(".shops-title").offset().top}px"}, 300)
    false