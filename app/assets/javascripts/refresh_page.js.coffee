$(document).ready ->
	if $('#roomsContainer').height() > 0
		getRoom1 = () ->
			room1Promise = $.Deferred()
			$.ajax
				url:'/getCurrent'
				data: { data: 'room1'}
				type:'get'
				timeout:3000
				success: (json) ->
					room1Promise.resolve json
				error: (error) ->
					promise.reject error

		getRoom2 =() ->
			room2Promise = $.Deferred()
			room2Promise.resolve 'me balls'
			return room2Promise

		getRoom3 = () ->
			room3Promise = $.Deferred()



		getRoom4 = () ->
			room4Promise = $.Deferred()






	$.when(getRoom1(), getRoom2()).then (printThis, printThat) ->
		
		alert JSON.stringify printThis[0].reading