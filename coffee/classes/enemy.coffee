
class Enemy
	constructor: (enemyprototype) ->
		@prototype = enemyprototype
		@position = {x: 0, y: 0}

	tick: ->
		# Draw the rats all over the place
		document.viewcontroller.renderSprite(@prototype.image,@position.x,@position.y,1)