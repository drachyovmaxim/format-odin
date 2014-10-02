$ ->
  $p = -> $(".buy-popup")

  $document = $(document)

  $document.on 'click', ".popup-close", ->
    $p().removeClass "popup-reveal"
    return

  $document.on 'click', ".overlay", (e) ->
    $p().removeClass "popup-reveal"  if e.target is this
    return

  $document.on 'click', "#buy-print", ->
    $p().addClass "popup-reveal"
    return