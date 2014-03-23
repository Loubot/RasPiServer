$(document).ready ->

	if $('#recordHeader').height() > 0		
	  $("#container").highcharts
		  chart:
		    type: "bar"

		  title:
		    text: "Fruit Consumption"

		  xAxis:
		    categories: [
		      "Apples"
		      "Bananas"
		      "Oranges"
		    ]

		  yAxis:
		    title:
		      text: "Fruit eaten"

		  series: [
		    {
		      name: "Room1"
		      data: [
		        1
		        0
		        4
		      ]
		    }
		    {
		      name: "Room2"
		      data: [
		        5
		        7
		        3
		      ]
		    }
		  ]

	alert JSON.stringify(gon.roomRecords)