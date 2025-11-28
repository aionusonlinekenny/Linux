Include("\\script\\dailogsys\\dailogsay.lua");
Include("\\script\\global\\vldoxanh\\upgradegoldhorse\\lib.lua");
Include("\\script\\global\\vldoxanh\\upgradegoldhorse\\head.lua");
Include("\\script\\lib\\progressbar.lua")

DAILAOSU = "<npc>§¹i s­ n©ng cÊp chiÕn m·:"
--DAILAOSU = "<#><link=image[0]:\\spr\\dailaosu.spr>§¹i s­ n©ng cÊp chiÕn m·: <link>"

function main()
	local sex = GetSex();
	if sex == 0 then sex = "Nam" else sex = "N÷" end 
	
	local szTitle = DAILAOSU.."\nQuý <color=green>"..sex.." ®¹i hiÖp<color> cÇn g×? "
	local tbOp = {		
		{"T×m hiÓu n©ng cÊp thó c­ìi",timhieunangcapngua},
		{"Ta muèn n©ng cÊp thó c­ìi",tamuonnangcapngua},
		{"Ta chØ ghÐ qua th«i! T¹m biÖt!"},	
	}
	CreateNewSayEx(szTitle, tbOp)
end

function tamuonnangcapngua()
	local sex = GetSex();
	if sex == 0 then sex = "Nam" else sex = "N÷" end 
	local szTitle = DAILAOSU.."\nQuý <color=green>"..sex.." ®¹i hiÖp<color> muèn n©ng cÊp lo¹i nµo?? "
	local tbOp = {		
		
		{"N©ng cÊp ChiÕn m· th«ng th­êng",nangcapchienmathongthuong},
		{"N©ng cÊp ThÇn m· Hoµng Kim",nangcapchienmahoangkim},
		{"Trë l¹i",main},
		{"Ta chØ ghÐ qua th«i! T¹m biÖt!"},	
	}
	CreateNewSayEx(szTitle, tbOp)
end

function nangcapchienmathongthuong()
	UpgradeNormalHorse:DialogMain()
end


function nangcapchienmahoangkim()
	UpgradeGoldHorse:DialogMain()
end

function UpgradeGoldHorse:DialogMain()
	local nThanMa = ThanhCong_TM
	local nLaThan = ThanhCong_LT
	local nThanLoc = ThanhCong_TL
	local nThanHo = ThanhCong_TH
	local nCucPhamThanThu = ThanhCong_CPTT
	local szTitle = DAILAOSU.."<color=gold>ThÇn binh<color> ph¶i ®i víi <color=yellow>ThÇn M·<color>, nh­ thÕ míi râ ®­îc dòng khÝ cña <color=green>§¹i hiÖp<color> khi hµnh tÈu giang hå. H·y mang ®Õn cho ta mét vµi nguyªn liÖu cÇn thiÕt, ta sÏ t¹o t¸c cho c¸c h¹ nh÷ng con <color=yellow>ThÇn thó<color> dòng m·nh v« song. \n<pic=136><color=yellow> ThÇn M· - TØ LÖ : <color=red>"..nThanMa.."%<color> \n<pic=136> La ThÇn - TØ LÖ : <color=red>"..nLaThan.."%<color> \n<pic=136> ThÇn Léc - TØ LÖ : <color=red>"..nThanLoc.."%<color>\n<pic=136> ThÇn Hæ - TØ LÖ : <color=red>"..nThanHo.."%<color> \n<pic=136> Cùc PhÈm - TØ LÖ : <color=red>"..nCucPhamThanThu.."%<color> <color>\n<pic=136> <color=green> §¹i hiÖp chó ý: Toµn bé nguyªn liÖu sÏ mÊt khi n©ng cÊp thÊt b¹i!<color>";
	local tbOption = {};
	local nFaction = GetLastFactionNumber();
	--if (not TB_UpgradeGoldHorse[nFaction]) then
	--	Talk(1,"","C¸c h¹ <color=white>v« m«n ph¸i<color>, ta chØ ra tay diÖu dông cho c¸c nh©n sÜ vâ l©m ®· gia nhËp m«n ph¸i!");
	--	return 
	--end;
	for szEquip, tbEquip in TB_UpgradeGoldHorse[nFaction] do
		tinsert(tbOption,{format("%s",szEquip),self.DialogRoute,{self,szEquip,tbEquip}});
	end;
		tinsert(tbOption,{"Trë l¹i",tamuonnangcapngua});
		tinsert(tbOption,{"KÕt thóc ®èi tho¹i."});
	CreateNewSayEx(szTitle,tbOption);
end;

function UpgradeGoldHorse:DialogRoute(szEquip,tbEquip)
	local nThanMa = ThanhCong_TM
	local nLaThan = ThanhCong_LT
	local nThanLoc = ThanhCong_TL
	local nThanHo = ThanhCong_TH
	local nCucPhamThanThu = ThanhCong_CPTT
	local szTitle = DAILAOSU.."Ta ®©y sÏ gióp ng­¬i cã ®­îc 1 trong nh÷ng con <color=yellow>ThÇn Thó<color> uy m·nh v« song.\n<color=green>C¸c h¹ còng nªn l­u ý, toµn bé nguyªn liÖu sÏ mÊt ®i nÕu n©ng cÊp thÊt b¹i!<color>";
	local tbOption = {};
	for szRoute,tbRoute in tbEquip do
		tinsert(tbOption, {format("%s",szRoute), self.OpenUI,{self,szEquip,szRoute,tbRoute}});
	end;
		tinsert(tbOption,{"KÕt thóc ®èi tho¹i."});
	CreateNewSayEx(szTitle,tbOption);
end;

function UpgradeGoldHorse:OpenUI(szEquip,szRoute,tbRoute)
	local szDesc = "* Nguyªn liÖu cÇn thiÕt:";
	for i = 1, getn(tbRoute.tbMaterial) do
		szDesc = szDesc..format("\n+ x%d %s",tbRoute.tbMaterial[i].nCount,tbRoute.tbMaterial[i].szName);
	end;
		szDesc = szDesc.."\n* Sau khi cã ®Çy ®ñ nguyªn liÖu nh­ trªn, vui lßng bá vµo « trèng bªn d­íi. ";
	g_GiveItemUI("N©ng CÊp ThÇn Thó",szDesc,{self.ConfirmUI,{self,szEquip,szRoute,tbRoute,tbRoute.tbMaterial}});
end;

function UpgradeGoldHorse:ConfirmUI(szEquip,szRoute,tbRoute,tbMaterial,nCount)
	local tbItem,tbData = self:GetUI(nCount);

	if (tbRoute.tbItem.nCash) and (GetCash() < tbRoute.tbItem.nCash) then
		Say(format("RÊt tiÕc! B¹n kh«ng cã ®ñ <color=yellow>%s l­îng<color>!",tbRoute.tbItem.nCash));
		return
	end;
	
	for i = 1, getn(tbMaterial) do
		if (tbMaterial[i].tbProp[4] == -1) then
			tbMaterial[i].tbProp[4] = 1;
		end;
		local szIdx = format("%s,%s,%s,%s",tbMaterial[i].tbProp[1],tbMaterial[i].tbProp[2],tbMaterial[i].tbProp[3],tbMaterial[i].tbProp[4]);
		if (tbItem[szIdx]) and (tbItem[szIdx] < tbMaterial[i].nCount) then
			Say(format("RÊt tiÕc! B¹n kh«ng cã ®ñ %d <color=yellow>%s <color>!",tbMaterial[i].nCount,tbMaterial[i].szName));
			return
		elseif (tbItem[szIdx]) and (tbItem[szIdx] > tbMaterial[i].nCount) then
			Say(format("RÊt tiÕc! B¹n bá thõa %d <color=yellow>%s <color>!",(tbItem[szIdx]-tbMaterial[i].nCount),tbMaterial[i].szName));
			return
		elseif (not tbItem[szIdx]) then
			Say(format("RÊt tiÕc! B¹n cßn thiÕu %d <color=yellow>%s <color>!",tbMaterial[i].nCount,tbMaterial[i].szName));
			return
		end;
	end;
	
	local nCurRate = random(1,100);
	if (tbRoute.tbItem.nRate) and (tbRoute.tbItem.nRate < nCurRate) then
		local tbFail = self:Fail(tbData,tbMaterial);	
		Pay(tbRoute.tbItem.nCash);
		tbProgressBar:OpenByConfig(24, self.ProgressBarLoadFail,{self,tbRoute,tbItem,tbFail}, OnBreakHorse)	

		
	elseif (tbRoute.tbItem.nRate) and (tbRoute.tbItem.nRate >= nCurRate) then
		Pay(tbRoute.tbItem.nCash);	
		tbProgressBar:OpenByConfig(24, self.ProgressBarLoad,{self,tbRoute,tbItem,tbData,nIdx}, OnBreakHorse)
		
	else
--		for i = 1, getn(tbData) do
--			RemoveItemByIndex(tbData[i][1]);
--		end;
		Pay(tbRoute.tbItem.nCash);
		tbProgressBar:OpenByConfig(24, self.ProgressBarLoad,{self,tbRoute,tbItem,tbData,nIdx}, OnBreakHorse)

			--nIdx = AddItem(tbRoute.tbItem.tbProp[1],tbRoute.tbItem.tbProp[2],tbRoute.tbItem.tbProp[3],tbRoute.tbItem.tbProp[4],tbRoute.tbItem.tbProp[5],tbRoute.tbItem.tbProp[6])
		--	nIdx = AddGoldItem(tbRoute.tbItem.tbProp[1],tbRoute.tbItem.tbProp[2])
		--Msg2Player(format("Xin chóc mõng, b¹n ®· N©ng CÊp <color=yellow>%s<color> thµnh c«ng, nhËn ®­îc ThÇn Thó <color=yellow>%s<color>!",tbRoute.tbItem.szName,tbRoute.tbItem.szName));
		--SaveNow();
	end;
end;

function UpgradeGoldHorse:ProgressBarLoadFail(tbRoute,tbItem,tbFail)
	for i = 1, getn(tbFail) do
		RemoveItemByIndex(tbFail[i]);
	end;
	Msg2Player(format("RÊt tiÕc, b¹n ®· N©ng CÊp <color=yellow>%s<color> thÊt b¹i, bÞ mÊt mét sè nguyªn liÖu!",tbRoute.tbItem.szName));
	SaveNow();
end

function UpgradeGoldHorse:ProgressBarLoad(tbRoute,tbItem,tbData,nIdx)
	local nIdx = 0;
	for i = 1, getn(tbData) do
		RemoveItemByIndex(tbData[i][1]);
	end;
	--nIdx = AddItem(tbRoute.tbItem.tbProp[1],tbRoute.tbItem.tbProp[2],tbRoute.tbItem.tbProp[3],tbRoute.tbItem.tbProp[4],tbRoute.tbItem.tbProp[5],tbRoute.tbItem.tbProp[6])
	nIdx = AddGoldItem(tbRoute.tbItem.tbProp[1],tbRoute.tbItem.tbProp[2])
	Msg2Player(format("Xin chóc mõng, b¹n ®· N©ng CÊp <color=yellow>%s<color> thµnh c«ng, nhËn ®­îc ThÇn Thó <color=yellow>%s<color>!",tbRoute.tbItem.szName,tbRoute.tbItem.szName));
	AddGlobalNews(format("Xin chóc mõng, b¹n ®· N©ng CÊp <color=yellow>%s<color> thµnh c«ng, nhËn ®­îc ThÇn Thó <color=yellow>%s<color>!",tbRoute.tbItem.szName,tbRoute.tbItem.szName));
	SaveNow();
end

function UpgradeGoldHorse:Fail(tbData,tbMaterial)
	local tbTemp = {};
	for i = 1, getn(tbMaterial) do
		if (tbMaterial[i].tbProp[4] == -1) then
			tbMaterial[i].tbProp[4] = 1;
		end;
		local szIdx = format("%s,%s,%s,%s",tbMaterial[i].tbProp[1],tbMaterial[i].tbProp[2],tbMaterial[i].tbProp[3],tbMaterial[i].tbProp[4]);
		for k = 1, getn(tbData) do
			if (tbData[k][2] == szIdx) then
				if (tbMaterial[i].nFail ~= 0) then
					tinsert(tbTemp,tbData[k][1]);
				end;
			end;
		end;
	end;
	return tbTemp;
end;

function UpgradeGoldHorse:GetUI(nCount)
	local tbTemp = {};
	local tbData = {};
	for i = 1, nCount do
		local nItemIndex = GetGiveItemUnit(i);
		local nG,nD,nP,nL = GetItemProp(nItemIndex);
		local nStack = GetItemStackCount(nItemIndex) or 1;
		local szIdx = format("%s,%s,%s,%s",nG,nD,nP,nL);
		tbTemp[szIdx] = (tbTemp[szIdx] or 0)+nStack;
		tinsert(tbData,{nItemIndex,szIdx});
	end;
	return tbTemp,tbData;
end;



-- ChiÕn M· Th«ng Th­êng

function UpgradeNormalHorse:DialogMain()
	local nNgua80 = ThanhCong_8x
	local nNgua100 = ThanhCong_10x
	local nNgua120 = ThanhCong_12x
	local nNgua150 = ThanhCong_15x
	local szTitle = DAILAOSU.."<color=gold>§¹i hiÖp vang danh thiªn h¹<color> còng cÇn ph¶i cã 1 con <color=yellow>ChiÕn M·<color> ®Ó hµnh tÈu giang hå, nh­ thÕ míi tá râ ®­îc dòng khÝ cña <color=green>§¹i hiÖp<color> trong thÕ giíi Vâ L©m. H·y mang ®Õn cho ta mét vµi nguyªn liÖu cÇn thiÕt, ta sÏ t¹o t¸c cho c¸c h¹ nh÷ng con <color=yellow>ChiÕn m·<color> dòng m·nh v« song. \n<pic=136><color=yellow> Ngùa 80 - TØ LÖ : <color=red>"..nNgua80.."%<color> \n<pic=136> Ngùa 100 - TØ LÖ : <color=red>"..nNgua100.."%<color> \n<pic=136> Ngùa 120 - TØ LÖ : <color=red>"..nNgua120.."%<color> \n<pic=136> Ngùa 150 - TØ LÖ : <color=red>"..nNgua150.."%<color> <color>\n<pic=136> <color=green>§¹i hiÖp chó ý: Toµn bé nguyªn liÖu sÏ mÊt khi n©ng cÊp thÊt b¹i!<color>";
	local tbOption = {};
	local nFaction = GetLastFactionNumber();
	--if (not TB_UpgradeNormalHorse[nFaction]) then
	--	Talk(1,"","C¸c h¹ <color=white>v« m«n ph¸i<color>, ta chØ ra tay diÖu dông cho c¸c nh©n sÜ vâ l©m ®· gia nhËp m«n ph¸i!");
	--	return 
	--end;
	for szEquip, tbEquip in TB_UpgradeNormalHorse[nFaction] do
		tinsert(tbOption,{format("%s",szEquip),self.DialogRoute,{self,szEquip,tbEquip}});
	end;
		tinsert(tbOption,{"Trë l¹i",tamuonnangcapngua});
		tinsert(tbOption,{"KÕt thóc ®èi tho¹i."});
	CreateNewSayEx(szTitle,tbOption);
end;

function UpgradeNormalHorse:DialogRoute(szEquip,tbEquip)
	local nNgua80 = ThanhCong_8x
	local nNgua100 = ThanhCong_10x
	local nNgua120 = ThanhCong_12x
	local nNgua150 = ThanhCong_15x
	local szTitle = DAILAOSU.."Ta ®©y sÏ gióp ng­¬i cã ®­îc 1 trong nh÷ng con <color=yellow>ChiÕn M·<color> uy m·nh v« song.\n<color=green>C¸c h¹ còng nªn l­u ý, toµn bé nguyªn liÖu sÏ mÊt ®i nÕu n©ng cÊp thÊt b¹i!<color>";
	local tbOption = {};
	for szRoute,tbRoute in tbEquip do
		tinsert(tbOption, {format("%s",szRoute), self.OpenUI,{self,szEquip,szRoute,tbRoute}});
	end;
		tinsert(tbOption,{"KÕt thóc ®èi tho¹i."});
	CreateNewSayEx(szTitle,tbOption);
end;

function UpgradeNormalHorse:OpenUI(szEquip,szRoute,tbRoute)
	local szDesc = "* Nguyªn liÖu cÇn thiÕt:";
	for i = 1, getn(tbRoute.tbMaterial) do
		szDesc = szDesc..format("\n+ x%d %s",tbRoute.tbMaterial[i].nCount,tbRoute.tbMaterial[i].szName);
	end;
		szDesc = szDesc.."\n* Sau khi cã ®Çy ®ñ nguyªn liÖu nh­ trªn, vui lßng bá vµo « trèng bªn d­íi. ";
	g_GiveItemUI("N©ng CÊp ThÇn Thó",szDesc,{self.ConfirmUI,{self,szEquip,szRoute,tbRoute,tbRoute.tbMaterial}});
end;

function UpgradeNormalHorse:ConfirmUI(szEquip,szRoute,tbRoute,tbMaterial,nCount)
	local tbItem,tbData = self:GetUI(nCount);

	if (tbRoute.tbItem.nCash) and (GetCash() < tbRoute.tbItem.nCash) then
		Say(format("RÊt tiÕc! B¹n kh«ng cã ®ñ <color=yellow>%s l­îng<color>!",tbRoute.tbItem.nCash));
		return
	end;
	
	for i = 1, getn(tbMaterial) do
		if (tbMaterial[i].tbProp[4] == -1) then
			tbMaterial[i].tbProp[4] = 1;
		end;
		local szIdx = format("%s,%s,%s,%s",tbMaterial[i].tbProp[1],tbMaterial[i].tbProp[2],tbMaterial[i].tbProp[3],tbMaterial[i].tbProp[4]);
		if (tbItem[szIdx]) and (tbItem[szIdx] < tbMaterial[i].nCount) then
			Say(format("RÊt tiÕc! B¹n kh«ng cã ®ñ %d <color=yellow>%s <color>!",tbMaterial[i].nCount,tbMaterial[i].szName));
			return
		elseif (tbItem[szIdx]) and (tbItem[szIdx] > tbMaterial[i].nCount) then
			Say(format("RÊt tiÕc! B¹n bá thõa %d <color=yellow>%s <color>!",(tbItem[szIdx]-tbMaterial[i].nCount),tbMaterial[i].szName));
			return
		elseif (not tbItem[szIdx]) then
			Say(format("RÊt tiÕc! B¹n cßn thiÕu %d <color=yellow>%s <color>!",tbMaterial[i].nCount,tbMaterial[i].szName));
			return
		end;
	end;
	
	local nCurRate = random(1,100);
	if (tbRoute.tbItem.nRate) and (tbRoute.tbItem.nRate < nCurRate) then
		local tbFail = self:Fail(tbData,tbMaterial);
		for i = 1, getn(tbFail) do
			RemoveItemByIndex(tbFail[i]);
		end;
		Pay(tbRoute.tbItem.nCash);
		tbProgressBar:OpenByConfig(24, self.ProgressBarLoadFail,{self,tbRoute,tbItem}, OnBreakHorse)	

		
	elseif (tbRoute.tbItem.nRate) and (tbRoute.tbItem.nRate >= nCurRate) then
		for i = 1, getn(tbData) do
			RemoveItemByIndex(tbData[i][1]);
		end;
		Pay(tbRoute.tbItem.nCash);
		local nIdx = 0;
		tbProgressBar:OpenByConfig(24, self.ProgressBarLoad,{self,tbRoute,tbItem,tbData,nIdx}, OnBreakHorse)
		
	else
		for i = 1, getn(tbData) do
			RemoveItemByIndex(tbData[i][1]);
		end;
		Pay(tbRoute.tbItem.nCash);
		tbProgressBar:OpenByConfig(24, self.ProgressBarLoad,{self,tbRoute,tbItem,tbData,nIdx}, OnBreakHorse)

			--nIdx = AddItem(tbRoute.tbItem.tbProp[1],tbRoute.tbItem.tbProp[2],tbRoute.tbItem.tbProp[3],tbRoute.tbItem.tbProp[4],tbRoute.tbItem.tbProp[5],tbRoute.tbItem.tbProp[6])
		--	nIdx = AddGoldItem(tbRoute.tbItem.tbProp[1],tbRoute.tbItem.tbProp[2])
		--Msg2Player(format("Xin chóc mõng, b¹n ®· N©ng CÊp <color=yellow>%s<color> thµnh c«ng, nhËn ®­îc ThÇn Thó <color=yellow>%s<color>!",tbRoute.tbItem.szName,tbRoute.tbItem.szName));
		--SaveNow();
	end;
end;

function UpgradeNormalHorse:ProgressBarLoadFail(tbRoute,tbItem)
	Msg2Player(format("RÊt tiÕc, b¹n ®· N©ng CÊp <color=yellow>%s<color> thÊt b¹i, bÞ mÊt mét sè nguyªn liÖu!",tbRoute.tbItem.szName));
	SaveNow();
end

function UpgradeNormalHorse:ProgressBarLoad(tbRoute,tbItem,tbData,nIdx)
	--nIdx = AddItem(tbRoute.tbItem.tbProp[1],tbRoute.tbItem.tbProp[2],tbRoute.tbItem.tbProp[3],tbRoute.tbItem.tbProp[4],tbRoute.tbItem.tbProp[5],tbRoute.tbItem.tbProp[6])
	nIdx = AddItem(tbRoute.tbItem.tbProp[1],tbRoute.tbItem.tbProp[2],tbRoute.tbItem.tbProp[3],tbRoute.tbItem.tbProp[4],tbRoute.tbItem.tbProp[5],tbRoute.tbItem.tbProp[6])
	local nLuck = random(1,100)
	if(nLuck > 50) then
		AddGlobalNews(format("Xin chóc mõng, b¹n ®· N©ng CÊp <color=yellow>%s<color> thµnh c«ng, nhËn ®­îc ThÇn Thó <color=yellow>%s<color>!",tbRoute.tbItem.szName,tbRoute.tbItem.szName));
	end
	Msg2Player(format("Xin chóc mõng, b¹n ®· N©ng CÊp <color=yellow>%s<color> thµnh c«ng, nhËn ®­îc ThÇn Thó <color=yellow>%s<color>!",tbRoute.tbItem.szName,tbRoute.tbItem.szName));
	SaveNow();
end

function UpgradeNormalHorse:Fail(tbData,tbMaterial)
	local tbTemp = {};
	for i = 1, getn(tbMaterial) do
		if (tbMaterial[i].tbProp[4] == -1) then
			tbMaterial[i].tbProp[4] = 1;
		end;
		local szIdx = format("%s,%s,%s,%s",tbMaterial[i].tbProp[1],tbMaterial[i].tbProp[2],tbMaterial[i].tbProp[3],tbMaterial[i].tbProp[4]);
		for k = 1, getn(tbData) do
			if (tbData[k][2] == szIdx) then
				if (tbMaterial[i].nFail ~= 0) then
					tinsert(tbTemp,tbData[k][1]);
				end;
			end;
		end;
	end;
	return tbTemp;
end;

function UpgradeNormalHorse:GetUI(nCount)
	local tbTemp = {};
	local tbData = {};
	for i = 1, nCount do
		local nItemIndex = GetGiveItemUnit(i);
		local nG,nD,nP,nL = GetItemProp(nItemIndex);
		local nStack = GetItemStackCount(nItemIndex) or 1;
		local szIdx = format("%s,%s,%s,%s",nG,nD,nP,nL);
		tbTemp[szIdx] = (tbTemp[szIdx] or 0)+nStack;
		tinsert(tbData,{nItemIndex,szIdx});
	end;
	return tbTemp,tbData;
end;

----- Kiem tra dieu kien
tbCondition =
{
	[1] = {

		{szName = "Tóc S­¬ng", tbProp = {3,0,10,2,10}},
		{szName = "¤ V©n §¹p TuyÕt", tbProp = {3,0,10,5,6}},
		{szName = "XÝch Thè", tbProp = {3,0,10,5,7}},
		{szName = "TuyÖt ¶nh", tbProp = {3,0,10,5,8}},
		{szName = "§Ých L«", tbProp = {3,0,10,5,9}},
		{szName = "ChiÕu D¹ Ngäc S­ Tö", tbProp = {3,0,10,5,10}},
		{szName = "Phi V©n", tbProp = {3,0,10,8,10}},
		{szName = "B«n Tiªu", tbProp = {3,0,10,6,10}},
	},
	[2] = {

		{szName = "B¾c §Èu thuÇn M· thuËt", tbProp = {3,6,1,1987,-1}},
		{szName = "Lam Thñy Tinh", tbProp = {3,4,238,1,-1}},
		{szName = "Tö Thñy Tinh", tbProp = {3,4,239,1,-1}},
		{szName = "Lôc Thñy Tinh", tbProp = {3,4,240,1,-1}},
	},
	[3] = {
		
		{szName = "H·n HuyÕt Long C©u", tbProp = {3,0,10,18,10}},	
		{szName = "XÝch Long C©u", tbProp = {3,0,10,31,10}},
	},

}


function timhieunangcapngua()
	local sex = GetSex();
	if sex == 0 then sex = "Nam" else sex = "N÷" end 
	local szTitle = DAILAOSU.."\nQuý <color=green>"..sex.." ®¹i hiÖp<color> muèn kiÓm tra ®iÒu kiÖn lo¹i nµo?? "
	local tbOp = {		
		
		{"§iÒu kiÖn N©ng cÊp chiÕn m· th«ng th­êng",kiemtrachienmathongthuong},
		{"§iÒu kiÖn N©ng cÊp ThÇn m· Hoµng Kim",kiemtrachienmahoangkim},
		{"Trë l¹i",main},
		{"Ta chØ ghÐ qua th«i! T¹m biÖt!"},	
	}
	CreateNewSayEx(szTitle, tbOp)
end


function kiemtrachienmathongthuong()
	local n_ngua1 = CalcItemCount(tbCondition[1][1].tbProp[1], tbCondition[1][1].tbProp[2],tbCondition[1][1].tbProp[3],tbCondition[1][1].tbProp[4],tbCondition[1][1].tbProp[5])
	local n_ngua2 = CalcItemCount(tbCondition[1][2].tbProp[1], tbCondition[1][2].tbProp[2],tbCondition[1][2].tbProp[3],tbCondition[1][2].tbProp[4],tbCondition[1][2].tbProp[5])
	local n_ngua3 = CalcItemCount(tbCondition[1][3].tbProp[1], tbCondition[1][3].tbProp[2],tbCondition[1][3].tbProp[3],tbCondition[1][3].tbProp[4],tbCondition[1][3].tbProp[5])
	local n_ngua4 = CalcItemCount(tbCondition[1][4].tbProp[1], tbCondition[1][4].tbProp[2],tbCondition[1][4].tbProp[3],tbCondition[1][4].tbProp[4],tbCondition[1][4].tbProp[5])
	local n_ngua5 = CalcItemCount(tbCondition[1][5].tbProp[1], tbCondition[1][5].tbProp[2],tbCondition[1][5].tbProp[3],tbCondition[1][5].tbProp[4],tbCondition[1][5].tbProp[5])
	local n_ngua6 = CalcItemCount(tbCondition[1][6].tbProp[1], tbCondition[1][6].tbProp[2],tbCondition[1][6].tbProp[3],tbCondition[1][6].tbProp[4],tbCondition[1][6].tbProp[5])
	local n_ngua7 = CalcItemCount(tbCondition[1][7].tbProp[1], tbCondition[1][7].tbProp[2],tbCondition[1][7].tbProp[3],tbCondition[1][7].tbProp[4],tbCondition[1][7].tbProp[5])
	local n_ngua8 = CalcItemCount(tbCondition[1][8].tbProp[1], tbCondition[1][8].tbProp[2],tbCondition[1][8].tbProp[3],tbCondition[1][8].tbProp[4],tbCondition[1][8].tbProp[5])
	local sz_Bacdau, sz_LamTT, sz_TuTT, sz_LucTT = ""
	local n_Bacdau = CalcItemCount(tbCondition[2][1].tbProp[1], tbCondition[2][1].tbProp[2],tbCondition[2][1].tbProp[3],tbCondition[2][1].tbProp[4],tbCondition[2][1].tbProp[5])
	local n_LamTT = CalcItemCount(tbCondition[2][2].tbProp[1], tbCondition[2][2].tbProp[2],tbCondition[2][2].tbProp[3],tbCondition[2][2].tbProp[4],tbCondition[2][2].tbProp[5])
	local n_TuTT = CalcItemCount(tbCondition[2][3].tbProp[1], tbCondition[2][3].tbProp[2],tbCondition[2][3].tbProp[3],tbCondition[2][3].tbProp[4],tbCondition[2][3].tbProp[5])
	local n_LucTT = CalcItemCount(tbCondition[2][4].tbProp[1], tbCondition[2][4].tbProp[2],tbCondition[2][4].tbProp[3],tbCondition[2][4].tbProp[4],tbCondition[2][4].tbProp[5])	
	if(n_Bacdau < 1) then
		sz_Bacdau = "<color=white>Kh«ng ®¹t ®iÒu kiÖn<color>";
	else
		sz_Bacdau = "<color=green>OK<color>";
	end
	if(n_LamTT < 1) then
		sz_LamTT = "<color=white>Kh«ng ®¹t ®iÒu kiÖn<color>";
	else
		sz_LamTT = "<color=green>OK<color>";
	end
	if(n_TuTT < 1) then
		sz_TuTT = "<color=white>Kh«ng ®¹t ®iÒu kiÖn<color>";
	else
		sz_TuTT = "<color=green>OK<color>";
	end
	if(n_LucTT < 1) then
		sz_LucTT = "<color=white>Kh«ng ®¹t ®iÒu kiÖn<color>";
	else
		sz_LucTT = "<color=green>OK<color>";
	end
	if(n_ngua1 < 1) then	nNgua1 = "<color=white>Kh«ng ®¹t ®iÒu kiÖn<color>";	else	nNgua1 = "<color=green>OK<color>";	end
	if(n_ngua2 < 1) then	nNgua2 = "<color=white>Kh«ng ®¹t ®iÒu kiÖn<color>";	else	nNgua2 = "<color=green>OK<color>";	end
	if(n_ngua3 < 1) then	nNgua3 = "<color=white>Kh«ng ®¹t ®iÒu kiÖn<color>";	else	nNgua3 = "<color=green>OK<color>";	end
	if(n_ngua4 < 1) then	nNgua4 = "<color=white>Kh«ng ®¹t ®iÒu kiÖn<color>";	else	nNgua4 = "<color=green>OK<color>";	end
	if(n_ngua5 < 1) then	nNgua5 = "<color=white>Kh«ng ®¹t ®iÒu kiÖn<color>";	else	nNgua5 = "<color=green>OK<color>";	end
	if(n_ngua6 < 1) then	nNgua6 = "<color=white>Kh«ng ®¹t ®iÒu kiÖn<color>";	else	nNgua6 = "<color=green>OK<color>";	end
	if(n_ngua7 < 1) then	nNgua7 = "<color=white>Kh«ng ®¹t ®iÒu kiÖn<color>";	else	nNgua7 = "<color=green>OK<color>";	end
	if(n_ngua8 < 1) then	nNgua8 = "<color=white>Kh«ng ®¹t ®iÒu kiÖn<color>";	else	nNgua8 = "<color=green>OK<color>";	end
	local levelChar = "";
	local reputeChar = "";	
	if(GetLevel() < 80) then
		levelChar = "<color=white>Ch­a ®ñ cÊp ®é<color>";
	else
		levelChar = "<color=green>§¹t yªu cÇu<color>";
	end
	if (GetRepute() < 500) then
		reputeChar = "<color=white>Kh«ng ®ñ danh väng<color>";
	else
		reputeChar = "<color=green>§¹t yªu cÇu<color>";
	end		
	local moneySz = "";
	local moneyChar = GetCash();
	if (moneyChar < 100000000) then
		moneySz = "<color=white>Ng©n l­îng kh«ng ®ñ<color>";
	else
		moneySz = "<color=green>§¹t yªu cÇu<color>";
	end	
	Describe(DAILAOSU.."Ta chØ kiÓm tra ng­¬i cã ®em ®óng <color=pink>vËt phÈm<color> ta cÇn trong hµnh trang hay kh«ng, ng­¬i h·y xem thªm sè l­îng cÇn thiÕt khi n©ng cÊp\n<color=yellow>- §iÒu kiÖn chung:<color> \n+ CÊp > <color=red>80<color> : "..levelChar.."\n+ Danh väng > <color=red>500<color> : "..reputeChar.."\n+ TiÒn v¹n > <color=red>1000 v¹n<color> : "..moneySz.."\n+ B¾c §Èu thuÇn m· thuËt : "..sz_Bacdau.."\n+ Lam Thñy tinh : "..sz_LamTT.."\n+ Tö Thñy tinh : "..sz_TuTT.."\n+ Lôc Thñy tinh : "..sz_LucTT.."\n<color=yellow>- Ngùa 80:<color>\n+ Tóc S­¬ng : "..nNgua1.."\n<color=yellow>- Ngùa 100:<color>\n+ ¤ V©n : "..nNgua2.."\n+ XÝch Thè : "..nNgua3.."\n+ TuyÖt ¶nh : "..nNgua4.."\n+ §Ých L« : "..nNgua5.."\n+ ChiÕu D¹ : "..nNgua6.."\n<color=yellow>- Ngùa 120:<color>\n+ Phi V©n : "..nNgua7.."\n<color=yellow>- Ngùa 150:<color>\n+ B«n Tiªu : "..nNgua8, 2, "Trë l¹i/timhieunangcapngua","Ta chØ ghÐ qua th«i! T¹m biÖt!/no")
end

function kiemtrachienmahoangkim()
	--Kiem tra xem trong hanh trang co item ko
	local n_ngua1 = CalcItemCount(tbCondition[3][1].tbProp[1], tbCondition[3][1].tbProp[2],tbCondition[3][1].tbProp[3],tbCondition[3][1].tbProp[4],tbCondition[3][1].tbProp[5])
	local n_ngua2 = CalcItemCount(tbCondition[3][2].tbProp[1], tbCondition[3][2].tbProp[2],tbCondition[3][2].tbProp[3],tbCondition[3][2].tbProp[4],tbCondition[3][2].tbProp[5])
	local sz_Bacdau, sz_LamTT, sz_TuTT, sz_LucTT = ""
	local n_Bacdau = CalcItemCount(tbCondition[2][1].tbProp[1], tbCondition[2][1].tbProp[2],tbCondition[2][1].tbProp[3],tbCondition[2][1].tbProp[4],tbCondition[2][1].tbProp[5])
	local n_LamTT = CalcItemCount(tbCondition[2][2].tbProp[1], tbCondition[2][2].tbProp[2],tbCondition[2][2].tbProp[3],tbCondition[2][2].tbProp[4],tbCondition[2][2].tbProp[5])
	local n_TuTT = CalcItemCount(tbCondition[2][3].tbProp[1], tbCondition[2][3].tbProp[2],tbCondition[2][3].tbProp[3],tbCondition[2][3].tbProp[4],tbCondition[2][3].tbProp[5])
	local n_LucTT = CalcItemCount(tbCondition[2][4].tbProp[1], tbCondition[2][4].tbProp[2],tbCondition[2][4].tbProp[3],tbCondition[2][4].tbProp[4],tbCondition[2][4].tbProp[5])	
	if(n_Bacdau < 1) then
		sz_Bacdau = "<color=white>Kh«ng ®¹t ®iÒu kiÖn<color>";
	else
		sz_Bacdau = "<color=green>OK<color>";
	end
	if(n_LamTT < 1) then
		sz_LamTT = "<color=white>Kh«ng ®¹t ®iÒu kiÖn<color>";
	else
		sz_LamTT = "<color=green>OK<color>";
	end
	if(n_TuTT < 1) then
		sz_TuTT = "<color=white>Kh«ng ®¹t ®iÒu kiÖn<color>";
	else
		sz_TuTT = "<color=green>OK<color>";
	end
	if(n_LucTT < 1) then
		sz_LucTT = "<color=white>Kh«ng ®¹t ®iÒu kiÖn<color>";
	else
		sz_LucTT = "<color=green>OK<color>";
	end
	if(n_ngua1 < 1) then	nNgua1 = "<color=white>Kh«ng ®¹t ®iÒu kiÖn<color>";	else	nNgua1 = "<color=green>OK<color>";	end
	if(n_ngua2 < 1) then	nNgua2 = "<color=white>Kh«ng ®¹t ®iÒu kiÖn<color>";	else	nNgua2 = "<color=green>OK<color>";	end
	local levelChar = "";
	local reputeChar = "";	
	if(GetLevel() < 149) then
		levelChar = "<color=white>Ch­a ®ñ cÊp ®é<color>";
	else
		levelChar = "<color=green>§¹t yªu cÇu<color>";
	end
	if (GetRepute() < 5000) then
		reputeChar = "<color=white>Kh«ng ®ñ danh väng<color>";
	else
		reputeChar = "<color=green>§¹t yªu cÇu<color>";
	end		
	local moneySz = "";
	local moneyChar = GetCash();
	if (moneyChar < 100000000) then
		moneySz = "<color=white>Ng©n l­îng kh«ng ®ñ<color>";
	else
		moneySz = "<color=green>§¹t yªu cÇu<color>";
	end
	Describe(DAILAOSU.."Ta chØ kiÓm tra ng­¬i cã ®em ®óng <color=pink>vËt phÈm<color> ta cÇn trong hµnh trang hay kh«ng, ng­¬i h·y xem thªm sè l­îng cÇn thiÕt khi n©ng cÊp\n<color=yellow>- §iÒu kiÖn chung:<color> \n+ CÊp > <color=red>150<color> : "..levelChar.."\n+ Danh väng > <color=red>5000<color> : "..reputeChar.."\n+ TiÒn v¹n > <color=red>10000 v¹n<color> : "..moneySz.."\n+ B¾c §Èu thuÇn m· thuËt : "..sz_Bacdau.."\n+ Lam Thñy tinh : "..sz_LamTT.."\n+ Tö Thñy tinh : "..sz_TuTT.."\n+ Lôc Thñy tinh : "..sz_LucTT.."\n<color=yellow>- ChiÕn m· Hoµng Kim 1:<color>\n+ H·n huyÕt Long C©u : "..nNgua1.."\n<color=yellow>- ChiÕn M· Hoµng Kim 2:<color>\n+ XÝch Long C©u : "..nNgua2, 2, "Trë l¹i/timhieunangcapngua","Ta chØ ghÐ qua th«i! T¹m biÖt!/no")
end
