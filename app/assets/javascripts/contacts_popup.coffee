$ ->
  $p = -> $(".contacts-popup")

  $document = $(document)

  $document.on 'click', ".popup-close", ->
    $p().removeClass "popup-reveal"
    return

  $document.on 'click', ".overlay", (e) ->
    $p().removeClass "popup-reveal"  if e.target is this
    return

  $document.on 'click', "#contacts-popup", ->
    $p().addClass "popup-reveal"
    return