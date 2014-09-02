$ ->
  $p = -> $(".contacts-popup")

  $document = $(document)

  $document.on 'click', ".popup-close", ->
    $p().css "display", "none"
    return

  $document.on 'click', ".overlay", (e) ->
    $p().css "display", "none"  if e.target is this
    return

  $document.on 'click', "#contacts-popup", ->
    $p().css "display", "block"
    return