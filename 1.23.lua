
local socket = require("socket")

local host = "www.baidu.com"
local file = "/"

-- ����һ�� TCP ���ӣ����ӵ� HTTP ���ӵı�׼�˿� -- 80 �˿���
local sock = assert(socket.connect(host, 80))
sock:send("GET " .. file .. " HTTP/1.0\r\n\r\n")
repeat
    -- �� 1K ���ֽڿ����������ݣ����ѽ��յ��ֽڿ������
    local chunk, status, partial = sock:receive(1024)
    print(chunk)
	--print(partial)

until status ~= "closed"
-- �ر� TCP ����
sock:close()

