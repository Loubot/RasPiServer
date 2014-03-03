$(document).ready ->

  $('#pressB').on 'click', ->
    room =  $('#count').find('option:selected').attr('value')
    reading = $('#data').val()
    alert room
    $.ajax
      url: 'http://localhost:3000/setTemp.json'
      data: { data: [room, reading] }
      type:'post'

window.setTemp = (roomNo) ->
  reading = $("#room#{roomNo}Input").val()
  $.ajax
    url: 'http://localhost:3000/setTemp.json'
    data: { data: [roomNo, reading] }
    type: 'post'
    timeout:3000
    success: (json) ->    
      location.reload()
    error: (error) ->
      alert JSON.stringify error