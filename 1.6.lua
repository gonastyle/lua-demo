x = 10
local i = 1



-- local to the chunk

while i<=x do

local x = i*2

-- local to the while body

print(x)


--> 2, 4, 6, 8, ...

i = i + 1
end


for k, v in pairs(math) do
	print(k,v)
end


list = nil
for line in io.lines() do

list = {next=list, value=line}
print(list)

if line=="000" then break; end
end


l = list
while l do

print("0---0" .. l.value)

l = l.next
end



