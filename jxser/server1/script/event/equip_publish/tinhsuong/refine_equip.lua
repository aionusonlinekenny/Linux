-- ÖØÖý½ðÎÚ×°±¸
Include("\\script\\lib\\composeex.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\event\\equip_publish\\tinhsuong\\equiptabledl.lua")


tbJinWuRefineEquip = tbActivityCompose:new()

tbJinWuRefineList = 
{
	[1]= {szName="§»ng Long H¹ng Liªn", nStone = 1, nWidth = 2, nHeight = 1, nFreeItemCellLimit = 1},
	[2]= {szName="§»ng Long Kh«i",   nStone = 2, nWidth = 2, nHeight = 2, nFreeItemCellLimit = 1},
	[3]= {szName="§»ng Long Th­îng Giíi ChØ", nStone = 2, nWidth = 1, nHeight = 1, nFreeItemCellLimit = 1},
	[4]= {szName="§»ng Long Hé UyÓn", nStone = 1, nWidth = 1, nHeight = 2, nFreeItemCellLimit = 1},
	[5]= {szName="§»ng Long Yªu §¸i", nStone = 2, nWidth = 2, nHeight = 1, nFreeItemCellLimit = 1},
	[6]= {szName="§»ng Long Y Phôc",   nStone = 3, nWidth = 2, nHeight = 3, nFreeItemCellLimit = 1},
	[7]= {szName="§»ng Long Vò KhÝ", nStone = 4, nWidth = 2, nHeight = 4, nFreeItemCellLimit = 1},
	[8]= {szName="§»ng Long Hµi",   nStone = 3, nWidth = 2, nHeight = 2, nFreeItemCellLimit = 1},
	[9]= {szName="§»ng Long Béi",   nStone = 3, nWidth = 1, nHeight = 2, nFreeItemCellLimit = 1},
	[10]={szName="§»ng Long H¹ Giíi ChØ", nStone = 2, nWidth = 1, nHeight = 1, nFreeItemCellLimit = 1},
}

function tbJinWuRefineEquip:ComposeGiveUI()
	
	local szTitle = format("  %-15s\t%s", "Trang bÞ §»ng Long", "Ngò Linh Quy Nguyªn Phï")
	local strDesc = format("   %-21s\t%d", "§»ng Long Kh«i", 2)
	strDesc = strDesc..format("\n   %-21s\t%d", "§»ng Long Y Phôc", 3)
	strDesc = strDesc..format("\n   %-21s\t%d", "§»ng Long Hµi", 3)
	strDesc = strDesc..format("\n   %-21s\t%d", "§»ng Long Yªu §¸i", 2)
	strDesc = strDesc..format("\n   %-21s\t%d", "§»ng Long Hé UyÓn", 1)
	strDesc = strDesc..format("\n   %-21s\t%d", "§»ng Long Ngäc Béi", 3)
	strDesc = strDesc..format("\n   %-21s\t%d", "§»ng Long H¹ng Liªn", 1)
	strDesc = strDesc..format("\n   %-21s\t%d", "§»ng Long Giíi ChØ", 2)
	strDesc = strDesc..format("\n   %-21s\t%d", "§»ng Long Vò KhÝ", 4)
	
	g_GiveItemUI(szTitle, strDesc, {self.GiveUIOk, {self}}, nil, self.bAccessBindItem)
end

function tbJinWuRefineEquip:Compose(nComposeCount)
	
	nComposeCount = nComposeCount or 1
	
	if type(self.tbFormula.pLimitFun) == "function" then
		if self.tbFormula:pLimitFun(nComposeCount) ~= 1 then
			return 0
		end
	end
	
	-- È¡µÃ½ðÎÚÖØÁ·Ê¯µÄÊýÁ¿
  local tbRoomItems =  self:GetRoomItems(self.nRoomType) --  Ã¿´Î¶¼ÖØÐÂ»ñÈ¡£¬ÒÔ·ÀÖ¹ÓÐ±ä»¯	
	local tbGoldEquip = nil
	local nEquType = 0		-- ÎäÆ÷Àà±ð
	local nEqIndex = 0
	for i = 1, getn(tbRoomItems) do 
		nItemQuality = GetItemQuality(tbRoomItems[i])
		--¼ì²éÎïÆ·Æ·ÖÊ
		if nItemQuality == 1 then
			nEqIndex = GetGlodEqIndex(tbRoomItems[i])
			if nEqIndex >= 2975 and nEqIndex <= 3204 then -- ½ðÎÚ×°±¸
				--¼ì²é°ó¶¨×´Ì¬
				local nBindState = GetItemBindState(tbRoomItems[i])
				if nBindState ~= 0 then
					Say("Trang bÞ cña ng­¬i ®ang trong tr¹ng th¸i khãa, kh«ng thÓ trïng luyÖn.")
					return 0
				end
				
				--¼ì²éÊÇ·ñÊÇÆÆËð×°±¸
				local nG, _, _ = GetItemProp(tbRoomItems[i])
				if nG == 7 then
					Say("Trang bÞ cña ng­¬i ®· bÞ h­ h¹i kh«ng thÓ trïng luyÖn.")
					return 0
				end
				
				nEquType = mod(nEqIndex - 2975, 10) + 1
				tbGoldEquip = {0, nEqIndex}
				break
			end
		end	
	end
	
	if tbGoldEquip == nil then
		Say("Ng­¬i ch­a ®Æt trang bÞ §»ng Long nµo vµo ®©y c¶.")
		return 0	
	end
		
	local nFreeItemCellLimit = tbJinWuRefineList[nEquType].nFreeItemCellLimit or 1
	
	nFreeItemCellLimit = ceil(nFreeItemCellLimit * nComposeCount)
	
	if tbJinWuRefineList[nEquType].nWidth ~= 0 and tbJinWuRefineList[nEquType].nHeight ~= 0 and CountFreeRoomByWH(tbJinWuRefineList[nEquType].nWidth, tbJinWuRefineList[nEquType].nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", nFreeItemCellLimit, tbJinWuRefineList[nEquType].nWidth, tbJinWuRefineList[nEquType].nHeight))
		return 0
	end	

  local tbItem = {szName = "Ngò Linh Quy Nguyªn Phï", tbProp = {6,1,3008,1,0,0}, nCount = tbJinWuRefineList[nEquType].nStone} 
  local nCount = self:CalcItemCount(tbRoomItems, tbItem)
  if nCount < tbJinWuRefineList[nEquType].nStone then
		local szMsg = self.tbFormula.szFailMsg or "<color=red>Ngò Linh Quy Nguyªn Phï mµ ng­¬i ®Æt vµo kh«ng ®ñ. <color>"
		Talk(1, "", szMsg)
		return 0;
  end
	
	local nIdx = floor((nEqIndex - 2975)/10) + 1
	local tbProduct = tbEquip_jinwu[nEquType][nIdx]
	local tbMaterial = {{szName = tbProduct.szName, tbProp = tbGoldEquip, nCount = 1}, tbItem}

	if self:ConsumeMaterial(tbMaterial, nComposeCount, self.szLogTitle) ~= 1 then
		--Say("ÖÆ×÷Ê§°Ü£¬²¿·ÖÎïÆ·¶ªÊ§¡£",0)
		Msg2Player("ChÕ t¹o thÊt b¹i, mÊt ®i mét sè nguyªn liÖu.")
		return 0;
	end
	

	tbAwardTemplet:GiveAwardByList(tbProduct, self.szLogTitle, nComposeCount)
	
	if type(self.tbFormula.pProductFun) == "function" then
		self.tbFormula:pProductFun(nComposeCount)
	end
	return 1;
end

function refine_jinwu()
		
	local strDesc = "<npc>LÊy <color=yellow>trang bÞ §»ng Long <color> muèn trïng luyÖn  vµ sè l­îng <color=yellow> Ngò Linh Quy Nguyªn Phï<color> t­¬ng øng ®Æt vµo phÝa d­íi"
	strDesc = strDesc..format("\n\t\t\t\t\t%-29s%s", "Trang bÞ §»ng Long", "Ngò Linh Quy Nguyªn Phï")
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "§»ng Long Kh«i", 2)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "§»ng Long Y Phôc", 3)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "§»ng Long Hµi", 3)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "§»ng Long Yªu §¸i", 2)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "§»ng Long Hé UyÓn", 1)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "§»ng Long Ngäc Béi", 3)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "§»ng Long H¹ng Liªn", 1)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "§»ng Long Giíi ChØ", 2)
	strDesc = strDesc..format("\n\t\t\t<color=yellow>%-34s<color=red>%d<color>", "§»ng Long Vò KhÝ", 4)
	local tbOpt = {}
	local tbMate =	{
			tbMaterial = 
			{
				{szName = "Trang bÞ §»ng Long", tbProp = {0, {2975,3204}}, nQuality = 1 },
				{szName = "Ngò Linh Quy Nguyªn Phï", tbProp = {6,1,3008,1,0,0},},
			},
			tbProduct = {szName="Trang bÞ §»ng Long", tbProp={0, {2975,3204}}},
		}
	local p = tbJinWuRefineEquip:new(tbMate, "JinWuRefineEquip", INVENTORY_ROOM.room_giveitem)
	tinsert(tbOpt, {"Trïng luyÖn trang bÞ §»ng Long", p.ComposeGiveUI, {p}})
	tinsert(tbOpt, {"Hñy bá "})
	CreateNewSayEx(strDesc, tbOpt);
end
