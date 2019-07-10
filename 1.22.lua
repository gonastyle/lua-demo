require "socket"


--[[ 下载]]
function download (host, file)
local c = assert(socket.connect(host, 80))
local count = 0 -- counts number of bytes read

print("发送开始")


c:send("GET " .. file .. " HTTP/1.0\r\n\r\n")
print("发送结束")

while true do

     local s, status = receive(c)

	 count = count + string.len(s)

	 print(s.."--"..status)

if status == "closed" then break end

end


c:close()
print(file, count)
end

function receive (connection)

	 print("开始接收")
	connection:timeout(0) -- do not block

	local s, status = connection:receive(2^10)

if status == "timeout" then
	print("接收超时")
	coroutine.yield(connection)
	end
	return s, status
	end

threads = {} -- list of all live threads


function get (host, file)
-- create coroutine
	local co = coroutine.create(function ()
	download(host, file)
	end)
	-- insert it in the list
	print(host..file)
	table.insert(threads, co)
end

function dispatcher ()
  while true do
  local n = table.getn(threads)
  if n == 0 then break end -- no more threads to run
 for i=1,n do
    local status, res = coroutine.resume(threads[i])

  if not res then -- thread finished its task?
  print(not  res)
     table.remove(threads, i)
    break
    end


  end
    end
end


host = "www.w3c.org"
get(host, "/TR/html401/html40.txt")
dispatcher()






--[[

local host = "www.w3.org"
local file = "/TR/html401/html40.txt"
local c = assert(socket.connect(host, 80))
c:send("GET " .. file .. " HTTP/1.0\r\n\r\n")
c:close()


]]










