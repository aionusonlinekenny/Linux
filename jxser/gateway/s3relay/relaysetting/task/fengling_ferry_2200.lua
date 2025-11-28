function TaskShedule()
	--设址方案符称
	TaskName("风戈渡2200")
	TaskTime(22, 0);
	
	--设址间隔时间，单位为分钟
	TaskInterval(1440) --60分钟一次
	
	--设址触发次数，0表示无限次数
	TaskCountLimit(0)
	OutputMsg("=================稰hong Lang Do 22h==================");
end

function TaskContent()
    GlobalExecute("dwf \\script\\missions\\fengling_ferry\\fldmap_boat1.lua fenglingdu_main()")
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
