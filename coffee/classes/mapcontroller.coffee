class MapController

	constructor: (mapname) ->
		@relinquishcontrol = no
		# Load the map JSON file
		@map = new GMap mapname
		@enemies = []

		@enemies.push new Enemy

		document.viewcontroller.map.push @map
	tick: ->
		#console.log 'MapController tick'
		viewcontroller.renderSprite(@map.image,0,0,1)

		yes