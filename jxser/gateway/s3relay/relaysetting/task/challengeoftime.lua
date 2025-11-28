INTERVAL_TIME = 60
function GetNextTime()
    local hour = tonumber(date("%H"));
    if (hour == 23) then
    	hour = 0;
    else
    	hour = hour + 1;
    end
    return hour, 0;
end

function TaskShedule()
	TaskName("Ho¹t ®éng Khiªu ChiÕn Thêi Gian");	
	TaskInterval(INTERVAL_TIME);
	local h, m = GetNextTime();
	TaskTime(h, m);
	OutputMsg(format("[STARTED] CHALLENGE OF TIME %d:%d", h, m));
	TaskCountLimit(0);
end

function TaskContent()
	local h, m = GetNextTime();
	OutputMsg(format("[RUNNING] CHALLENGE OF TIME %d:%d", h,m));
	GlobalExecute("dwf \\settings\\trigger_challengeoftime.lua OnTrigger()");
	szMsg = "'Ho¹t ®éng “Th¸ch Thøc Thêi Gian” ®· b¾t ®Çu më ra, c¸c ®éi tr­ëng h·y nhanh ch©n ®Õn thµnh thÞ gÆp NhiÕp NhÝ TrÇn ®Ó b¸o danh tham gia."
	GlobalExecute(format("dw AddLocalCountNews([[%s]], 2)", szMsg))
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
