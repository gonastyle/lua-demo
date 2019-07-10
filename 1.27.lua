

--[[[ 迭代器
function allwords()
local line = io.read() -- current line
local pos = 1 -- current position in the line
return function () -- iterator function
while line do -- repeat while there are lines
local s, e = string.find(line, "%w+", pos)
if s then -- found a word
pos = e + 1 -- next position is after this word
return string.sub(line, s, e) -- return the word
else
line = io.read() -- word not found; try next line
pos = 1 -- restart from first position
end
end
return nil -- no more lines: end of traversal
end
end

for word in allwords() do
print(word)
end
]]


--[[ 自定义迭代器
a={["a"]=1,["b"]=2,["c"]=3,["d"]=4}

died=function(t)
return next, t, nil
end

for _,v in  died(a)  do
print(v)
end

for k, v in next, a do
print(k,v)
end

]]


--[[集合

function Set (list)
local set = {}
    for _, l in ipairs(list) do set[l] = true end
    return set
end

reserved = Set({"while", "end", "function", "local", })


for k,v in pairs(reserved)  do print(k,v) end


]]

--[[  ]]

local s="@@"
file=io.open("./server.lua","r")
for line  in file:lines() do
s=s..line.."\n"
end

print(s)


































