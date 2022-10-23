# Animate.lua

# Syntax 
`int`, `int`, `int` animate({ `float` x1, `float` y1, `float` z1 }, { `float` x2, `float` y2, `float` z2 }, `float` duration, `string` easing, `function` callback)

# Example

Increase Numbers

	animate({ 100, 200, 300 }, { 200, 300, 400 }, 1000, "Linear", function(x, y, z, progress)
		print(x, y, z, progress)
	end)
