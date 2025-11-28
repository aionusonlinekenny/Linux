--citydefence.lua
-- Œ¿π˙’Ω’˘÷Æ∑Èª¡¨≥«

function TaskShedule()
	TaskName("Phong hoa lien thanh");	

	-- “ªÃÏ“ª¥Œ£¨µ•Œª∑÷÷”
	TaskInterval(1440);
	-- …Ë÷√¥•∑¢ ±º‰
	TaskTime(13, 00);
	OutputMsg(format("PHONG HOA LIEN THANH BAT DAU %d:%d...", 13, 00));
	-- ÷¥––Œﬁœﬁ¥Œ
	TaskCountLimit(0);

end

function TaskContent()
	local weekdate = CloudOpen_Defence()
	if (weekdate == nil) then
		OutputMsg("Hoat Dong Dien Ra Vao Thu 7 Va Chu Nhat Hang Tuan")
		return
	end
	if (weekdate == 0) then
		OutputMsg("'ThÒ Thµnh' Kim Ph≠¨ng Æ∑ mÎ ghi danh.");
		GlobalExecute("dw NewCityDefence_OpenMain(2)");
	else
		OutputMsg("'ThÒ Thµnh' TËng ph≠¨ng Æ∑ mÎ ghi danh.");
		GlobalExecute("dw NewCityDefence_OpenMain(1)");
	end
end

function CloudOpen_Defence()
	local weekdate = tonumber(date("%w"))
	if (weekdate ~= 6) then
		return nil
	end
	return weekdate
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
