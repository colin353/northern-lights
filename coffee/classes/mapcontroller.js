// Generated by CoffeeScript 1.6.2
var MapController;

MapController = (function() {
  function MapController(mapname) {
    this.relinquishcontrol = false;
    this.map = new GMap(mapname);
    this.enemies = [];
    this.count = 0;
    document.viewcontroller.map.push(this.map);
    this.rat = new EnemyPrototype('game/assets/enemies/rat.json');
    document.viewcontroller.prototypes.push(this.rat);
  }

  MapController.prototype.spawnEnemy = function(enemyprototype) {
    return this.enemies.push(new Enemy(this.rat, this.map.json.nodes));
  };

  MapController.prototype.tick = function() {
    var e, _i, _len, _ref;

    if (this.count % 100 === 0) {
      this.spawnEnemy(this.rat);
    }
    viewcontroller.renderSprite(this.map.image, 0, 0, 1);
    _ref = this.enemies;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      e = _ref[_i];
      e.tick.call(e);
    }
    return this.count++;
  };

  return MapController;

})();
