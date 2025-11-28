function TaskShedule()
	TaskName( "Reset Bang Xep Hang")
	TaskInterval(24 * 60)
	TaskTime(0, 05)
	TaskCountLimit(0)
	OutputMsg("[STARTED] Reset BXH Hang Ngay Luc 00:00 Thu 2");
end

function TaskContent()
	local day = tonumber(date("%w"))
		if(day==1) then
			for i=10270,10295 do
			Ladder_ClearLadder(i)
			end
			Ladder_ClearLadder(10119)
			OutputMsg("[RUNNING] Dang Tien Hanh Reset BXH");
		end
end
