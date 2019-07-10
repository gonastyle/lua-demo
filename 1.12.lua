local i=0

lines = {
"luaH_set",
"luaH_get",
"luaH_present",
}

--[[
a = {}
for n in pairs(lines) do table.insert(a, n) end

table.sort(a)

]]

--”––Ú∑√Œ ,ipairs,k-v
for i,n in ipairs(lines) do print(i,n) end



