class MapController

	constructor: (mapname) ->
		@relinquishcontrol = no
		# Load the map JSON file
		@map = new GMap mapname
		document.viewcontroller.map.push @map
	tick: ->
		yes