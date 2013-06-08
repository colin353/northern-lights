class MapController

	constructor: (mapname) ->
		@relinquishcontrol = no
		# Load the map JSON file
		@map = new GMap mapname
		@enemies = []
		@count = 0

		document.viewcontroller.map.push @map

		@rat = new EnemyPrototype('game/assets/enemies/rat.json')
		document.viewcontroller.prototypes.push @rat

	spawnEnemy: (enemyprototype) ->
		@enemies.push new Enemy @rat, @map.json.nodes

	tick: ->
		if(@count == 0)
			@spawnEnemy(@rat)

		#console.log 'MapController tick'
		viewcontroller.renderSprite(@map.image,0,0,1)

		for e in @enemies
			e.tick.call(e)


		@count++