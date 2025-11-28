function GameSvrConnected(dwGameSvrIP)
end;
function GameSvrReady(dwGameSvrIP)
end

function TaskShedule()
TaskName( "MS2PLAYERCHAT" );
TaskInterval(10);
TaskCountLimit( 0 );
OutputMsg( "=================MS2PLAYERCHAT=================" );
end

function TaskContent()
GlobalExecute("dwf \\script\\global\\autochat.lua ms2player()")
end