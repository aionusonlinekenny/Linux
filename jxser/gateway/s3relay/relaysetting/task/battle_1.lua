-- Õ½ÒÛÏµÍ³
-- Fanghao_Wu 2004-12-6

function TaskShedule()
	-- ÉèÖÃ·½°¸Ãû³Æ
	TaskName( "Tù ®éng tin tøc——Th«ng b¸o" );
	-- 10·ÖÖÓÒ»´Î
	TaskInterval( 1440 );
	-- 0Ê±0·Ö¿ªÊ¼£¨²»ÉèTaskTme, ÔòÊÇRelayÆô¶¯Ê±¾Í¿ªÊ¼£©
	--TaskTime( 18, 32 );
	 --ÉèÖÃ´¥·¢´ÎÊı£¬0±íÊ¾ÎŞÏŞ´ÎÊı
	TaskCountLimit( 0 );
	-- Êä³öÆô¶¯ÏûÏ¢
	OutputMsg( "BATTLE 1 startup..." );
end

function TaskContent()
	--Battle_StartNewRound( 1, 1 );	-- GMÖ¸Áî£¬Æô¶¯ĞÂÕ½¾Ö
	Battle_StartNewRound( 1, 3 );	-- GMÖ¸Áî£¬Æô¶¯¸ß¼¶ĞÂÕ½¾Ö
end