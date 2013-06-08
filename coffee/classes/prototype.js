// Generated by CoffeeScript 1.6.2
var EnemyPrototype, Prototype, _ref,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Prototype = (function() {
  function Prototype(location) {
    var me;

    this.loaded = false;
    me = this;
    if (location != null) {
      $.get(location, function(r) {
        me.loaded = true;
        me.json = r;
        return me.didLoad.call(me);
      });
    } else {
      throw 'Invalid prototype supplied.';
    }
  }

  Prototype.prototype.didLoad = function() {
    return true;
  };

  return Prototype;

})();

EnemyPrototype = (function(_super) {
  __extends(EnemyPrototype, _super);

  function EnemyPrototype() {
    _ref = EnemyPrototype.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  EnemyPrototype.prototype.didLoad = function() {
    this.image = this.json.image;
    return document.viewcontroller.loadImages("game/images/" + this.image);
  };

  return EnemyPrototype;

})(Prototype);
