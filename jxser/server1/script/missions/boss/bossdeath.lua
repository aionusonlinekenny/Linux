IncludeLib("TASKSYS")
Include("\\script\\global\\signet_head.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
IncludeLib("LEAGUE")
Include("\\script\\lib\\droptemplet.lua")
--ÎäÁÖÈÙÓþÁî µôÂä

HONOURID = {1257, 1294}
SIGNET_DROPCOUNT = 10
TSK_PLAYER_BOSSKILLED = 2598 -- Íæ¼Ò»÷É±BOSSÊýÁ¿Í³¼Æ
--DC kinh nghiÖm boss HK - Modified By DinhHQ - 20111007
--KILLBOSSEXPAWARD = 20000000	-- »÷É±boss½±Àø
--KILLBOSSNEAREXPAWARD = 12000000	-- »÷É±boss¸½½ü½±Àø
KILLBOSSEXPAWARD = 2000000
KILLBOSSNEAREXPAWARD = 1000000
--Renew boss award - Modified by DinhHQ - 20120319
local tbVnNewItemDropAward = {
	{{szName="Phi tèc hoµn lÔ bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=60},},
	{{szName="Thiªn V­¬ng Hoµng Kim Trang B~ B¶o R­¬ng (NgÉu nhiªn)",tbProp={6,1,4825,1,0,0},nCount=1, nRate=0.5, },},
	{{szName="Ngò §éc Hoµng Kim Trang B~ B¶o R­¬ng (NgÉu nhiªn)",tbProp={6,1,4826,1,0,0},nCount=1,nRate=0.5, },},
	{{szName="Thóy Yªn Hoµng Kim Trang B~ B¶o R­¬ng (NgÉu nhiªn)",tbProp={6,1,4827,1,0,0},nCount=1,nRate=0.5, },},
	{{szName="C«n L«n Hoµng Kim Trang B~ B¶o R­¬ng (NgÉu nhiªn)",tbProp={6,1,4828,1,0,0},nCount=1,nRate=0.4, },},
	{{szName="Thiªn NhÉn Hoµng Kim Trang B~ B¶o R­¬ng (NgÉu nhiªn)",tbProp={6,1,4829,1,0,0},nCount=1,nRate=0.4, },},
	{{szName="ThiOu L©m Hoµng Kim Trang B~ B¶o R­¬ng (NgÉu nhiªn)",tbProp={6,1,4830,1,0,0},nCount=1,nRate=0.5, },},
	{{szName="§­êng M«n Hoµng Kim Trang B~ B¶o R­¬ng (NgÉu nhiªn)",tbProp={6,1,4831,1,0,0},nCount=1, nRate=0.5, },},
	{{szName="Nga Mi Hoµng Kim Trang B~ B¶o R­¬ng (NgÉu nhiªn)",tbProp={6,1,4832,1,0,0},nCount=1,nRate=0.9, },},
	{{szName="Vâ §ang Hoµng Kim Trang B~ B¶o R­¬ng (NgÉu nhiªn)",tbProp={6,1,4833,1,0,0},nCount=1,nRate=0.9, },},
	{{szName="C¸i Bang Hoµng Kim Trang B~ B¶o R­¬ng (NgÉu nhiªn)",tbProp={6,1,4834,1,0,0},nCount=1,nRate=0.5, },},	
	{{szName="Phi tèc hoµn lÔ bao",tbProp={6,1,2520,1,0,0},nCount=1,nRate=60},},
	{{szName="§¹i lùc hoµn lÔ bao",tbProp={6,1,2517,1,0,0},nCount=1,nRate=60},},
	{{szName="Tö Thñy Tinh",tbProp={4,239,1,1,0,0},nCount=1,nRate=80},},
	{{szName="Lam Thñy Tinh",tbProp={4,238,1,1,0,0},nCount=1,nRate=80},},
	{{szName="Lôc Thñy Tinh",tbProp={4,240,1,1,0,0},nCount=1,nRate=80},},
	{{szName="Tinh Hång B¶o Th¹ch",tbProp={4,353,1,1,0,0},nCount=1,nRate=80},},
	{{szName="Tiªn Th¶o Lé ®Æc biÖt",tbProp={6,1,1181,1,0,0},nCount=1,nRate=50},},
}

function OnDeath( nNpcIndex )
	local x, y, world = GetNpcPos(nNpcIndex);
	local maxcount = SIGNET_DROPCOUNT;
	local _, nTongID = GetTongName();
	if (nTongID > 0) then
		if (IsDoubledMoneyBox(nTongID)) then
			maxcount = getSignetDropRate(SIGNET_DROPCOUNT);
		end;
	end;
	local nCurtime = GetCurServerTime() + 7 * 24 *60 * 60
	local nYear = tonumber(FormatTime2String("%Y", nCurtime))
	local nMonth = tonumber(FormatTime2String("%m", nCurtime))
	local nDay = tonumber(FormatTime2String("%d", nCurtime))
	--Bá phÇn th­ëng vËt phÈm khi tiªu diÖt boss - Modified by DinhHQ - 20111012
--	for i = 1, maxcount do
--		local nItemIdx = DropItem(world, x, y, PlayerIndex, 6, 1, 1094, 1, 0, 0, 0, 0, 0, 0, 0, 0);
--		SetSpecItemParam(nItemIdx, 1, nCurtime);
--		SetSpecItemParam(nItemIdx, 2, nYear)
--		SetSpecItemParam(nItemIdx, 3, nMonth)
--		SetSpecItemParam(nItemIdx, 4, nDay)
--		SyncItem(nItemIdx);
--	end;
	--Renew boss award - Modified by DinhHQ - 20120319
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,%tbVnNewItemDropAward,format("killed_%s",GetNpcName(nNpcIndex)))	
	
	-- ¸øÉ±µôBOSSµÄÈË»ò¶ÓÎé½±Àø
	local nTeamSize = GetTeamSize();
	local szName;
	
	if (nTeamSize > 1) then
		for i=1,nTeamSize do
			if(doFunByPlayer(GetTeamMember(i), IsCaptain)==1)then
				szName = doFunByPlayer(GetTeamMember(i), GetName);
			end
--			AddEnergy(1000)
			doFunByPlayer(GetTeamMember(i), PlayerFunLib.AddExp, PlayerFunLib, KILLBOSSEXPAWARD, 0, format("%s phÇn th­ëng","Kinh nghiÖm ®¶ b¹i BOSS hoµng kim"));
		end
	else -- Ò»¸öÈË
		szName = GetName();
--		AddEnergy(1000)
		PlayerFunLib:AddExp(KILLBOSSEXPAWARD, 0, format("%s phÇn th­ëng","Kinh nghiÖm ®¶ b¹i BOSS hoµng kim"));
	end
	
	local tbRoundPlayer, nCount = GetNpcAroundPlayerList(nNpcIndex, 20);
	
	for i=1,nCount do
	
		doFunByPlayer(tbRoundPlayer[i], PlayerFunLib.AddExp, PlayerFunLib, KILLBOSSNEAREXPAWARD, 0, format("%s phÇn th­ëng","Kinh nghiÖm ®øng gÇn lóc BOSS hoµng kim bÞ tiªu diÖt"));
	end
	
	local szNews = format("§¹i hiÖp <color=yellow>%s<color> t¹i <color=yellow>%s<color> ®· tiªu diÖt thµnh c«ng <color=yellow>%s<color>!", szName, SubWorldName(SubWorld),GetNpcName(nNpcIndex));
	AddGlobalNews(szNews);
	LG_ApplyDoScript(1, "", "", "\\script\\event\\msg2allworld.lua", "battle_msg2allworld", szNews , "", "");
	
	-- BOSS»÷É±Í³¼Æ
	local nCount = GetTask(TSK_PLAYER_BOSSKILLED);
	nCount = nCount + 1;
	SetTask(TSK_PLAYER_BOSSKILLED, nCount);
	
	if (GetNpcParam(nNpcIndex, 1) == 1) then --19:30µÄ»Æ½ðBOSS
		-- »Æ½ðBOSS¼ÆÊý
		RemoteExecute("\\script\\mission\\boss\\bigboss.lua", "ReduceGoldBossCount", 0);
	end
end;

