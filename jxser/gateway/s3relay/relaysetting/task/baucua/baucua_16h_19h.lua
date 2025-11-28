TIME_HOUR = "16";
TIME_MIN = "00";


function TaskShedule()
TaskName( "MS2PLAYERCHAT" );
TaskTime(tonumber(TIME_HOUR),tonumber(TIME_MIN));
TaskInterval(1440);
TaskCountLimit( 0 );
OutputMsg( "=================Phuc-Loc-Tho Start 0h01 Sang Den 23h59 Toi=================" );
end

function TaskContent()
	-- GlobalExecute("dwf \\script\\global\\autochat.lua ms2player()")
	szMsg = "<color=yellow>Phóc - Léc Thä<color>Ù§·Ù§Õn,ÙH·yÙnhanhÙch©nÙ®ÕnÙTrungÙT©mÙ<color=yellow>T­¬ngÙD­¬ng<color>Ù§ÓÙthamÙgiaÙ<color=yellow>cÇu phóc may m¾n !."
	GlobalExecute(format("dw AddLocalCountNews([[%s]], 3)", szMsg))
 local strExecute = format( "dw BauCuaKhoiDong()");
	GlobalExecute(strExecute);
	OutputMsg("=====> Phuc-Loc-Tho Start -- 0:01AM-- end ------23:59PM-------------- ");
end

function GameSvrConnected(dwGameSvrIP)
end;

function GameSvrReady(dwGameSvrIP)
end
