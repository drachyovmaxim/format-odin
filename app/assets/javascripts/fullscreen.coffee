init = ->
  $cover = $("#image-wrapper")

  if $cover.length > 0

    setFullPageHeight = (page) ->
      viewportHeight = $(window).height()
      $cover.next().css marginTop: viewportHeight - 82

    setFullPageHeight $cover
    $(window).resize ->
      setFullPageHeight $cover

$ -> init()
$(document).on 'page:change', init