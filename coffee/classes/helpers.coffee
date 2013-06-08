isMobileSafari = ->
	navigator.userAgent.match(/(iPod|iPhone|iPad)/) && navigator.userAgent.match(/AppleWebKit/)  

randomizeVector = (vector, offset) ->
	retval = {x:0, y:0}
	retval.x = vector[0] + (2*Math.random() - 1)*offset
	retval.y = vector[1] + (2*Math.random() - 1)*offset
	return retval

simplifyPath = (path) ->
	retval = []
	for p in path
		retval.push randomizeVector(p.location, p.radius)
	return retval

vectorLength = (v) ->
	return Math.sqrt( v.x * v.x + v.y * v.y)