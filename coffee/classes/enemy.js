// Generated by CoffeeScript 1.6.2
var Enemy;

Enemy = (function() {
  function Enemy(enemyprototype) {
    this.prototype = enemyprototype;
    this.position = {
      x: 0,
      y: 0
    };
  }

  Enemy.prototype.tick = function() {
    return document.viewcontroller.renderSprite(this.prototype.image, this.position.x, this.position.y, 1);
  };

  return Enemy;

})();
