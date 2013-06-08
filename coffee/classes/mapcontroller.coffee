class MapController

	constructor: (mapname) ->
		@relinquishcontrol = no
		# Load the map JSON file
		@map = new GMap mapname
		@enemies = []

		@enemies.push new Enemy

		document.viewcontroller.map.push @map

		@rat = new EnemyPrototype('game/assets/enemies/rat.json')

	spawnEnemy: (enemyprototype) ->
		@enemies.push new Enemy(@rat)

	tick: ->
		#console.log 'MapController tick'
		viewcontroller.renderSprite(@map.image,0,0,1)

		for e in enemies
			e.tick()