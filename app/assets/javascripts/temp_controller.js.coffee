$(document).ready ->

	if $('#container').height() > 0		
	  $("#container").highcharts
		  chart:
		    type: "spline"

		  title:
		    text: "Log of Temperatures"

		  xAxis:
		    type: 'datetime',

		  yAxis:
		    title:
		      text: "Temperature"

		  series: [
		    {
		      name: "Living Room"
		      data: 
		      	gon.roomRecords1
		    }
		    {
		      name: "Kitchen"
		      data: 
		      	gon.roomRecords2
		    }
		    {
		    	name: 'Bedroom 1'
		    	data: gon.roomRecords3
		    }
		    {
		    	name: 'Bedroom 2'
		    	data: gon.roomRecords4
		    }
		    {
		    	name: 'External'
		    	data: gon.roomRecords5
		    }
		  ]
	
