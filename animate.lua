local floor = math.floor

function animate(from, to, duration, easing, callbackFunc)
	assert(type(from) == "table", "[Animate] Expected table at argument 1, got " .. type(from))
	assert(type(to) == "table", "[Animate] Expected table at argument 2, got " .. type(to))
	assert(type(duration) == "number", "[Animate] Expected number at argument 3, got " .. type(duration))
	assert(type(easing) == "string", "[Animate] Expected string at argument 4, got " .. type(easing))
	assert(type(callbackFunc) == "function", "[Animate] Expected function at argument 5, got " .. type(callbackFunc))

	local x1, y1, z1 = from[1], from[2], from[3] or 0, 0, 0
	local x2, y2, z2 = to[1], to[2], to[3] or 0, 0, 0

	local tick = getTickCount()
	local x, y, z = 0, 0, 0

	local function render()
		local lastTick = getTickCount()
		local time = lastTick - tick

		if time >= duration then 
			removeEventHandler("onClientRender", root, render)
		end

		local progress = time / duration

		x, y, z = interpolateBetween(x1, y1, z1, x2, y2, z2, progress, easing)

		callbackFunc(floor(x), floor(y), floor(z), progress)
	end
	addEventHandler("onClientRender", root, render)
end