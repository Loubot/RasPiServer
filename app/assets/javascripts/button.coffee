$(document).ready ->

  $('#pressB').on 'click', ->
    room =  $('#count').find('option:selected').attr('value')
    reading = $('#data').val()
    alert room
    $.ajax
      url: 'setTemp.json'
      data: { data: [room, reading] }
      type:'post'
      timeout: 3000

  $('#xl').on 'click', ->
    $.ajax
      url:'doSheet.json'
      type:'get'
      timeout: 3000

window.setTemp = (roomNo) ->
  reading = $("#room#{roomNo}Input").val()
  $.ajax
    url: 'setTemp.json'
    data: { data: [roomNo, reading] }
    type: 'post'
    timeout:3000
    success: (json) ->    
      location.reload()
    error: (error) ->
      alert JSON.stringify error