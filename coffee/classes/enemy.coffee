
class Enemy
	constructor: (enemyprototype, path) ->
		@prototype = enemyprototype
		@path = simplifyPath path

		@position = @path[0]

	tick: ->
		# Draw the rats all over the place
		console.log 'Ticking enemy: ', @position
		document.viewcontroller.renderSprite(@prototype.image,@position.x,@position.y,1)

		# Make the guy walk toward the next node on the path.
		#console.log 'the rat is moving by ',(0.001) * (@path[1].x - @position.x)
		displacement = {x:0, y:0}
		displacement.x = (@path[1].x - @position.x)
		displacement.y = (@path[1].y - @position.y)

		length = vectorLength displacement
		@position.x += displacement.x / length
		@position.y += displacement.y / length
		#console.log 'Updating rat path: ', @path[1]