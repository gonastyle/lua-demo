--[[

引入文件：fun.lua 或fun.dll

]]

require "fun"
--require "fun1"
----------------------------
t={
"hello",
"ll"
}


function unpack(t, i)
   print("**************")
	i = i or 1
	print("i="..i)

  if t[i] then
       print("----------------")
       print("t["..i.."]="..t[i])
	   return t[i], unpack(t, i + 1)
	end


end

function main()

    local f=string.find

	print(f(unpack(t,false)))

	test(unpack(t,false))

end

------------------------------
print("---------start----------")
main()
print("-----------over-----------")
