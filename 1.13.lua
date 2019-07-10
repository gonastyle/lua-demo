--遍历数组
--[[
a = {1,2}
-- new array
for i=2, 5 do

a[i] = 0
end

for k,v in ipairs(a) do

print(k,v)

end

]]

--二维数组
mt = {}
N=10
M=20
-- create the matrix
for i=1,N do
mt[i] = {}
-- create a new row
for j=1,M do

mt[i][j] = 1


end
end


for k,v in ipairs(mt) do

print(k)
for l,b in ipairs(v) do

print(b)

end

end






