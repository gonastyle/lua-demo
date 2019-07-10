--[[
function Set (list)

local set = {}

for _, l in ipairs(list) do set[l] = true

--print(l,_)
end

return set
end

--reserved = Set{"while", "end", "function", "local", }
]]

reserved = {

"while","do",


}

print(reserved["while1"])

for i,n in ipairs(reserved) do

print(i,n)

end
