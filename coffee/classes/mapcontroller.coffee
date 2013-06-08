class MapController

	constructor: (mapname) ->
		@relinquishcontrol = no
		# Load the map JSON file
		@map = new GMap mapname
		@enemies = []
		@towers = []
		@count = 0

		document.viewcontroller.map.push @map

		@rat = new EnemyPrototype('game/assets/enemies/rat.json')
		@tower = new TowerPrototype('game/assets/towers/tower.json')
		document.viewcontroller.prototypes.push @rat, @tower

	spawnEnemy: (enemyprototype) ->
		@enemies.push new Enemy @rat, @map.json.nodes

	tick: ->
		if(@count % 100 == 0)
			@spawnEnemy(@rat)
			@towers.push new Tower @tower, @map.json.towers[0].location

		#console.log 'MapController tick'
		viewcontroller.renderSprite(@map.image,0,0,1)

		for e in @enemies
			e.tick.call(e)

		for t in @towers
			t.tick.call(t)

		@count++