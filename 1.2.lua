
function norm (x, y)

local n2 = x^2 + y^2

return math.sqrt(n2)
end


function twice (x)

return 2*x
end
--[[

--]]

print(type("Hello world"))
--> string
print(type(10.4*3))


--> number
print(type(print))




--> function
print(type(type))



--> function
print(type(true))



--> boolean
print(type(nil))



--> nil
print(type(type(X)))



a = "one string"
b = string.gsub(a, "one", "another") -- change string parts
print(a)

--> one string
print(b)

print("one line\nnext line\n\"in quotes\", 'in quotes'")


page = [[
<HTML>
<HEAD>
<TITLE>An HTML Page</TITLE>
</HEAD>
<BODY>
Lua
a text between double brackets
</BODY>
</HTML>
]]

io.write(page);



line = io.read();
-- read a line
n = tonumber(line);

-- try to convert it to a number
if n == nil then
error(line .. " is not a valid number");
else
print(n*2);
end

