function TaskShedule()
	--设址方案符称
	TaskName("Phong L╪g ч")
	local nStartHour = tonumber(date("%H")) + 1;
	
	if (nStartHour >= 24) then
		nStartHour = 0;
	end;
	
	TaskTime(nStartHour, 0);
	
	--设址间隔时间，单位为分钟
	TaskInterval(720) --60分钟一次
	
	--设址触发次数，0表示无限次数
	TaskCountLimit(0)
	OutputMsg("[STARTED] FENGLING FERRY");
end

function TaskContent()
	local nStartHour = tonumber(date("%H"));
	OutputMsg(format("[STARTED] FENGLING FERRY %dH", nStartHour));
    GlobalExecute("dwf \\script\\missions\\fengling_ferry\\fldmap_boat1.lua fenglingdu_main()")
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
