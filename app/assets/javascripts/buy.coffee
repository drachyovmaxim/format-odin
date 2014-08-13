init = ->
  $p = $(".popup-wrapper-buy")

  $document = $(document)

  getPopup = (el) ->
    popupId = $(el).data('popup-id')
    $p.filter("##{popupId}")

  $document.on 'click', ".popup-close", (e) ->
    $p.hide()

  $document.on 'click', ".transparent", (e) ->
    $p.hide() if e.target is this

  $document.on 'click', "#buy-print", (e) ->
    getPopup(e.target).show()

$(document).on 'page:change', init
