// Generated by CoffeeScript 1.6.2
var isMobileSafari, randomizeVector, simplifyPath, vectorLength, vectorSubtract;

isMobileSafari = function() {
  return navigator.userAgent.match(/(iPod|iPhone|iPad)/) && navigator.userAgent.match(/AppleWebKit/);
};

randomizeVector = function(vector, offset) {
  var retval;

  retval = {
    x: 0,
    y: 0
  };
  retval.x = vector[0] + (2 * Math.random() - 1) * offset;
  retval.y = vector[1] + (2 * Math.random() - 1) * offset;
  return retval;
};

simplifyPath = function(path) {
  var p, retval, _i, _len;

  retval = [];
  for (_i = 0, _len = path.length; _i < _len; _i++) {
    p = path[_i];
    retval.push(randomizeVector(p.location, p.radius));
  }
  return retval;
};

vectorSubtract = function(v, u) {
  return {
    x: v.x - u.x,
    y: v.y - u.y
  };
};

vectorLength = function(v) {
  return Math.sqrt(v.x * v.x + v.y * v.y);
};
