# The GMap object looks to abstract the maps, which are from JSON.
# It also loads in the javascript initialization code from the map.

class GMap
	constructor: (location) ->
		@loaded = no;
		@map = [];
		me = @;
		document.viewcontroller.images.push new GImage("game/maps/#{location}.png",document.viewcontroller)
		if location? 
			$.get("game/maps/#{location}.json", (r) -> 
				me.loaded = yes;
				me.map = r;
			)
		else 
			throw 'Invalid map supplied at gmap'