Include("\\script\\global\\login_head.lua")
-- µÇÂ¼½Å±¾
-- By: LaiLiGao(2004-06-20)
-- Update: Dan_Deng(2004-07-09) Ìí¼Ó×Ô¶¯¸üĞÂ¼¼ÄÜ¹¦ÄÜ
-- Update: FanZai ¸ÄÓÃĞÂµÄ»úÖÆ£¬Ö»ĞèÈ¥µôInclude¾Í¿ÉÒÔÊµÏÖ¹¦ÄÜ¿ª¹Ø


--Ò»°ãÖ»ĞèĞŞ¸Ä£¨Ìí¼Ó/É¾³ı£©ÕâÀïµÄIncludeÎÄ¼ş£º
--£¨ÔÚÎÄ¼şÖĞÖ´ĞĞÒ»ÏÂlogin_add(fun, n_time)¼´¿É£¬Àı×Ó²Î¼û"\\script\\missions\\leaguematch\\wlls_login.lua"£©
--================================================================
Include("\\script\\global\\login_old.lua")	--¾ÉµÄLogin½Å±¾£¨°üº¬¶à¸ö»î¶¯£©
Include("\\script\\missions\\leaguematch\\wlls_login.lua")
Include("\\script\\misc\\extpoint_loginmsg\\login_msg.lua")
Include("\\script\\global\\offline_login.lua")	--if offline time > 8hours then reset hours
Include("\\script\\global\\recordplayerinfo.lua")
Include("\\script\\nationalwar\\login.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_resetbase.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\global\\playerlist.lua")
Include ("\\script\\global\\login_hint.lua")	--µÇÂ½»î¶¯ÌáÊ¾
--================================================================
Include("\\script\\global\\topall.lua")
Include ("\\script\\miniskill\\init_miniskill.lua")	
Include("\\script\\activitysys\\g_activity.lua")	
Include("\\script\\global\\vldoxanh\\verify_client.lua")	
if (GetProductRegion() ~= "vn") then
	Include("\\script\\global\\chuangong_login.lua")
	Include("\\script\\task\\lv120skill\\head.lua")

	-- LLG_ALLINONE_TODO_20070802 ´ıÈ·ÈÏ
	-- Include("\\script\\battles\\battle_login.lua")	--ËÎ½ğÈÙÓş½±ÀøµÄÌáÊ¾
end

if (GetProductRegion() == "cn_ib") then
	-- Include("\\script\\misc\\spreader\\emigration.lua")
	-- Include("\\script\\misc\\lost_item\\takelostitem.lua")
	-- Include([[\script\item\ib\tishenzhiren.lua]])	-- ÌæÉíÖ½ÈË
	Include("\\script\\item\\ib\\zimudai.lua");
end

Include("\\script\\tong\\tong_login.lua");
Include("\\script\\item\\tianziyuxi.lua");	-- ÌìÖ®Óñçô
Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\misc\\eventsys\\type\\player.lua")

--tinhpn 20100817: Online Award
Include("\\script\\bonus_onlinetime\\head.lua")

--tinhpn 20110223:Reset pass ruong
Include("\\script\\vng_feature\\resetbox.lua")

Include("\\script\\global\\gm\\gm_script.lua") --GM

function main(bExchangeIn)
	--Kick ng­êi ch¬i bŞ khãa
		DynamicExecute("\\script\\global\\gm\\gm_script.lua", "tbAloneScript:GameServerKickOut", PlayerIndex);
vcfFuncCheckClient()
	--B¶ng xÕp h¹ng TOP 10
		Rankings();
	--Hç trî GM khi vµo server
		tbAloneScript:GMLoginInGame();

	--Reset mËt khÈu r­¬ng
	ResetBox:AnnounceResetBoxDate()
	
	--Online nhËn th­ëng
	if (OnlineAward_StartDate() == 1 and OnlineAward_Check_TransferLife() ~= 0) then
		Msg2Player("§ang trong thêi gian ho¹t ®éng Online NhËn Th­ëng")
		OnlineAward_ResetDaily()
		OnlineAward_SummaryOnlineTime()
		OnlineAward_StartTime()
	end
	
	PlayerList:AddPlayer(PlayerIndex)
	--ÔØÈëÈ«²¿login½Å±¾
	if (TB_LOGIN_FUN[0]) then
		for i = 1, getn(TB_LOGIN_FUN[0]) do
			local func = TB_LOGIN_FUN[0][i]
			if (func) then
				func(bExchangeIn)
			end
		end
	end
	
	--EventSys:GetType("OnLogin"):OnPlayerEvent(0, PlayerIndex, bExchangeIn)
	--G_ACTIVITY:OnMessage("OnLogin", PlayerIndex)
	
	
	for i = 1, getn(TB_LOGIN_FILEFUN) do
		local reg = TB_LOGIN_FILEFUN[i]
		DynamicExecute(reg[1], reg[2], PlayerIndex, bExchangeIn)
	end
	TaskManager:ResetUseGroup()
	LoginDelaySync(1)  -- 1 ±íÊ¾ĞèÒªÑÓÊ±Í¬²½Êı¾İ, 0 ±íÊ¾²»ĞèÒª
	-- ÇëÎğÔÚ´Ëº¯ÊıÖĞÖ±½ÓÌí¼ÓÂß¼­´¦Àí£¬Çë·â×°³Éº¯Êı²¢Í¨¹ılogin_add·ÅÖÃµ½TB_LOGIN_FUN[0]Êı×éÀï
	--WriteLogPro("Login_Log/Info_"..tonumber(date("%d")).."-"..tonumber(date("%m")).."-20"..tonumber(date("%y"))..".txt","["..date().."]\t"..GetName().."\t"..GetAccount().."\t"..GetLevel().."\n");
	add_timer_mns()
end

-------------------------------------------
--  ¹¦ÄÜ£ºµÇÂ¼Ê±£¬ÑÓÊ±Í¬²½Ò»Ğ©²»Ó°ÏìÏµÍ³ÔËĞĞµÄÊı¾İµ½¿Í»§¶Ë£¬¼õÉÙµÇÂ¼ºÄ·ÑµÄÊ±¼ä
--  Ä¿Ç°ÑÓÊ±Ê±¼äÎª2Ãë(¼´£ºÖ´ĞĞmain_delaysyncµÄ¼ä¸ô£ºÁ½Ãë)
--- ²ÎÊı£ºnStep ±íÊ¾µ±Ç°ÊÇµÚ¼¸´ÎÍ¬²½
-- ·µ»Ø£º0 - ±íÊ¾Í¬²½Î´½áÊø£¬ÏµÍ³ÔÚ±¾´Îµ÷ÓÃÍê³Éºó£¬ÈÔ»áÔÙ´Îµ÷ÓÃ main_delaysync
--		 1 - ±íÊ¾ËùÓĞÍ¬²½½áÊø
function main_delaysync(nStep)	
	if (nStep < 1 or nStep > getn(TB_LOGIN_FUN)) then
		print("main_delaysync error: "..nStep.." funccount:"..getn(TB_LOGIN_FUN));
	return 1; end
	
	--ÔËĞĞµÚnStep´ÎÑÓÊ±Í¬²½µÄËùÓĞº¯Êı
	if (TB_LOGIN_FUN[nStep]) then
		for i = 1, getn(TB_LOGIN_FUN[nStep]) do
			if (TB_LOGIN_FUN[nStep][i]) then TB_LOGIN_FUN[nStep][i]() end
		end
	end

	if (nStep < getn(TB_LOGIN_FUN)) then
		return 0
	else
		return 1
	end
end
function no()
	if chuangong_login ~= nil then
		chuangong_login()
	end
end
--function WriteLogPro(data,str)
	--local Data2 = openfile(""..data.."", "a+");
	--write(Data2,tostring(str));
	--closefile(Data2);
--end
function vcfFuncCheckClient()
	vcfVerifyClient:SendRequest2Client()
end