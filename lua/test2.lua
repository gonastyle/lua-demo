	http = require("socket.http")
	--local ext = arg[1]
	--local url = arg[2]
	--local filter = arg[3] or ""


	local ext ="jpg";
	local url ="http://www.qq.com";
	local filter ="";


	--if not (ext and url) then
	--print("usage:   netget.lua [file-type] [url] [filter-string]\nexample: netget.lua gif http://www.qq.com home")
	--return -1
	--end

	local body, ret
	if string.find(url, "http://") ~= 1 then
	print("     get content from local file " .. url)
	body, ret = io.open(url, "r"):read("*a")
	else
	print("     requesting to " .. url .. " for *." .. ext .. " files...")
	body, ret = http.request(url)  end
	if body == nil then
	print("request failed, because of: " .. ret)
	os.exit(1)  end
	print("     request ok")
	------------------------------------------------------------------------------
	function islegal(saveto)
	local illegalstr = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_-.0123456789"
	for i = 1, #saveto - 4 do
	if not string.find(illegalstr, string.sub(saveto, i, i)) then
	return false
	end
	end
	return true
	end

	-------------------------------------------------------------------------------
	local start_t = os.time()
	local dir = start_t;

	assert(os.execute("mkdir " .. dir), "fail to mkdir dir")
	local n = 0
	local name = ""
	local data = ""
	for file, _ in string.gfind(body, "http://[^:]-%." .. ext) do
	local revfile = string.reverse(file)
	local s, e = string.find(revfile, "/")
    if s then
	name = string.reverse(string.sub(revfile, 1, s - 1))
	else
	name = "NONAME" .. n .. ext
	end

	if string.find(name, filter) and islegal(name) then
	print("getting file " .. file)
	data, ret = http.request(file)
	if(data ~= nil) then
	io.open("./"..dir.."/"..name, "wb"):write(data)
	n = n + 1
	else
	print("     fail to get file " .. file)
	end
	end
	end  ------------------------------------------------------------------------------
	print("done at:" .. os.date()  .. "\n cost time: " .. os.time() - start_t .. " seconds"  .. "\n  file amount: " .. n      .. "\n     saved to folder: ./" .. dir);
