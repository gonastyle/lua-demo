--[[local a = {
"Sunday", "Monday", "Tuesday",
 "Wednesday", "Thursday", "Friday", "Saturday"}


local math = require('math')
local string = require("string")
local table = require("table")


local a={math.sin(1), math.sin(2)}

for i,v in ipairs(a) do print(v) end

 ]]

--[[
print(table.getn{10,2,4}) --3


a = {}
for line in io.lines() do

table.insert(a, line)

if line=="000" then break; end;


end

print(table.getn(a))
]]


--[[
s = "hello world"
i, j = string.find(s, "hello")
print(i, j)

]]


local t = {}
-- table to store the indices
local i = 0
local s="\n888\n999\n000\n777"

while true do


i = string.find(s, "\n", i+1) -- find 'next' newline

if i == nil then break; end

table.insert(t, i)

print(i)

end


for i,v in pairs(t) do print(v) end



















