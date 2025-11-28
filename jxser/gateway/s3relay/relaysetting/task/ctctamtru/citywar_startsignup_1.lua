Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("Ghi danh bat dau");

	TaskInterval(1440);
	
	TaskTime(18, 0);
	
	TaskCountLimit(0);

	OutputMsg("=================[CTC Tam Tru] BAT DAU GHI DANH=================")
end

function TaskContent()
	local nCityId=getSigningUpCity(1)
	local nWeek=tonumber(date("%w"))

	if (HinhThucCongThanh == 0) then
		StartSignUp(nCityId);
	else
		cw_startsignup_fun(nWeek,nCityId);
	end;

	OutputMsg("=================[CTC Tam Tru] BAT DAU GHI DANH=================")
end



function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
