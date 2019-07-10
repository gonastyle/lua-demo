--[[

a?b:c

]]

local a=true
local b="i am b"
local c=false
local m=(a and b) or c

print(m)


a = {}; a.x = 1; a.y = 0
b = {}; b.x = 1; b.y = 0
c = a
if a==c then
print("a==c")
end

if a~=b then
print("a~=b")
end

for v in pairs(a) do
print(v)
end

local math=require("math")

do
local a=100
local b=100
local c=100
local a2 = 200
local d = math.sqrt(1000)
x1 = (-b + d)/a2
x2 = (-b - d)/a2
end
-- scope of 'a2' and 'd' ends here
print(x1, x2)








