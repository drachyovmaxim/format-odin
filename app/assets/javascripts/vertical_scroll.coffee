$(document).ready ->
  $(".prints").mousewheel (event, delta) ->
    event.preventDefault()
    @scrollLeft -= delta
    false