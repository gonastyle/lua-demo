--[[
函数尾调用

function foo (n)

print(n)
if n > 0 then return foo(n - 1) end
end

foo(100)

]]

--[[
Lib = {}
Lib.foo = function (x,y) return x + y end
Lib.goo = function (x,y) return x - y end

local a=Lib.foo(10,20)
print(a)
]]

--[[
Lib = {
foo = function (x,y) return x + y end,
goo = function (x,y) return x - y end
}

local a=Lib.foo(10,20)
print(a)

]]

--[[
Lib = {}
function Lib.foo (x,y)
return x + y
end
function Lib.goo (x,y)
return x - y
end

local a=Lib.foo(10,20)
print(a)

]]

--[[ 递归调用 ]]

fact = function (n)
if n == 0 then
return 1
else
return n*fact(n-1) -- buggy
end
end

local a=fact(10)

--print(a)


--[[
print("hello", "Lua");
print("Hi")

print(math.cos(0))
io.write("hello", "Lua");
io.write("Hi", "\n")


local count = 1
while true do
local line = io.read()
if line == nil then break end

io.write(string.format("%6d ", count), line, "\n")
count = count + 1
end

]]



local lines = {}
for line in io.lines() do
table.insert(lines, line)
end

table.sort(lines)

for i, l in ipairs(lines) do io.write(l, "\n") end



















