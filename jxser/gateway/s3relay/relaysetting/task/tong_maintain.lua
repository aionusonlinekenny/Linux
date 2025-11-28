	-- bang héi gi÷ g×n kÞch b¶n gèc

	--by luobaohang 06/03/10

	IncludeLib("TONG")

	-- bang héi gi÷ g×n ®óng giê khÝ

	INTERVAL_TIME = 1440	-- mçi 24 tiÕng ®ång hå g©y ra 7 thø

	function TaskShedule()

	TaskName( "Mçi ngµy duy tu ");

	-- 1440 phót mét lÇn

	TaskInterval(INTERVAL_TIME);

	-- thiÕt trÝ g©y ra thêi gian (0 ®iÓm 0 ph©n)

	TaskTime(0, 0);

	-- chÊp hµnh v« h¹n thø

	TaskCountLimit(0);

	end

	function TaskContent()

	local nTongID = TONG_GetFirstTong()

	OutputMsg( "Khëi ®éng bang héi duy tu... ... ... . . . . .")

	while (nTongID ~= 0)do

	OutputMsg( "§ang tiÕn hµnh duy tu: ".. TONG_GetName(nTongID))

	TONG_ApplyMaintain(nTongID)

	nTongID = TONG_GetNextTong(nTongID)

	end

	end

	function GameSvrConnected(dwGameSvrIP)

	end

	function GameSvrReady(dwGameSvrIP)

	end


