Include("\\script\\lib\\composeex.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\event\\equip_publish\\nguyetkhuyet\\equiptable.lua")
Include("\\script\\event\\equip_publish\\nguyetkhuyet\\equiptable2.lua")

IncludeLib("ITEM")
tbItem2BaiHu = tbActivityCompose:new()
tbItem2BaiHu.bAccessBindItem = 0
MSG_COMPOSE_TITLE = "Hîp thµnh 1 trang bÞ NguyÖt KhuyÕt yªu cÇu cã 1111 Tö Tinh Kho¸ng Th¹ch, 1 NguyÖt KhuyÕt Th¹ch, Ýt cÇn cã 1 §å Phæ NguyÖt KhuyÕt t­¬ng øng vµ trang bÞ Tinh S­¬ng, 20000 v¹n l­îng, vµ c¸c nguyªn liÖu kh¸c lµm t¨ng tØ lÖ thµnh c«ng"

CommonMaterial = 
{
	{szName="Tö Tinh Kho¸ng Th¹ch", tbProp={6, 1, 4822}, nCount = 1111},
	{szName="NguyÖt KhuyÕt Th¹ch", tbProp={6, 1, 4859}, nCount = 1},
	{szName=" l­îng", nJxb=1, nCount = 200000000},
	
}

AdditiveMaterial =
{	
	{szName = "NguyÖt KhuyOt Tinh Th¹ch", tbProp = {6,1,4858}, nSuccessRate = 5, nMaxSuccessRate = 45},
}

tbFormulaList = 
{
	[1] = 
	{
		szName = "NguyÖt KhuyÕt H¹ng Liªn",
		tbSpecialMaterial = 
		{
			{szName = "§å Phæ NguyÖt KhuyÕt H¹ng Liªn", tbProp = {6,1,4848}, nSuccessRate = 10, nMaxSuccessRate = 80},
		},				
		nWidth = 2,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[2] = 
	{				
		szName = "NguyÖt KhuyÕt Kh«i",
		tbSpecialMaterial = 
		{
			{szName = "§å Phæ NguyÖt KhuyÕt Kh«i", tbProp = {6,1,4849}, nSuccessRate = 10, nMaxSuccessRate = 80},			
		},
		nWidth = 2,
		nHeight = 2,
		nFreeItemCellLimit = 1,		
	},
	[3] = 
	{
		szName = "NguyÖt KhuyÕt Th­îng Giíi",
		tbSpecialMaterial = 
		{
			{szName = "§å Phæ NguyÖt KhuyÕt Th­îng Giíi", tbProp = {6,1,4850}, nSuccessRate = 10, nMaxSuccessRate = 80},			
		},		
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[4] = 
	{
		szName = "NguyÖt KhuyÕt Hé UyÓn",
		tbSpecialMaterial = 
		{
			{szName = "§å Phæ NguyÖt KhuyÕt Hé UyÓn", tbProp = {6,1,4851}, nSuccessRate = 10, nMaxSuccessRate = 80},			
		},		
		
		nWidth = 1,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[5] = 
	{
		szName = "NguyÖt KhuyÕt Yªu §¸i",
		tbSpecialMaterial = 
		{
			{szName = "§å Phæ NguyÖt KhuyÕt Yªu §¸i", tbProp = {6,1,4852}, nSuccessRate = 10, nMaxSuccessRate = 80},			
		},
		nWidth = 2,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
	[6] = 
	{
		szName = "NguyÖt KhuyÕt Y",
		tbSpecialMaterial = 
		{
			{szName = "§å Phæ NguyÖt KhuyÕt Y", tbProp = {6,1,4853}, nSuccessRate = 10, nMaxSuccessRate = 80},			
		},		
		nWidth = 2,
		nHeight = 3,
		nFreeItemCellLimit = 1,
	},
	[7] = 
	{
		szName = "NguyÖt KhuyÕt Vò KhÝ",
		tbSpecialMaterial = 
		{
			{szName = "§å Phæ NguyÖt KhuyÕt Vò KhÝ", tbProp = {6,1,4854}, nSuccessRate = 10, nMaxSuccessRate = 80},			
		},		
		
		nWidth = 2,
		nHeight = 4,
		nFreeItemCellLimit = 1,		
	},
	[8] = 
	{
		szName = "NguyÖt KhuyÕt Hµi",
		tbSpecialMaterial = 
		{
			{szName = "§å Phæ NguyÖt KhuyÕt Hµi", tbProp = {6,1,4855}, nSuccessRate = 10, nMaxSuccessRate = 80},			
		},			
		
		nWidth = 2,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[9] = 
	{
		szName = "NguyÖt KhuyÕt Béi",
		tbSpecialMaterial = 
		{
			{szName = "§å Phæ NguyÖt KhuyÕt Béi", tbProp = {6,1,4856}, nSuccessRate = 10, nMaxSuccessRate = 80},			
		},				
		
		nWidth = 1,
		nHeight = 2,
		nFreeItemCellLimit = 1,
	},
	[10] = 
	{
		szName = "NguyÖt KhuyÕt H¹ Giíi",
		tbSpecialMaterial = 
		{
			{szName = "NguyÖt KhuyÕt §å Phæ H¹ Giíi", tbProp = {6,1,4857}, nSuccessRate = 10, nMaxSuccessRate = 80},		
		},		

		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	},
}


function tbItem2BaiHu:GetComposeRate()
	local tbRoomItems = self:GetRoomItems(self.nRoomType)
	local nRate = self:CalcRate(%AdditiveMaterial ,tbRoomItems)
	local tbSpecialMaterial = self.tbFormula.tbSpecialMaterial
	nRate = nRate + self:CalcRate(tbSpecialMaterial ,tbRoomItems)
	return nRate
end

function tbItem2BaiHu:CalcRate(tbAdditive, tbRoomItems)	
	-- »ñÈ¡³É¹¦ÂÊ
	local nSuccessRate = 0
	for k, v in tbAdditive do
		local nCount = self:CalcItemCount(tbRoomItems, v)	
		local nSR = nCount * v.nSuccessRate
		if nSR > v.nMaxSuccessRate then
			nSR = v.nMaxSuccessRate
		end
		nSuccessRate = nSuccessRate + nSR;				
	end
	return nSuccessRate
end

function tbItem2BaiHu:CheckItem(tbItem ,nItemIndex)
	if IsMyItem(nItemIndex) ~= 1 then
		return
	end
	local tbRecItem = self:MakeItem(nItemIndex)
	if tbRecItem.nQuality == 1 then
		if GetItemBindState(nItemIndex) ~= 0 then
			return
		end
		if ITEM_GetExpiredTime(nItemIndex) ~= 0 then
			return
		end
		local nG = GetItemProp(nItemIndex)
		if nG == 7 then
			return
		end
	end
	for k,v in tbItem do
		if k ~= "szName" and type(v) ~= "table" and v ~= -1 and tbRecItem[k] and v~= tbRecItem[k] then
			return
		elseif k == "tbProp" and type(v) == "table" then
			local tbProp = tbRecItem[k]
			for k1,v1 in v do
				if  k1 ~= "n" and v1 ~= -1 and tbProp[k1] and v1~= tbProp[k1] then
					return 
				end
			end
		end
	end	
	return 1
end
function tbItem2BaiHu:ConsumeAdditive(tbAdditive, szLogTitle)
	for i=1,getn(tbAdditive) do
		local tbItem = tbAdditive[i]
		local tbRoomItems =  self:GetRoomItems(self.nRoomType)	
		local nCount = self:CalcItemCount(tbRoomItems, tbItem)
		local nMaxCount = floor(tbItem.nMaxSuccessRate / tbItem.nSuccessRate)
		if nCount > nMaxCount then
			nCount = nMaxCount
		end
		if nCount > 0 then
			self:ConsumeItem(tbRoomItems, nCount, tbItem)
		end
		self:ConsumeLog(nCount.." "..tbItem.szName, szLogTitle)
	end
	return 1;
end

function tbItem2BaiHu:Compose(nProductId)
	local tbProduct		= self.tbFormula.tbProduct[nProductId]
	local tbGoldEquip	= self.tbFormula.tbGoldEquip[nProductId]
	local tbGoldEquipEx	= self.tbFormula.tbGoldEquipEx[nProductId]
	
	if not tbProduct then
		return 
	end
	
	-- ¼ì²é±³°ü¿Õ¼ä
	local nFreeItemCellLimit = 1
	if self.tbFormula.nWidth ~= 0 and self.tbFormula.nHeight ~= 0 and CountFreeRoomByWH(self.tbFormula.nWidth, self.tbFormula.nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", nFreeItemCellLimit, self.tbFormula.nWidth, self.tbFormula.nHeight))
		return 0
	end
	
	-- ¼ÆËã³É¹¦ÂÊ
	
	local nSuccessRate = self:GetComposeRate()
	
	-- ¼ì²é²ÄÁÏÊÇ·ñ³ä×ã
	local szFailMsg = "<color=red>§¹i hiÖp mang nguyªn liÖu kh«ng ®ñ råi!<color>"
	if self:CheckMaterial(%CommonMaterial, 1) ~=1 then
		Talk(1, "", szFailMsg)
		return 0;
	end
	if self:CheckMaterial(self.tbFormula.tbSpecialMaterial, 1) ~=1 then
		Talk(1, "", szFailMsg)
		return 0;
	end
	if self:CheckMaterial({tbGoldEquip}, 1) ~=1 and self:CheckMaterial({tbGoldEquipEx}, 1) ~= 1 then
		Talk(1, "", szFailMsg)
		return 0;
	end
	
	
	self:ConsumeMaterial(%CommonMaterial, 1, self.szLogTitle)
	self:ConsumeAdditive(self.tbFormula.tbSpecialMaterial, self.szLogTitle)
	self:ConsumeAdditive(%AdditiveMaterial, self.szLogTitle)

	if random(1, 100) > nSuccessRate then
		Msg2Player("ThËt ®¸ng tiÕc chÕ t¹o ®· thÊt b¹i")
		return 0
	end
	
	if self:ConsumeMaterial({tbGoldEquip}, 1, self.szLogTitle) ~= 1 then
		self:ConsumeMaterial({tbGoldEquipEx}, 1, self.szLogTitle)
	end
	
	tbAwardTemplet:Give(tbProduct, 1, {self.szLogTitle})

	return 1;
end

function tbItem2BaiHu:GiveUIOk(nCount)
	
	local tbMaterial	= self.tbFormula.tbMaterial
	local tbAdditive = self.tbFormula.tbAdditive
	
	-- ¼ì²é²ÄÁÏÊÇ·ñ³ä×ã
	
	local szFailMsg = "<color=red>§¹i hiÖp mang nguyªn liÖu kh«ng ®ñ råi!<color>"
	if self:CheckMaterial(%CommonMaterial, 1) ~=1 then
		Talk(1, "", szFailMsg)
		return 0;
	end
	if self:CheckMaterial(self.tbFormula.tbSpecialMaterial, 1) ~=1 then
		Talk(2, "", szFailMsg, self.tbFormula.tbSpecialMaterial[1].szName)
		return 0;
	end
	
	local nSuccessRate = self:GetComposeRate()
	local szMsg = format("§Æt nguyªn liÖu vµo nhËn ®­îc tØ lÖ thµnh c«ng lµ%d%%, ®¹i hiÖp cã muèn tiÕp tôc chÕ t¹o kh«ng?", nSuccessRate)
	if nSuccessRate > 100 then
		szMsg = "TØ lÖ thµnh c«ng v­ît qu¸ 100% sÏ l·ng phÝ nguyªn liÖu cña ®¹i hiÖp, ng­¬i cã muèn tiÕp tôc chÕ kh«ng?"
	end
	
	local tbOpt = 
	{
		{"TiÕp tôc chÕ t¹o", self.SelectEquip, {self, 1, 5}},
		{"§Æt vµo lÇn n÷a", self.ComposeGiveUI, {self}},
		{"Hñy bá "},
	}
	CreateNewSayEx(szMsg, tbOpt)
end

function tbItem2BaiHu:SelectEquip(nId, nCount)
	
	local msg = %MSG_COMPOSE_TITLE
	local szMsg = format("%s,lùa chän mét %s", msg, self.tbFormula.szName)
	local nProductCount = getn(self.tbFormula.tbProduct)
	local nEndId = nCount + nId - 1
	if nEndId > nProductCount then
		nEndId = nProductCount
	end
	local tbOpt = {}
	for i=nId, nEndId  do 
		tinsert(tbOpt, {%tbRepresentName[i], self.Compose, {self, i}})
	end
	if nId >= nCount + 1  then
		tinsert(tbOpt, {"Trang tr­íc", self.SelectEquip, {self, nId-nCount, nCount}})
	end
	if nEndId < nProductCount then
		tinsert(tbOpt, {"Trang kÕ ", self.SelectEquip, {self, nId+nCount, nCount}})
	end
	tinsert(tbOpt, {"Hñy bá "})
	CreateNewSayEx(szMsg, tbOpt)
end

local tbDialogOpt = {}
function tbItem2BaiHu:ComposeGiveUI()
		
	local szTitle = format("§æi %s", self.tbFormula.szName)
	local szContent = self:GetMaterialList(%CommonMaterial)
	
	szContent = gsub(szContent, "<color=?%w*>", "")
	
	szContent = gsub(szContent, "%((%d+)/(%d+)%)", "%2")
	
	szContent = format("%s<enter>%-20s  %s", szContent, "1 Trang BÞ Tinh S­¬ng t­¬ng øng", "1")
	szContent = format("%s<enter>%-20s  %s", szContent, "§å Phæ NguyÖt KhuyÕt", "1")
	
	g_GiveItemUI(szTitle, szContent, {self.GiveUIOk, {self}}, nil, self.bAccessBindItem)
end

function tbItem2BaiHu:SelectParts()
	CreateNewSayEx(format("%s, lùa chän trang bÞ mµ ng­¬i muèn chÕ t¹o:", %MSG_COMPOSE_TITLE), %tbDialogOpt)
end

for i=1, getn(tbFormulaList) do
	tbFormulaList[i].tbProduct = tbEquip_BaiHu[i]
	tbFormulaList[i].tbGoldEquip = tbEquip_jinwu[i]
	tbFormulaList[i].tbGoldEquipEx = tbEquip_JinWuEx[i]
	
	local p = tbItem2BaiHu:new(tbFormulaList[i], "Item2BaiHu", INVENTORY_ROOM.room_giveitem)
	
	local szOpt = format("ChÕ t¹o %s", tbFormulaList[i].szName)
	tinsert(tbDialogOpt, {szOpt, p.ComposeGiveUI, {p}})
end
tinsert(tbDialogOpt, {"Hñy bá "})

--T¹m ®ãng tÝnh n¨ng chÕ t¹o NguyÖt KhuyÕt - Modified By DinhHQ - 20120511
pEventType:Reg("Thî rÌn trong thµnh", "ChÕ T¹o Trang BÞ NguyÖt KhuyÕt", tbItem2BaiHu.SelectParts, {tbItem2BaiHu})

