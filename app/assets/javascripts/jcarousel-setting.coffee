init = ->
  $(".jcarousel").jcarousel({
    wrap: 'circular'
  })
  $('.jcarousel').jcarouselAutoscroll({
    interval: 5000
  })
  $(".jcarousel-control-prev").on("jcarouselcontrol:active", ->
    $(this).removeClass "inactive"
    return
  ).on("jcarouselcontrol:inactive", ->
    $(this).addClass "inactive"
    return
  ).jcarouselControl target: "-=1"
  $(".jcarousel-control-next").on("jcarouselcontrol:active", ->
    $(this).removeClass "inactive"
    return
  ).on("jcarouselcontrol:inactive", ->
    $(this).addClass "inactive"
    return
  ).jcarouselControl target: "+=1"
  $(".jcarousel-pagination").on("jcarouselpagination:active", "a", ->
    $(this).addClass "active"
    return
  ).on("jcarouselpagination:inactive", "a", ->
    $(this).removeClass "active"
    return
  ).jcarouselPagination()
  resize()

resize = ->
  $(".jcarousel li").each (index) ->
    $li = $ @
    $li.css
      width: window.innerWidth

$ -> init()
$(document).on 'page:change', init
$(window).on 'resize', resize