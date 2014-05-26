$(document).ready ->
	if $('#roomsContainer').height() > 0
		setInterval ->
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
						room1Promise.reject error

				return room1Promise

			getRoom2 =() ->
				room2Promise = $.Deferred()
				$.ajax
					url:'/getCurrent'
					data: { data: 'room2'}
					type: 'get'
					timeout:3000
					success: (json) ->
						room2Promise.resolve json
					error: (error) ->
						room2Promise.reject error
				return room2Promise

			getRoom3 = () ->
				room3Promise = $.Deferred()
				$.ajax
					url:'/getCurrent'
					data:{ data: 'room3'}
					type: 'get'
					timeout: 3000
					success: (json) ->
						room3Promise.resolve json
					error: (error) ->
						room3Promise.reject error
				return room3Promise


			getRoom4 = () ->
				room4Promise = $.Deferred()
				$.ajax
					url:'/getCurrent'
					data:{ data: 'room4'}
					type:'get'
					timeout: 3000
					success: (json) ->
						room4Promise.resolve json
					error: (error) ->
						room4Promise.reject error
				return room4Promise

			getRoom5 = () ->
				room5Promise = $.Deferred()
				$.ajax
					url:'/getCurrent'
					data:{ data: 'room5'}
					type:'get'
					timeout: 3000
					success: (json) ->
						room5Promise.resolve json
					error: (error) ->
						room5Promise.reject error
				return room5Promise




			$.when(getRoom1(), getRoom2(), getRoom3(), getRoom4(), getRoom5()).then (printThis, printThat, printThese, printThose, printBla) ->		
				$('#room1Reading').text(printThis.reading)
				$('#room1ReadingTime').text(printThis.updated_at)
				$('#room2Reading').text(printThat.reading)
				$('#room3Reading').text(printThese.reading)
				$('#room4Reading').text(printThose.reading)
				$('#room5Reading').text(printBla.reading)
		, 10000

	
