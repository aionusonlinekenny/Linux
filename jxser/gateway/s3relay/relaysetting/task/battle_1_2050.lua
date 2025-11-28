-- HÖ thèng chiÕn tr­êng Tèng Kim
-- Editor by AloneScript @ 03.07.2018

TIME_HOUR = 20
TIME_MIN = 50

function TaskShedule()
	TaskName("ChiÕn tr­êng Tèng Kim vµo lóc 09:50");
	TaskInterval(1440);
	TaskTime(TIME_HOUR, TIME_MIN);
	TaskCountLimit(0);
	OutputMsg(format("[STARTED]	BATTLE [TONG KIM] %d:%d -> OK!", TIME_HOUR, TIME_MIN));
end

function TaskContent()

		Battle_StartNewRound( 1, 1 );	-- LÖnh GM, khëi ®éng hÖ thèng chiÕn tr­êng Tèng Kim (s¬ cÊp)
		Battle_StartNewRound( 1, 2 );	-- LÖnh GM, khëi ®éng hÖ thèng chiÕn tr­êng Tèng Kim (trung cÊp)
	
	local nWeekday = tonumber(date("%w"));
	
	if nWeekday == 1 and (CW_GetCityStatus(4) == 0 and CW_GetOccupant(4) ~= nil) and (CW_GetCityStatus(7) == 0 and CW_GetOccupant(7) ~= nil) then
		return							-- Vµo ngµy thø 2 hµng tuÇn, ®ãng cöa chiÕn tr­êng Tèng Kim (cao cÊp) thay thÕ cho chiÕn tr­êng Thiªn Tö
	else
		Battle_StartNewRound(1, 3);	-- GMÖ¸Áî£¬Æô¶¯¸ß¼¶ĞÂÕ½¾Ö	
	end
	
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
