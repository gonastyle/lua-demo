
--[[
面向对象编程
]]

Account={balance=0,}

function Account:new (o)

    o = o or {}   -- create object if user does not provide one

    setmetatable(o, self)

    self.__index = self

    return o

end


function Account:deposit (v)

self.balance = self.balance + v

print(self.balance)
end

function Account:withdraw (v)

    if v > self.balance then error"insufficient funds" end

    self.balance = self.balance - v

end


SpecialAccount = Account:new()

s = SpecialAccount:new{limit=1000.00}

function SpecialAccount:withdraw (v)

local a=v - self.balance
local b=self:getLimit()

print("log:"..a)
print("log:"..b)
    if  a>=b  then
       error"insufficient funds"
    end
    self.balance = self.balance - v
end


function SpecialAccount:getLimit ()

	print("SELF:"..self.limit)

    return self.limit or 20

end


function s:getLimit ()

    print("S@@@:"..self.balance)
	print("S---:"..self.limit)

    return self.balance * 0.10 and  2000

end




--[[
a = Account:new{balance = 0}

a:deposit(100.00)

b = Account:new()

print(b.balance)

]]

--s:getLimit()
s:withdraw(10)
