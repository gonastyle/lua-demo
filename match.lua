
station_name=[[var station_names ='@bjb|北京北|VAP|beijingbei|bjb|0@bjd|北京东|BOP|beijingdong|bjd|1';]]

station_name = string.match(station_name, "@.+\'")
station_name = string.sub(station_name, 1, string.len(station_name) - 1)

print("--"..station_name)

tb={}
tb.fromStation="北京东"

-----------------截取字符串算法--------------
function FindStr(strOrg, strSeparator, nFindStartIndex)

	for i=nFindStartIndex, string.len(strOrg),1 do
		local j = 1;
		local k = i;
		while ( string.byte(strOrg,k) == string.byte(strSeparator,j)  and k<=string.len(strOrg) and j<=string.len(strSeparator) )do
			k= k+1
			j= j+1
		end
		if j == string.len(strSeparator)+1 then
			return i;
		end
	end
	return nil;
end
function Spilt(szFullString, szSeparator)
local nFindStartIndex = 1
	local nSplitIndex = 1
	local nSplitArray = {}

	while true do
		local nFindLastIndex = FindStr(szFullString, szSeparator, nFindStartIndex)

		if not nFindLastIndex then
			nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, string.len(szFullString))
    		break
		end
		nSplitArray[nSplitIndex] = string.sub(szFullString, nFindStartIndex, nFindLastIndex - 1)
		nFindStartIndex = nFindLastIndex + string.len(szSeparator)
		nSplitIndex = nSplitIndex + 1

	end

	return nSplitArray
end


iStart, iEnd = string.find(station_name, "|"..tb.fromStation.."|.-|")
station_name = string.sub(station_name,iStart,iEnd)


print("--"..station_name)

strTb =Spilt(station_name,"|")
for k,v in ipairs(strTb) do
print("----"..k.."-----"..v)
end

tb.fromStation_code = strTb[3]

print("--"..tb.fromStation_code)

print(string.byte("A"))













