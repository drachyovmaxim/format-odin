init =  ->
  $p = -> $(".popup-wrapper-contacts")
  $(".image-link").magnificPopup type: "image"
 
$ -> init()
$(document).on 'page:change', init