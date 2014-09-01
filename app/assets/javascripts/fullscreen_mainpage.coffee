$ ->
  $w = $(window)
  $w.load ->
    $(".main-page").css height: ($(window).height())

  $w.resize ->
    $(".main-page").css height: ($(window).height())