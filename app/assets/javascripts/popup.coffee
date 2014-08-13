$ ->
  $p = -> $(".popup-wrapper")

  $document = $(document)

  $document.on 'click', ".popup-close", ->
    $p().css "display", "none"
    return

  $document.on 'click', ".transparent", (e) ->
    $p().css "display", "none"  if e.target is this
    return

  $document.on 'click', "#about-popup", ->
    $p().css "display", "block"
    return
