--[[
local a=false
local b={a=1,b=2,c=function(a,b) print(a,b) end}
]]

--[[

repeat

print("hello");

until a;
]]

--[[
for i=1,3 do
print(i)
if i==2  then break end
print(tostring(b))
end
--]]


--[[
for k,v in pairs(b)
do  print(k,v)  end
]]



--[[

s,e=string.find("hello world!","llo")

print(s,e)


]]

--[[
network = {
{name = "grauna", IP = "210.26.30.34"},
{name = "arraial", IP = "210.26.30.23"},
{name = "lua", IP = "210.26.23.12"},
{name = "derain", IP = "210.26.23.20"},
}

for k in pairs(network)
do  print(k)  end
]]

--[[
function eraseTerminal()
io.write("\27[2J")
end
-- writes an '*' at column 'x' , 'row y'
function mark (x,y)
io.write(string.format("\27[%d;%dH*", y, x))
end
-- Terminal size
TermSize = {w = 80, h = 24}
-- plot a function
-- (assume that domain and image are in the range [-1,1])
function plot (f)
eraseTerminal()
for i=1,TermSize.w do
local x = (i/TermSize.w)*2 - 1
local y = (f(x) + 1)/2 * TermSize.h
mark(i, y)
end
io.read() -- wait before spoiling the screen
end

--plot(function (x) return math.sin(x*2*math.pi) end)
mark(1,2)


]]


--[[
local f="sdsds"

m_1=string.sub(f,1,2)

assert(m_1)
]]

--[[
local status, err = pcall(function () error("llll") end)
print(err)
print(debug.traceback())
]]

--[[
co = coroutine.create(function ()
print("hi")
end)
print(co)
coroutine.resume(co)
print(coroutine.status(co))

]]




function receive (prod)
     local status, value = coroutine.resume(prod) --激活
	 print("R--->>Producer***"..coroutine.status(p))
     print("R--->>Filter****"..coroutine.status(f))

return value
end

function send (x)
    coroutine.yield(x) --挂起
	print("S-->>Producer***"..coroutine.status(p))
	print("S-->>Filter****"..coroutine.status(f))
end

function producer ()
  print("激活producer")
  return coroutine.create(function ()
		while true do
			 print("^^^^^^^^^^^^^^^^^^^^")
			 local x = io.read() -- produce new value
			 send(x)
end
end)
end

function filter (prod)
	print("激活filter")
     return coroutine.create(function ()
  local line = 1
  while true do

     local x = receive(prod) -- get new value
     x = string.format("%5d %s", line, x)
      send(x) -- send it to consumer
     line = line + 1
     end
end)
end


function consumer (prod)
print("激活consumer")
while true do
local x = receive(prod) -- get new value
io.write(x, "\n") -- consume new value
end
end


p = producer()
--print(coroutine.status(p))
f = filter(p)
--print(coroutine.status(f))
consumer(f)

--print(coroutine.status(p))
--print(coroutine.status(f))








