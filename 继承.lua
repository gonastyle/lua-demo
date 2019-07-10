
----[[¶àÖØ¼Ì³Ð]]

local function search (k, plist)
print("-----**"..k)
for k,v in pairs(plist) do
print("---",k,v)
end

for i=1, table.getn(plist) do
local v = plist[i][k] -- try 'i'-th superclass

if v then print(i.."*****"..tostring(v))  return v end
end
end

function createClass (...)
local c = {}
setmetatable(c, {__index = function (t, k)

for k1,v in pairs(t) do
print("---",k1,v)
end

for k1,v in pairs(arg) do
print("--&&&---",k1,v)
end

print("-----**^^^"..k)

return search(k, arg)
end})

c.__index = c

function c:new (o)
o = o or {}
setmetatable(o, c)
return o

end

return c
end


--@1--------------------
Named = {}
function Named:getname ()
return self.name
end
function Named:setname (n)
self.name = n
end


--@2---------------------
Account = {balance = 0}
function Account:new (o)
o = o or {}
setmetatable(o, self)
self.__index = self
return o
end
function Account:deposit (v)
self.balance = self.balance + v
end
function Account:withdraw (v)
if v > self.balance then error"insufficient funds" end
self.balance = self.balance - v
end

NamedAccount = createClass(Account, Named)
account = NamedAccount:new{name = "Paul"}
print(account:getname())



