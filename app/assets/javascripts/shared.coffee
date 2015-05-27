$ ->
  $('.collapse').on 'shown.bs.collapse', (e) ->
    alert 'shown'
    return
  $('.collapse').on 'hidden.bs.collapse', (e) ->
    alert 'hidden'
    return
  return