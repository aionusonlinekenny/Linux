Include("\\script\\global\\signet_head.lua")
Include("\\script\\missions\\fengling_ferry\\fld_head.lua")
Include("\\script\\event\\jiefang_jieri\\200904\\shuizei\\shuizei.lua");
Include("\\script\\event\\change_destiny\\mission.lua");	-- ÄæÌì¸ÄÃü
SIGNET_DROPCOUNT = 2

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
	for i = 1, maxcount do
		local nItemIdx = DropItem(world, x, y, PlayerIndex, 6, 1, 1094, 1, 0, 0, 0, 0, 0, 0, 0, 0);
		SetSpecItemParam(nItemIdx, 1, nCurtime);
		SetSpecItemParam(nItemIdx, 2, nYear)
		SetSpecItemParam(nItemIdx, 3, nMonth)
		SetSpecItemParam(nItemIdx, 4, nDay)
		SyncItem(nItemIdx);
	end;
	
	-- if (jf0904_shuizei_IsActtime() == 1) then
		-- local nItemIdx = DropItem(world, x, y, PlayerIndex, 6,1,2015, 1, 0, 0, 0, 0, 0, 0, 0, 0);
		
		-- local nCurtime = tonumber(GetLocalDate("%H%M"));
		-- local nRestMin = 24 * 60 - (floor(nCurtime/100)*60+floor(mod(nCurtime, 100)));
		-- ITEM_SetExpiredTime(nItemIdx, nRestMin);
		-- SyncItem(nItemIdx);
		
		-- local nRate = 0.005;
		-- local nCurRate	= random(10000000)
		-- if (nCurRate <= 10000000 * nRate) then		
			-- local x, y, world = GetNpcPos(nNpcIndex);
			-- local nItemIdx = DropItem(world, x, y, PlayerIndex, 6,1,2115, 1, 0, 0, 0, 0, 0, 0, 0, 0);
		-- end
	-- end
	----------------------------------------------------------
	-- ÄæÌì¸ÄÃü
	tbChangeDestiny:completeMission_WaterThief();
		-- local tbAward = {
		-- [1]={nExp_tl=2e6},
--		[2]={szName="<color=yellow>HuyÒn Tinh Kho¸ng Th¹ch CÊp 7",tbProp={6,1,147,7,0,0},nCount=1},
--		[3]={szName="<color=yellow>C¸ ChÐp",tbProp={6,1,4801,1,0,0},nCount=50,nExpiredTime=20170830},
--		[4]={szName="<color=yellow>Hép quµ",tbProp={6,1,4265,1,0,0},nCount=200,nExpiredTime=20170830},					
	-- }	
	-- tbAwardTemplet:Give(tbAward, 1, {%EVENT_LOG_TITLE, "NhËn phÇn th­ëng tõ ThuyÒn Phu"})
	str = "<color=red>Chóc mõng cao thñ <color=yellow>"..GetName().."<color> <color=red>®· nhËn ®­îc phÇn th­ëng khi tiªu diÖt Thñy TÆc §Çu LÜnh t¹i Phong L¨ng §é"
	AddGlobalCountNews(str, 2)
	Msg2SubWorld("Chóc mõng cao thñ <color=yellow>"..GetName().." <color=red>®· nhËn ®­îc phÇn th­ëng Tiªu diÖt Thñy TÆc §Çu LÜnh t¹i Phong L¨ng §é")
end
