$(document).ready ->

	if $('#container').height() > 0		
	  $("#container").highcharts
		  chart:
		    type: "line"

		  title:
		    text: "Log of Temperatures"

		  xAxis:
		    categories: 
		    	gon.timeRecords1

		  yAxis:
		    title:
		      text: "Temperature"

		  series: [
		    {
		      name: "Room1"
		      data: 
		      	gon.roomRecords1
		    }
		    {
		      name: "Room2"
		      data: 
		      	gon.roomRecords2
		    }
		    {
		    	name: 'Room3'
		    	data: gon.roomRecords3
		    }
		    {
		    	name: 'Room4'
		    	data: gon.roomRecords4
		    }
		    {
		    	name: 'Room5'
		    	data: gon.roomRecords5
		    }
		  ]
