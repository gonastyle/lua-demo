
--url转换为16进制
function escape (s)
s = string.gsub(s, "([&=+%c])", function (c)
return string.format("%%%02X", string.byte(c))
end)
s = string.gsub(s, " ", "+")
return s
end

function encode (t)
local s = ""
for k,v in pairs(t) do
s = s .. "&" .. escape(k) .. "=" .. escape(v)
print(s)
end
return string.sub(s, 2) -- remove first `&'
end
t = {name = "al", query = "a+b = c", q="yes or no"}
print(encode(t))
