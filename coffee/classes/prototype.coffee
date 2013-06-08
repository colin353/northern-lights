
class Prototype
	constructor: (location) ->
		@loaded = no

		me = @
		if location? 
			$.get(location, (r) -> 
				me.loaded = yes;
				me.json = r;
				me.didLoad.call(me)
			)
		else  
			throw 'Invalid prototype supplied.'

	didLoad: ->
		yes

class EnemyPrototype extends Prototype
	didLoad: ->
		# We should load the enemy's image based on the JSON specification.
		@image = @json.image
		document.viewcontroller.loadImages "game/images/#{@image}"