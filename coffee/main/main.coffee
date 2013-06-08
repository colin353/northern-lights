viewcontroller = new ViewController
 
document.viewcontroller = viewcontroller;
viewcontroller.stack.push(new MapController('map-01-not-shitty'))

tick = ->
	viewcontroller.tick()

	setTimeout tick, viewcontroller.timestep  

tick()  
