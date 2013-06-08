
class Tower
	constructor: (towerprototype, position) ->
		@prototype = towerprototype
		@position = { x: position[0], y: position[1] }

	tick: ->
		document.viewcontroller.renderSprite(@prototype.image,@position.x,@position.y,1)

		# Find any nearby rats

		for r in document.viewcontroller.stack[0].rats
			if vectorLength vectorSubtract(r.position, @position) < @prototype.json.range
				r.didTakeDamage.call(r,@prototype.json.damage)

