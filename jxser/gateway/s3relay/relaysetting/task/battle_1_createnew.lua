	-- chiÕn dŞch hÖ thèng

	-- Fanghao_Wu 2004-12-6

	Include( "\\RelaySetting\\battle\\script\\rf_header.lua" )

	function TaskShedule()

	-- thiÕt trİ ph­¬ng ¸n tªn gäi

	TaskName( "Tèng kim chiÕn dŞch tæng chØ huy" );

	TaskSetMode(1);

	-- mçi tuÇn (ngµy thø Hai) b¾t ®Çu míi mét vßng

	TaskSetStartDay(1, 3);

	-- mét vßng mét tuÇn hoµn

	TaskInterval(7);

	TaskTime(2, 0);

	TaskCountLimit(0);

	end

	function TaskContent()

	OutputMsg( "****************Create XIANGYANG New Battle******** ")

	battle_StartNewIssue(1, 1 );

	battle_StartNewIssue(1, 2 );

	battle_StartNewIssue(1, 3 );

	OutputMsg( "*************************************************** ")

	end

	function GameSvrConnected(dwGameSvrIP)

	end

	function GameSvrReady(dwGameSvrIP)

	end


