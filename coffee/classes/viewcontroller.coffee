# The view controller is an abstraction for the canvas, and drawing is done through it. It also manages
# asset loading, e.g. images.

#= require enemy.coffee

class ViewController
	constructor: (selector = "pokeCanvas") ->
		@canvas = $("##{selector}").get(0)
		@context = @canvas.getContext('2d')
		@context.font = '45px "Courier"';
		# Need to specify alternative font choice for mobile safari, for some reason
		@context.font = '45px "Courier"' if isMobileSafari()
		@images = [];
		@prototypes = [];
		@map = [];
		@stack = [];
		@timestep = 50;
		@inputstack = [];
		@dpad_touchstate = [];

		@mousedown = no
		@mousepos = {x:0, y:0}

		me = @;

		# Register the button input here...
		# e.g. bind x y z

		$(document).mouseup (e) ->
			me.mousedown = no

		$(document).mousemove (e) ->
			me.mousepos = {x: e.pageX, y: e.pageY}

		$(@canvas).mousedown (e) ->
			me.canvasinput_mouseClick(e.pageX,e.pageY)
			me.mousedown = yes

		$(document).keypress (e) ->
			e.preventDefault()
			me.inputstack.push(new GInputEvent('K',e.keyCode,e.shiftKey));


	ready: ->
		for a in [@images, @map, @prototypes]
			for b in a
				if (b.loaded? and !b.loaded) or (b[a]? and (!b[a].loaded? or !b[a].loaded))
					#console.log 'Not yet ready.'
					return no
		#console.log 'All ready.'
		return yes

	loadImages: (list...) ->
		@images[a] = new GImage(a,@) for a in list
		return yes


	renderSprite: (image,x,y,scale=1, flip=no) ->
		width = @images[image].image.width
		height = @images[image].image.height
		@context.save()
		if(flip == yes)
			@context.translate(@canvas.width/2,0)
			@context.scale(-1, 1)
			@context.translate(-@canvas.width/2,0)
			x = @canvas.width - x - width*scale
		@context.drawImage(@images[image].image,x,y,width*scale,height*scale)
		@context.restore()

	imageLoaded: ->
		return yes

	canvasinput_mouseClick: (x,y) ->
		x = Math.floor(x-$(@.canvas).offset().left)
		y = Math.floor(y-$(@.canvas).offset().top)
		#alert "#{x}, #{y}"
		@inputstack.push new GInputEvent('M',x,y)

	canvasinput_mouseDrag: (x,y) ->
		x = Math.floor(x-$(@.canvas).offset().left)
		y = Math.floor(y-$(@.canvas).offset().top)
		@inputstack.push new GInputEvent('MD',x,y)

	tick: ->
		#if !@stack?
		# return no;

		return no if !@ready()

		if @mousedown == yes
			@canvasinput_mouseDrag @mousepos.x, @mousepos.y
			#alert "Got dat mouse down"

		@stack[0].tick()

		@inputstack = [];

		return yes;