requestAnimationFrame = window.requestAnimationFrame       ||
                        window.mozRequestAnimationFrame    ||
                        window.webkitRequestAnimationFrame ||
                        window.msRequestAnimationFrame     ||
                        (callback, element) ->
                          window.setTimeout(callback, 300)

about = false

reset = ->
  about = $(".about-popup")
  
proxyScroll = ->
  scroll = $(window).scrollTop()
  if scroll >= 250
    about.addClass "fixed-about"
  else
    about.removeClass("fixed-about")
  return

$ -> reset()
$(document).on 'page:change', reset
$(window).on 'scroll', ->
  requestAnimationFrame(proxyScroll)