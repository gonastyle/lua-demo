
--[[
s = "hello world"

i, j = string.find(s, "hello")

print(i, j)                        --> 1    5

print(string.sub(s, i, j))         --> hello

print(string.find(s, "world"))     --> 7    11

i, j = string.find(s, "l")

print(i, j)                        --> 3    3

print(string.find(s, "lll"))       --> nil



--目标串，模式串，替换串

s = string.gsub("Lua is cute", "cute", "great")

print(s)      --> Lua is great

s = string.gsub("all lii", "l", "x")

print(s)      --> axx xii

s = string.gsub("Lua is great", "perl", "tcl")

print(s)      --> Lua is great


]]


local t = {}      -- table to store the indices

local i = 0
local s=[[vgvjkvjv
k\mmlmlnsldlsdls\nklll
kllk]]
while true do

    i = string.find(s, "\n", i+1)   -- find 'next' newline

    if i == nil then break end

    table.insert(t, i)

end


for k,v in ipairs(t) do
print(k,v)
end


