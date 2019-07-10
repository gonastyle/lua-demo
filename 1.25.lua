    --[[

	gt_config={
    "blue","black","white"
	}

	g_path=gt_config[1].."?.luac"
	m_package_path=package.path

	--print(package.path)


	for v in ipairs(package.path) do
	print(v)
	end

	package.path=string.format("%s------%s",m_package_path, g_path)


	print(m_package_path)
	--print(g_path)
	--print(package.path)
]]

--table
lines = {
luaH_set = 10,
luaH_get = 24,
luaH_present = 48,
}


--pairs-->>table,array

a = {}
for n,v in  pairs(lines) do
    print(n,v)
    table.insert(a, n)
end

table.sort(a)
--ipairs-->>array
for i,n in ipairs(a) do print(i,n) end










