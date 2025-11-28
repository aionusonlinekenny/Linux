-- Hµng rong Î c∏c thµnh thﬁ - Editor by AloneScript (Linh Em)

Include("\\script\\lib\\alonelib.lua");
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\npcfunlib.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\composelistclass.lua")
Include("\\script\\event\\jiefang_jieri\\201004\\triumph_drum\\npc.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\lib\\composeex.lua")
Include("\\script\\vng_event\\doi_hanh_hiep_lenh\\exchangeitem.lua")
Include("\\script\\missions\\dragonboat\\npc\\dragonboat_main.lua")

function OnExit()
end;

function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex);
	if NpcName2Replace then szNpcName = NpcName2Replace(szNpcName) end
	local tbDailog = DailogClass:new(szNpcName);
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex);
	
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
	
	
	tbDailog.szTitleMsg = "<npc>N¨i nµy t t c∂ Æ“u lµ k˙ tr©n dﬁ b∂o, ngµi m∆c dÔ tÔy ˝ l˘a ch‰n!"..Note("hangrong_thanhthi")
	
	--Change request 04/06/2011, ÷∆‘Ï∞◊Ω◊∞±∏- Modified by DinhHQ - 20110605
--	local w,x,y = GetWorldPos()
--	if w == 176 then
		tbDailog:AddOptEntry("Mua M∂nh Thi™n Thπch To∏i Phi’n.", Sale, {171}); 
--	end
	--ªª»°––œ¿¡Ó≥ˆ¥Ì- modified by DinhHQ - 20110921
	tbVng_Exchange_HHL:AddDialog(tbDailog)
	--tbDailog:AddOptEntry("Tham gia Æua thuy“n rÂng", WantBuyBaoshi)
	--tbDailog:AddOptEntry("Li™n quan Æ’n thuy“n rÂng", dragonboat_main)
	--tbDailog:AddOptEntry("Mua hÂi thi™n t∏i tπo c»m nang", WantBuyHuiTian)
	tbDailog:AddOptEntry("ßÊi l÷nh bµi", mualb)
	--tbDailog:AddOptEntry("ßÊi l y B∂o Thπch", WantBuyBaoshi)
	
	--Change request 04/06/2011 - Modified by DinhHQ - 20110605
	--tbDailog:AddOptEntry("ß” ta xem nµo (cˆa ti÷m ÆÂ cÚ)", OpenSecondStore); 
	if tbTriumphDrum:CheckCondition_BuyDrum() == 1 then
		--tbDailog:AddOptEntry("Mua TrËng Kh∂i Hoµn",  tbTriumphDrum.NpcTalk,{tbTriumphDrum});  	
	end

	--Change request 04/06/2011 - Modified by DinhHQ - 20110605
	--tbDailog:AddOptEntry("Tho∏t ra", OnExit, {}); 	
	tbDailog:Show()
end;

function mualb()
	local nPrice = 1
	local szTitle = format("Ng≠¨i muËn ÆÊi l÷nh bµi nµo",tostring(nPrice))
	local tbOpt = {}
	tinsert(tbOpt, {"ßÊi Thanh C©u Kim Bµi", WantBuythanhcau}) 
	tinsert(tbOpt, {"ßÊi V©n LÈc Kim Bµi", WantBuyvanloc}) 
	tinsert(tbOpt, {"ßÊi Th≠¨ng Lang Kim Bµi", WantBuythuonglang}) 
	tinsert(tbOpt, {"ßÊi Huy“n Vi™n Kim Bµi", WantBuyhuyenvien}) 
	tinsert(tbOpt, {"ßÊi Tˆ M∑ng Kim Bµi", WantBuytumang}) 
	tinsert(tbOpt, {"ßÊi Kim § Kim Bµi", WantBuykimo}) 
	tinsert(tbOpt, {"ßÊi Bπch HÊ Kim Bµi", WantBuybachho}) 
	tinsert(tbOpt, {"ßÊi X›ch L©n Kim Bµi", WantBuyxichlan}) 
	tinsert(tbOpt, {"ßÊi Minh Ph≠Óng Kim Bµi", WantBuyminhphuong}) 
	tinsert(tbOpt, {"ThuÀn ti÷n Æi ngang qua mµ th´i"}) 
	CreateNewSayEx(szTitle, tbOpt);
end
---
function WantBuythanhcau()
	--Change request 04/06/2011 - Modified by DinhHQ - 20110605
	local nPrice = 20
	local szTitle = format("Mua Thanh C©u c«n ph∂i c„ %s Hµnh Hi÷p L÷nh",tostring(nPrice))
	local tbOpt = {}
	tinsert(tbOpt, {"X∏c nhÀn", Buythanhcau}) 
	tinsert(tbOpt, {"ThuÀn ti÷n Æi ngang qua mµ th´i"}) 
	CreateNewSayEx(szTitle, tbOpt);
end
---
function WantBuyvanloc()
	--Change request 04/06/2011 - Modified by DinhHQ - 20110605
	local nPrice = 50
	local szTitle = format("Mua V©n LÈc c«n ph∂i c„ %s Hµnh Hi÷p L÷nh",tostring(nPrice))
	local tbOpt = {}
	tinsert(tbOpt, {"X∏c nhÀn", Buyvanloc}) 
	tinsert(tbOpt, {"ThuÀn ti÷n Æi ngang qua mµ th´i"}) 
	CreateNewSayEx(szTitle, tbOpt);
end
---
function WantBuythuonglang()
	--Change request 04/06/2011 - Modified by DinhHQ - 20110605
	local nPrice = 70
	local szTitle = format("Mua Th≠¨ng Lang c«n ph∂i c„ %s Hµnh Hi÷p L÷nh",tostring(nPrice))
	local tbOpt = {}
	tinsert(tbOpt, {"X∏c nhÀn", Buythuonglang}) 
	tinsert(tbOpt, {"ThuÀn ti÷n Æi ngang qua mµ th´i"}) 
	CreateNewSayEx(szTitle, tbOpt);
end
---
function WantBuyhuyenvien()
	--Change request 04/06/2011 - Modified by DinhHQ - 20110605
	local nPrice = 100
	local szTitle = format("Mua Huy“n Vi™n c«n ph∂i c„ %s Hµnh Hi÷p L÷nh",tostring(nPrice))
	local tbOpt = {}
	tinsert(tbOpt, {"X∏c nhÀn", Buyhuyenvien}) 
	tinsert(tbOpt, {"ThuÀn ti÷n Æi ngang qua mµ th´i"}) 
	CreateNewSayEx(szTitle, tbOpt);
end
---
function WantBuytumang()
	--Change request 04/06/2011 - Modified by DinhHQ - 20110605
	local nPrice = 150
	local szTitle = format("Mua Tˆ M∑ng c«n ph∂i c„ %s Hµnh Hi÷p L÷nh",tostring(nPrice))
	local tbOpt = {}
	tinsert(tbOpt, {"X∏c nhÀn", Buytumang}) 
	tinsert(tbOpt, {"ThuÀn ti÷n Æi ngang qua mµ th´i"}) 
	CreateNewSayEx(szTitle, tbOpt);
end
---
function WantBuykimo()
	--Change request 04/06/2011 - Modified by DinhHQ - 20110605
	local nPrice = 200
	local szTitle = format("Mua Kim § c«n ph∂i c„ %s Hµnh Hi÷p L÷nh",tostring(nPrice))
	local tbOpt = {}
	tinsert(tbOpt, {"X∏c nhÀn", Buykimo}) 
	tinsert(tbOpt, {"ThuÀn ti÷n Æi ngang qua mµ th´i"}) 
	CreateNewSayEx(szTitle, tbOpt);
end
---
function WantBuybachho()
	--Change request 04/06/2011 - Modified by DinhHQ - 20110605
	local nPrice = 350
	local szTitle = format("Mua Bπch HÊ c«n ph∂i c„ %s Hµnh Hi÷p L÷nh",tostring(nPrice))
	local tbOpt = {}
	tinsert(tbOpt, {"X∏c nhÀn", Buybachho}) 
	tinsert(tbOpt, {"ThuÀn ti÷n Æi ngang qua mµ th´i"}) 
	CreateNewSayEx(szTitle, tbOpt);
end
---
function WantBuyxichlan()
	--Change request 04/06/2011 - Modified by DinhHQ - 20110605
	local nPrice = 550
	local szTitle = format("Mua X›ch L©n c«n ph∂i c„ %s Hµnh Hi÷p L÷nh",tostring(nPrice))
	local tbOpt = {}
	tinsert(tbOpt, {"X∏c nhÀn", Buyxichlan}) 
	tinsert(tbOpt, {"ThuÀn ti÷n Æi ngang qua mµ th´i"}) 
	CreateNewSayEx(szTitle, tbOpt);
end
---
function WantBuyminhphuong()
	--Change request 04/06/2011 - Modified by DinhHQ - 20110605
	local nPrice = 1000
	local szTitle = format("Mua Minh Ph≠Óng c«n ph∂i c„ %s Hµnh Hi÷p L÷nh",tostring(nPrice))
	local tbOpt = {}
	tinsert(tbOpt, {"X∏c nhÀn", Buyminhphuong}) 
	tinsert(tbOpt, {"ThuÀn ti÷n Æi ngang qua mµ th´i"}) 
	CreateNewSayEx(szTitle, tbOpt);
end
---------------------

function OpenSecondStore()
	--do return end	
	CreateStores();
	AddShop2Stores(178, "Cˆa ti÷m ÆÂ cÚ", 1, 100, "", 1);
	OpenStores();

end

function WantBuyHuiTian()
	--Change request 04/06/2011 - Modified by DinhHQ - 20110605
	local nPrice = 1
	local szTitle = format("Mua v“ ngµy t∏i tπo c»m nang c«n ph∂i c„ %s Hµnh Hi÷p L÷nh",tostring(nPrice))
	local tbOpt = {}
	tinsert(tbOpt, {"X∏c nhÀn", BuyHuiTian}) 
	tinsert(tbOpt, {"ThuÀn ti÷n Æi ngang qua mµ th´i"}) 
	CreateNewSayEx(szTitle, tbOpt);
end



function BuyHuiTian()
	local tbFormula = 
	{
		szName = "HÂi thi™n t∏i tπo c»m nang",
		--Change request 04/06/2011 - Modified by DinhHQ - 20110605
		tbMaterial = {{szName="Hµnh hi÷p l÷nh",tbProp={6,1,2566,1,0,0},nCount = 1,},},
		tbProduct = {szName="HÂi thi™n t∏i tπo c»m nang",tbProp={6,1,1781,1,0,0}, tbParam={60},},
		
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	}
	
	local p = tbActivityCompose:new(tbFormula, "xingxialin1huitian", INVENTORY_ROOM.room_giveitem)
	p:ComposeDailog()
end
---
function Buythanhcau()
	local tbFormula = 
	{
		szName = "Thanh C©u kim bµi",
		--Change request 04/06/2011 - Modified by DinhHQ - 20110605
		tbMaterial = {{szName="Hµnh hi÷p l÷nh",tbProp={6,1,2566,0,0,0},nCount = 20,},},
		tbProduct = {szName="Thanh C©u L÷nh",tbProp={6,1,2369,1,0,0},},
		
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 0.02,
	}
	
	local p = tbActivityCompose:new(tbFormula, "xingxialin2zimangjinpai", INVENTORY_ROOM.room_giveitem)
	p:ComposeDailog()
end
---
function Buyvanloc()
	local tbFormula = 
	{
		szName = "V©n LÈc kim bµi",
		tbMaterial = {{szName="Hµnh hi÷p l÷nh",tbProp={6,1,2566,0,0,0},nCount = 50,},},
		tbProduct = {szName="V©n LÈc kim bµi",tbProp={6,1,2353,1,0,0},},
		
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	}
	
	local p = tbActivityCompose:new(tbFormula, "xingxialin3jinwujinpai", INVENTORY_ROOM.room_giveitem)
	p:ComposeDailog()
end
---
function Buythuonglang()
	local tbFormula = 
	{
		szName = "Th≠¨ng Lang kim bµi",
		tbMaterial = {{szName="Hµnh hi÷p l÷nh",tbProp={6,1,2566,0,0,0},nCount = 70,},},
		tbProduct = {szName="Th≠¨ng Lang kim bµi",tbProp={6,1,2352,1,0,0},},
		
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	}
	
	local p = tbActivityCompose:new(tbFormula, "xingxialin3jinwujinpai", INVENTORY_ROOM.room_giveitem)
	p:ComposeDailog()
end
---
function Buyhuyenvien()
	local tbFormula = 
	{
		szName = "Huy“n Vi™n kim bµi",
		tbMaterial = {{szName="Hµnh hi÷p l÷nh",tbProp={6,1,2566,0,0,0},nCount = 100,},},
		tbProduct = {szName="Huy“n Vi™n kim bµi",tbProp={6,1,2351,1,0,0},},
		
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	}
	
	local p = tbActivityCompose:new(tbFormula, "xingxialin3jinwujinpai", INVENTORY_ROOM.room_giveitem)
	p:ComposeDailog()
end
---
function Buytumang()
	local tbFormula = 
	{
		szName = "Tˆ M∑ng kim bµi",
		tbMaterial = {{szName="Hµnh hi÷p l÷nh",tbProp={6,1,2566,0,0,0},nCount = 150,},},
		tbProduct = {szName="Tˆ M∑ng kim bµi",tbProp={6,1,2350,1,0,0},},
		
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	}
	
	local p = tbActivityCompose:new(tbFormula, "xingxialin3jinwujinpai", INVENTORY_ROOM.room_giveitem)
	p:ComposeDailog()
end
---
function Buykimo()
	local tbFormula = 
	{
		szName = "Kim § kim bµi",
		tbMaterial = {{szName="Hµnh hi÷p l÷nh",tbProp={6,1,2566,0,0,0},nCount = 200,},},
		tbProduct = {szName="Kim § kim bµi",tbProp={6,1,2349,1,0,0},},
		
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	}
	
	local p = tbActivityCompose:new(tbFormula, "xingxialin3jinwujinpai", INVENTORY_ROOM.room_giveitem)
	p:ComposeDailog()
end
---
function Buybachho()
	local tbFormula = 
	{
		szName = "Bπch HÊ kim bµi",
		tbMaterial = {{szName="Hµnh hi÷p l÷nh",tbProp={6,1,2566,0,0,0},nCount = 350,},},
		tbProduct = {szName="Bπch HÊ kim bµi",tbProp={6,1,2357,1,0,0},},
		
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	}
	
	local p = tbActivityCompose:new(tbFormula, "xingxialin3jinwujinpai", INVENTORY_ROOM.room_giveitem)
	p:ComposeDailog()
end
---
function Buyxichlan()
	local tbFormula = 
	{
		szName = "X›ch L©n kim bµi",
		tbMaterial = {{szName="Hµnh hi÷p l÷nh",tbProp={6,1,2566,0,0,0},nCount = 550,},},
		tbProduct = {szName="X›ch L©n kim bµi",tbProp={6,1,2370,1,0,0},},
		
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	}
	
	local p = tbActivityCompose:new(tbFormula, "xingxialin3jinwujinpai", INVENTORY_ROOM.room_giveitem)
	p:ComposeDailog()
end
---
function Buyminhphuong()
	local tbFormula = 
	{
		szName = "Minh Ph≠Óng kim bµi",
		tbMaterial = {{szName="Hµnh hi÷p l÷nh",tbProp={6,1,2566,0,0,0},nCount = 1000,},},
		tbProduct = {szName="Minh Ph≠Óng kim bµi",tbProp={6,1,2371,1,0,0},},
		
		nWidth = 1,
		nHeight = 1,
		nFreeItemCellLimit = 1,
	}
	
	local p = tbActivityCompose:new(tbFormula, "xingxialin3jinwujinpai", INVENTORY_ROOM.room_giveitem)
	p:ComposeDailog()
end
---


tbEquip2Item = tbActivityCompose:new()

function tbEquip2Item:CheckItem(tbItem ,nItemIndex)
	if IsMyItem(nItemIndex) ~= 1 then
		return
	end
	
	local tbRecItem = self:MakeItem(nItemIndex)
	local nExpiredTime = ITEM_GetExpiredTime(nItemIndex)
	local nLeftUsageTime = ITEM_GetLeftUsageTime(nItemIndex)
	if nExpiredTime ~= 0 or nLeftUsageTime ~= 4294967295 then
		return 
	end
	
	for k,v in tbItem do
		if k ~= "szName" and type(v) ~= "table" and v ~= -1 and tbRecItem[k] and v~= tbRecItem[k] then
			return
		elseif  k == "tbProp" and type(v) == "table" then
			local tbProp = tbRecItem[k]
			for k1,v1 in v do
				if type(v1) ~= "table" then
					if  k1 ~= "n" and v1 ~= -1 and tbProp[k1] and v1~= tbProp[k1] then
						return 
					end
				else
					if  k1 ~= "n" and v1 ~= -1 and tbProp[k1] and ( v1[1] > tbProp[k1] or tbProp[k1] > v1[2] )  then
						return 
					end
				end
			end
		end
	end		
	for key, value in tbItem do 
		if strfind(key, "Limit") and  type(value) == "function" then
			if value(tbItem, nItemIndex) ~= 1 then
				return
			end
		end
	end			
	return 1
end

function WantBuyBaoshi()
	local nPrice = 400
	local szTitle = format("Ng≠¨i ngh‹ ÆÊi loπi b∂o thπch nµo Æ©y",tostring(nPrice))
	local tbOpt = {}
	local tbFormulaList = 
	{
		[1] = 
		{
			tbMaterial = 
			{
				{szName = "Trang bﬁ Thanh C©u", tbProp = {0, {905,1134}}, nQuality = 1 },
			},
			tbProduct = {szName="Thanh c©u thπch", tbProp={6, 1, 2710, 1, 0, 0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02
		},
		[2] = 
		{
			tbMaterial = 
			{
				{szName = "Trang bﬁ V©n LÈc", tbProp = {0, {1135,1364}}, nQuality = 1 },
			},
			tbProduct = {szName="V©n LÈc Thπch", tbProp={6, 1, 2711, 1, 0, 0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02
		},
		[3] = 
		{
			tbMaterial = 
			{
				{szName = "Trang bﬁ Th≠¨ng Lang", tbProp = {0, {1365,1594}}, nQuality = 1 },
			},
			tbProduct = {szName="Th≠¨ng Lang Thπch", tbProp={6, 1, 2712, 1, 0, 0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02
		},
		[4] = 
		{
			tbMaterial = 
			{
				{szName = "Trang bﬁ Huy“n vi™n", tbProp = {0, {1595,1824}}, nQuality = 1 },
			},
			tbProduct = {szName="Huy“n Vi™n Thπch", tbProp={6, 1, 2713, 1, 0, 0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02
		},		
		[5] = 
		{
			tbMaterial = 
			{
				{szName = "Trang bﬁ Tı M∑ng", tbProp = {0, {1825,2054}}, nQuality = 1 },
			},
			tbProduct = {szName="Tˆ M∑ng thπch", tbProp={6, 1, 3000, 1, 0, 0}},
			nWidth = 1,
			nHeight = 1,
			nFreeItemCellLimit = 0.02
		},	
	}
		
	local tbOpt = {}
	local pEventType = EventSys:GetType("AddNpcOption")
	for i=1, getn(tbFormulaList) do
		local p = tbEquip2Item:new(tbFormulaList[i], "Equip2Stone", INVENTORY_ROOM.room_giveitem)
		local szOpt = format("ßπt Æ≠Óc %s", tbFormulaList[i].tbProduct.szName)
		tinsert(tbOpt, {szOpt, p.ComposeGiveUI, {p}})
	end
	tinsert(tbOpt, {"HÒy b·"})
	CreateNewSayEx(szTitle, tbOpt);
end
