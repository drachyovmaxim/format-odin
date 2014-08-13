$(document).ready ->
  init = ->
    window.addEventListener "scroll", (e) ->
      distanceY = window.pageYOffset or document.documentElement.scrollTop
      shrinkOn = 140
      logotype = document.querySelector(".logo img")

      if distanceY > shrinkOn
        logotype.setAttribute "class", "smaller"
      else
        logotype.removeAttribute "class"
      return

    return
  window.onload = init()