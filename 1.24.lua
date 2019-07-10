local http = require("socket.http")
local response = http.request("http://www.baidu.com/")
print(response)
