requestAnimationFrame = window.requestAnimationFrame       ||
                        window.mozRequestAnimationFrame    ||
                        window.webkitRequestAnimationFrame ||
                        window.msRequestAnimationFrame     ||
                        (callback, element) ->
                          window.setTimeout(callback, 300)

header = false
menu = false

reset = ->
  header = $(".header.home")
  menu = $(".header ul li")
  
proxyScroll = ->
  scroll = $(window).scrollTop()
  if scroll >= 140
    header.addClass "transparent-header"
    menu.removeClass "transparent-menu"
  else
    header.removeClass("transparent-header")
    menu.addClass "transparent-menu"
  return

$ -> reset()
$(document).on 'page:change', reset
$(window).on 'scroll', ->
  requestAnimationFrame(proxyScroll)