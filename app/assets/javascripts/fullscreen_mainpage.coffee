$ ->
  $w = $(window)
  $w.load ->
    $(".exibition-header").css height: ($(window).height())

  $w.resize ->
    $(".exibition-header").css height: ($(window).height())