
--[[

https://kyfw.12306.cn
GET /otn/lcxxcx/query?purpose_codes=ADULT&queryDate=2015-07-30&from_station=BJP&to_station=SHH



]]


g_inputPara=
{
	trainDate = "2015-10-1",
	startCity="北京",
	endCity="上海",
	fromstation_code = "BJP",
	toStation_code = "SHH",
}

function main()
	-----------------------------------------------main()函数开始------------------------------------------------
	STime = os.time()
	g_path=gt_config[1].."?.luac"
	m_package_path=package.path
	package.path=string.format("%s;%s",m_package_path, g_path)
	package.cpath = string.format("%s;%s",package.cpath, gt_config[1])
	require"comm/commlib"
	require"comm/weblib"
	require"config_12306new"
	require"login_12306new"
	require"json"


local strHeader =
	"Accept: image/gif, image/jpeg, image/pjpeg, image/pjpeg, application/x-shockwave-flash, application/vnd.ms-excel, application/vnd.ms-powerpoint, application/msword, application/xaml+xml, application/x-ms-xbap, application/x-ms-application, */*\r\n"
	.."Accept-Language: zh-cn\r\n"
	.."User-Agent:  Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 5.1; Trident/4.0; .NET CLR 2.0.50727; .NET4.0C; .NET4.0E)"
	.."Host: kyfw.12306.cn\r\n"
	.."Connection: Keep-Alive\r\n"

local strPara =
				"purpose_codes=ADULT"
				.."&queryDate="..g_inputPara.trainDate
				.."&from_station="..g_inputPara.fromStation_code
				.."&to_station="..g_inputPara.toStation_code


local strResp = web:downloadhttpfile(
		"https://kyfw.12306.cn/otn/lcxxcx/query"
		,1
		,""
		,strHeader
		,""
		,"utf-8")

sLog:info(strResp)

end






