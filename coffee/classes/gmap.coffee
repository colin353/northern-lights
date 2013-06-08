# The GMap object looks to abstract the maps, which are from JSON.
# It also loads in the javascript initialization code from the map.

class GMap
	constructor: (location) ->
		@loaded = no;
		@map = [];
		me = @;
		document.viewcontroller.loadImages "game/maps/#{location}.png"
		@image = "game/maps/#{location}.png"
		@background = document.viewcontroller.images["game/maps/#{location}.png"]
		if location? 
			$.get("game/maps/#{location}.json", (r) -> 
				me.loaded = yes;
				me.map = r;
			)
		else  
			throw 'Invalid map supplied at gmap'