Include("\\RelaySetting\\Task\\citywar_head.lua")
function TaskShedule()
	TaskName("Loi dai ghi danh hoan tat");

	TaskInterval(1440);

	TaskTime(19, 0);

	TaskCountLimit(0);

	OutputMsg("=================[CTC TAM TRU] KET THUC GHI DANH=================")
end

function TaskContent()
	local nCityId=getSigningUpCity(1)
	local nWeek=tonumber(date("%w"))

	if (HinhThucCongThanh == 0) then
		EndSignUp(nCityId);
	else
		cw_endsignup_fun(nWeek,nCityId);
	end;

	OutputMsg("=================[CTC TAM TRU] KET THUC GHI DANH=================")
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
