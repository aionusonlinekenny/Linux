--Dev NamCungNhatThien edit
Include("\\script\\gb_modulefuncs.lua")
Include("\\script\\gb_taskfuncs.lua")

Include("\\script\\mission\\citywar_global\\ladder.lua")

--**********Dev NamCungNhatThien*********************
HinhThucCongThanh=0 ;  --0 l«i ®µi, 1 khiªu chiÕn lÖnh

TAB_NONE_CITYWAR = 
{
{{100414,100428},{70913,70930},{80317,80330},{81002,81016},{90402,90416},{91002,91016}}, --startsignup there is no-citywar dates in phase1, you can write oneday use {yymmdd}, or somedays "from to" use {yymmdd, yymmdd}
{{100414,100428},{70913,70930},{80317,80330},{81002,81016},{90402,90416},{91002,91006}}, --endsignup there is no-citywar dates in phase2, you can write oneday use {yymmdd}, or somedays use {yymmdd, yymmdd}
{{100414,100428},{70913,70930},{80317,80330},{81002,81016},{90402,90416},{91002,91006}}, --startarena there is no-citywar dates in phase3, you can write oneday use {yymmdd}, or somedays use {yymmdd, yymmdd}
{{100415,100428},{70914,71001},{80318,80331},{81003,81016},{90403,90416},{91003,91006}}, --startcitywar there is no-citywar dates in phase4, you can write oneday use {yymmdd}, or somedays use {yymmdd, yymmdd}
}

LGTSK_QINGTONGDING_COUNT = 1;	--±¨Ãû¾ºÍ¶µÄ ÇµÍ­¶¦ÊýÁ¿
LGTSK_CITYWAR_SIGNCOUNT = 2;	--µ±Ç°¾ºÍ¶µÄ´ÎÊý

LEAGUETYPE_CITYWAR_SIGN = 508;
LEAGUETYPE_CITYWAR_FIRST = 509;


TB_CITYWAR_ARRANGE = {
				{3,4,"Ph­îng T­êng"},--
				{1,2,"Thµnh §«"},--
				{2,3,"§¹i Lý"},--
				{5,6,"BiÖn Kinh"},--
				{4,5,"T­¬ng D­¬ng"},--
				{0,1,"D­¬ng Ch©u"},--
				{6,0,"L©m An"},--
			}
function getSigningUpCity(nSel)
	local nWeek = tonumber(date("%w"))
	for i = 1, getn(TB_CITYWAR_ARRANGE)do
		if (TB_CITYWAR_ARRANGE[i][nSel] == nWeek) then
			return i;
		end;
	end;
end;


function cw_CanStart(nCityId, nPhase)
	local nowday = tonumber(date("%y%m%d"))
	local nBegin = 0
	local nEnd = 0 
	for i = 1, getn(TAB_NONE_CITYWAR[nPhase]) do
		if (getn(TAB_NONE_CITYWAR[nPhase][i]) >= 2) then 
			nBegin = TAB_NONE_CITYWAR[nPhase][i][1]
			nEnd = TAB_NONE_CITYWAR[nPhase][i][2]
		else
			nBegin = TAB_NONE_CITYWAR[nPhase][i][1]
			nEnd = TAB_NONE_CITYWAR[nPhase][i][1]
		end
		
		if (nowday >= nBegin and nowday <= nEnd) then 
			OutputMsg(format("CityWar(%d) Can Not Start In This Phase(%d)!!!", nCityId, nPhase));
			return 0
		end
	end
	return 1
end

--Èç¹ûÎªnil»ò0£¬·µ»Ø1£¬·ñÔò·µ»Ø0
function FALSE(nValue)
	if (nValue == nil or nValue == 0 or nValue == "") then
		return 1
	else
		return nil
	end
end

--Ñ¡Ôñ¾ºÍ¶¶¦×î¶µµÄ°ï»á×öÎªÌôÕ½Õß
--Èç¹ûÊýÁ¿Ò»Ñù£¬ÔòËæ»úÑ¡Ò»¸ö
function GetRandomChallenger(szCityName)		--Chän ra bang c?khiªu chiÕn lÖnh nhiÒu nhÊt, == nhau s?random
	local nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_SIGN, szCityName);
	local nmem = LG_GetMemberCount(nlid);
	local szMem = "";
	local tbMem = {};
	if (nmem == 0) then
		return nil;
	end;
	if (nmem == 1) then
		szMem = LG_GetMemberInfo(nlid, 0);
		if (not FALSE(szMem)) then
			return szMem;
		else
			return nil;
		end;
	end;
	
	for i = 0, nmem - 1 do
		szMem = LG_GetMemberInfo(nlid, i);
		ncount = LG_GetMemberTask(LEAGUETYPE_CITYWAR_SIGN, szCityName, szMem, LGTSK_QINGTONGDING_COUNT);
		if (getn(tbMem) == 0) then
			tbMem[1] = {szMem, ncount};
		else
			if (ncount == tbMem[1][2]) then
				tbMem[getn(tbMem) + 1] = {szMem, ncount};
			elseif (ncount > tbMem[1][2]) then
				tbMem = {};
				tbMem[getn(tbMem) + 1] = {szMem, ncount};
			end;
		end;
	end;
	
	return tbMem[random(getn(tbMem))][1];
end;

function cw_startsignup_fun(nweek,ncan)
	--if (tonumber(date("%w")) == nweek and cw_CanStart(ncan,1) == 1) then

	if (tonumber(date("%w")) == nweek) then
		citywar_tbLadder:Reset();
		--±¨Ãû¿ªÊ¼£¬×´Ì¬ÖÃÒ»

		--Dev NamCungNhatThien edit
		clearCityWarLeague()
		checkCityWarLeague()  -- KiÓm tra t¹o ch­a

		LG_ApplySetLeagueTask(LEAGUETYPE_CITYWAR_SIGN, TB_CITYWAR_ARRANGE[ncan][3], 1, 1);
		GlobalExecute(format("dw AddLocalNews([[Ghi danh c«ng thµnh chiÕn <color=red>%s<color> ®· b¾t ®Çu, Bang Héi kh«ng chiÕm thµnh nµo, cã thÓ ®Õn c¸c th«n trang gÆp <color=red>C«ng Thµnh Quan<color> ®Ó ghi danh tham gia.]])",TB_CITYWAR_ARRANGE[ncan][3]));
		OutputMsg(format("=================[CONG THANH CHIEN %s ] DA MO GHI DANH=================",TB_CITYWAR_ARRANGE[ncan][3]))
	end;
	
end
function cw_start_fun(nweek,ncan)
	--if (tonumber(date("%w")) == nweek and cw_CanStart(ncan,4) == 1) then

	if (tonumber(date("%w")) == nweek) then
		StartCityWar(ncan);
		OutputMsg(format("=================[CONG THANH CHIEN %s ] BAT DAU=================",TB_CITYWAR_ARRANGE[ncan][3]))
	end;
end

function cw_endsignup_fun(nweek,ncan)
	--if (tonumber(date("%w")) == nweek and cw_CanStart(ncan,2) == 1) then

	if (tonumber(date("%w")) == nweek) then
		local nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_FIRST, TB_CITYWAR_ARRANGE[ncan][3]);
		szWarCityName = TB_CITYWAR_ARRANGE[ncan][3]
		if (FALSE(nlid)) then
			OutputMsg(format("=================THANH %s KHONG CO BANG HOI GHI DANH, TUAN NAY MOI SU THAI BINH=================",szWarCityName));
			GlobalExecute(format("dw AddLocalNews([[C«ng thµnh chiÕn <color=red>%s<color> kh«ng cã Bang Héi ghi danh, tuÇn nµy mäi sù th¸i b×nh]])",szWarCityName));
			
			--Dev NamCungNhatThien edit
			LG_ApplySetLeagueTask(LEAGUETYPE_CITYWAR_SIGN, TB_CITYWAR_ARRANGE[ncan][3], 1, 0);
			
			return 0;
		end
		local szFirstTong = GetRandomChallenger(TB_CITYWAR_ARRANGE[ncan][3]);
		if (FALSE(szFirstTong)) then
			OutputMsg(format("==================THANH %s KHONG CO BANG HOI GHI DANH, TUAN NAY MOI SU THAI BINH=================",szWarCityName));
			GlobalExecute(format("dw AddLocalNews([[C«ng thµnh chiÕn <color=red>%s<color> kh«ng cã Bang Héi ghi danh, tuÇn nµy mäi sù th¸i b×nh]])",szWarCityName));
			
			--Dev NamCungNhatThien edit
			LG_ApplySetLeagueTask(LEAGUETYPE_CITYWAR_SIGN, TB_CITYWAR_ARRANGE[ncan][3], 1, 0);

			return 0;
		end;
		
		if (GetCityOwner(ncan) == "" or GetCityOwner(ncan) == nil) then
			--GlobalExecute("dw AppointViceroy([[³É¶¼]],[["..szFirstTong.."]])");
			GlobalExecute(format("dwf \\script\\missions\\citywar_global\\citywar_function.lua citywar_appointviceroy([[%s]],[[%s]])",szWarCityName,szFirstTong));
			--GlobalExecute(format("dw AddLocalNews([[%s °ï»á¾ºÍ¶³É¹¦£¬³ÉÎª³É¶¼³ÇÇøµÄÐ¢³ÇÖ÷]])", szFirstTong));
			--OutputMsg(szFirstTong.."¾ºÍ¶³É¹¦£¬³ÉÎª³É¶¼³ÇÇøµÄ³ÇÖ÷¡£")
			
			OutputMsg(format("=================BANG HOI %s DA CHIEM DUOC THANH %s =================",szFirstTong,szWarCityName));
		else
			--GlobalExecute("dw AppointChallenger([[³É¶¼]],[["..szFirstTong.."]])");
			GlobalExecute(format("dwf \\script\\missions\\citywar_global\\citywar_function.lua citywar_appointchallenger([[%s]],[[%s]])",szWarCityName,szFirstTong));
			OutputMsg(format("%s tranh ®o¹t lÖnh bµi thµnh c«ng, trë thµnh khiªu chiÕn thµnh bang héi %s vµo ngµy mai.",szFirstTong,szWarCityName))
			GlobalExecute(format("dw AddLocalNews([[Bang héi <color=red>%s<color> tranh ®o¹t lÖnh bµi thµnh c«ng, trë thµnh khiªu chiÕn thµnh bang héi <color=red>%s<color> vµo ngµy mai]])", szFirstTong,szWarCityName));
			
			OutputMsg(format("=================BANG HOI %s KHIEU CHIEN THANH %s VAO NGAY MAI =================",szFirstTong,szWarCityName));
		end;

	end;
	--±¨Ãû½áÊø£¬×´Ì¬ÖÃÁã
	LG_ApplySetLeagueTask(LEAGUETYPE_CITYWAR_SIGN, TB_CITYWAR_ARRANGE[ncan][3], 1, 0);
end


--Dev NamCungNhatThien edit
function clearCityWarLeague()
--	 ÔÚ24Ê± Ö´ÐÐÏÂÃæµÄ²Ù×÷
		for i = 1, 7 do
			local nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_FIRST, TB_CITYWAR_ARRANGE[i][3]);
			if (not FALSE(nlid)) then
				local nCount = LG_GetMemberCount(nlid);
				for k= 0, nCount -1 do
					local szMemberName = LG_GetMemberInfo(nlid, k);
					LGM_ApplyRemoveMember(LEAGUETYPE_CITYWAR_FIRST, TB_CITYWAR_ARRANGE[i][3], szMemberName, "", "", 0);
				end;
			end;
			
			
			nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_SIGN, TB_CITYWAR_ARRANGE[i][3]);
			if (not FALSE(nlid)) then
				nCount = LG_GetMemberCount(nlid);
				local tbTemMem = {};
				for k = 0, nCount -1 do
					local szMemberName = LG_GetMemberInfo(nlid, k);
					tbTemMem[getn(tbTemMem)+1] = szMemberName;
				end;
				for k = 1, getn(tbTemMem) do
					LGM_ApplyRemoveMember(LEAGUETYPE_CITYWAR_SIGN, TB_CITYWAR_ARRANGE[i][3], tbTemMem[k], "", "", 0);
				end;
			end;
		end;
end;
function checkCityWarLeague()
	for i = 1, 7 do
		local szLg = cityid_to_lgname(i);
		local nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_SIGN, szLg);
		if (FALSE(nlid)) then
			local nNewLeagueID = LG_CreateLeagueObj()	--Éú³ÉÉçÍÅÊý¾Ý¶ÔÏó(·µ»Ø¶ÔÏóID)
			LG_SetLeagueInfo(nNewLeagueID, LEAGUETYPE_CITYWAR_SIGN, szLg)	--ÉèÖÃÉçÍÅÐÅÏ¢(ÀàÐÍ¡¢Ãû³Æ)
			local ret = LG_ApplyAddLeague(nNewLeagueID, "", "");
			LG_FreeLeagueObj(nNewLeagueID);
		end;
		
		nlid = LG_GetLeagueObj(LEAGUETYPE_CITYWAR_FIRST, szLg);
		if (FALSE(nlid)) then
			local nNewLeagueID = LG_CreateLeagueObj()	--Éú³ÉÉçÍÅÊý¾Ý¶ÔÏó(·µ»Ø¶ÔÏóID)
			LG_SetLeagueInfo(nNewLeagueID, LEAGUETYPE_CITYWAR_FIRST, szLg)	--ÉèÖÃÉçÍÅÐÅÏ¢(ÀàÐÍ¡¢Ãû³Æ)
			local ret = LG_ApplyAddLeague(nNewLeagueID, "", "");
			LG_FreeLeagueObj(nNewLeagueID);
		end;
	end;
end;
function cityid_to_lgname(nCityID)
	return TB_CITYWAR_ARRANGE[nCityID][3];
end;

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
