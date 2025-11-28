Include("\\script\\mission\\sevencity\\war.lua")

function TaskShedule()
	TaskName("SevenCityWar start signup")
	TaskInterval(24 * 60)
	TaskTime(13, 0)
	TaskCountLimit(0)
	OutputMsg("[SEVENCITY]task[start_signup] loaded")
end

function TaskContent()
	local day = tonumber(date("%w"))
	if (day == 5) then
		RemoteExecute(REMOTE_SCRIPT,"RelayProtocol:StartSignup",0)
		OutputMsg("[SEVENCITY]start signup")
	end
end


function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
