
class Prototype
	constructor: (location) ->
		@loaded = no

		if location? 
			$.get(location, (r) -> 
				me.loaded = yes;
				me.json = r;
				me.didLoad()
			)
		else  
			throw 'Invalid prototype supplied.'

	didLoad: ->
		yes