Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("Loi dai cuoc so tai bat dau");

	TaskInterval(1440);

	TaskTime(20, 0);

	TaskCountLimit(0);

	OutputMsg("=====> [Cong Thanh] Loi dai chien dau=========")
end

function TaskContent()
	local nCityId=getSigningUpCity(1)

	if (HinhThucCongThanh == 0) then
		StartArena(nCityId);
	end

	OutputMsg("=====> [Cong Thanh] Loi dai chien dau=========")
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
