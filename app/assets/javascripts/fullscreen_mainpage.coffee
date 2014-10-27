$ ->
  $w = $(window)
  $w.load ->
    $(".exhibition-header").css height: ($(window).height())

  $w.resize ->
    $(".exhibition-header").css height: ($(window).height())