--Script: Hoan Binh Tong Hop
--Thuc Hien Boi: Leon
--Duoc Share Tai: Héi Qu¸n Vâ L©m Offline

Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\progressbar.lua")

function myplayersex()
if GetSex() == 1 then return "N÷ hiÖp"; else return "§¹i hiÖp"; end
end
-----------------------------------------------
function nangcapdoxanh()
	dofile("script/item/doxanh/nangcapdoxanh.lua")
		local tbOpt = {
		{"N©ng cÊp x3",reroll,{3}},
		{"Ho¸n Binh",reroll,{2}},
		{"Reroll Thuéc TÝnh",reroll,{1}},
		{"KÕt Thóc §èi Tho¹i",No},
	}
	CreateNewSayEx("<color=green>Chøc N¨ng Reroll thuéc tÝnh trang bÞ!!!<color>", tbOpt)
end

NGUYENLIEU = {
	[1] = {nXu = 10, nDa = 20, nTienVan = 10000 * 5},
	[2] = { nXu = 10, nDa = 50, nTienVan = 1000000* 1},
	[3] = { nXu = 1, nDa = 1, nTienVan = 1000* 1},
}

IdVatPham1 = 417
TenVatPham1 = "TiÒn §ång"
IdVatPham2 = 4868
TenVatPham2 = "Kim Th¹ch"

function reroll(nValue)
	SetTaskTemp(101,nValue)
	local nTienVan = NGUYENLIEU[nValue].nTienVan;
	local nXu = NGUYENLIEU[nValue].nXu;
	local nDa = NGUYENLIEU[nValue].nDa;
	GiveItemUI("Xin bá trang bÞ vµo «", "\n<+> "..TenVatPham1..": "..nXu.."\n<+> "..TenVatPham2..": "..nDa.."\n<+> TiÒn V¹n: "..nTienVan.."", "confirm","cancel",1);
end

function confirm(nCount)
	nValue = GetTaskTemp(101)
	local nTienVan = NGUYENLIEU[nValue].nTienVan;
	local nXu = NGUYENLIEU[nValue].nXu;
	local nDa = NGUYENLIEU[nValue].nDa;
	local nTienDong = CalcEquiproomItemCount(4,IdVatPham1,1,1)
	local nXKC = CalcItemCount(3,6,1,IdVatPham2,-1) ;
	if  (nTienDong < nXu) then Say(""..myplayersex().." mang thiÕu <color=red>"..nXu.."<color> "..TenVatPham1.."!") return end 
	if  (nXKC < nDa) then Say(""..myplayersex().." mang thiÕu <color=red>"..nDa.."<color> "..TenVatPham2.."!") return end 
	if  (GetCash() < nTienVan) then Say(""..myplayersex().." mang thiÕu <color=red>"..nTienVan.."<color> l­îng!") return end
	for i = 1, nCount do				
		local nItemIndex = GetGiveItemUnit(i)
		local nQuality = GetItemQuality(nItemIndex)
		local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp(nItemIndex)
		local arynMagLvl = GetItemAllParams(nItemIndex)
		for j = 1, 6 do	
		local nOpt = GetItemMagicAttrib(nItemIndex, j)
	if (nCount ~= 1)  then Talk(1, "", ""..myplayersex().." chØ cÇn bá <color=red>"..GetItemName(nItemIndex).."<color> vµo lµ ®­îc!\nnh÷ng thø kh¸c ta sÏ trõ trong hµnh trang...!"); return end
	if (nLevel < 10) then Talk (1,"","ChØ cã thÓ thùc hiÖn trªn trang bÞ xanh cÊp <color=red>10") return end
	if (nQuality ~= 0) then Talk (1,"","ChØ cã thÓ thùc hiÖn trªn <color=blue>Trang BÞ Xanh") return end
	--if (nOpt < 6) then Talk(1,"","ChØ cã thÓ thùc hiÖn trªn <color=blue>Trang BÞ Xanh - 6 Dßng") return end
		end
			if nValue == 1 then
			tbProgressBar.tbConfig[1].nTime = 4
			tbProgressBar.tbConfig[1].szTitle = "§ang Xö Lý..."
			tbProgressBar:OpenByConfig(1, _confirm, {nCount}, OnBreak)
			elseif nValue == 2 then
			if nDetailType >= 2 then Talk(1,"","Trang bÞ ng­¬i bá vµo kh«ng ph¶i lµ <color=red>Vò KhÝ<color>!!!") return end
			tbProgressBar.tbConfig[1].nTime = 4
			tbProgressBar.tbConfig[1].szTitle = "§ang Xö Lý..."
			tbProgressBar:OpenByConfig(1, _confirm, {nCount}, OnBreak)

			elseif nValue == 3 then
			tbProgressBar.tbConfig[1].nTime = 4
			tbProgressBar.tbConfig[1].szTitle = "§ang Xö Lý..."
			tbProgressBar:OpenByConfig(1, _confirm, {nCount}, OnBreak)
			end
	end
end


function _confirm(nCount)
	nValue = GetTaskTemp(101)
	local nTienVan = NGUYENLIEU[nValue].nTienVan;
	local nXu = NGUYENLIEU[nValue].nXu;
	local nDa = NGUYENLIEU[nValue].nDa;
		for i = 1, nCount do				
			local nItemIndex = GetGiveItemUnit(i)
			local nEquipVer = ITEM_GetItemVersion(nItemIndex)
			local nQuality = GetItemQuality(nItemIndex)
			local nEquipRandSeed = ITEM_GetItemRandSeed(nItemIndex)
			local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp(nItemIndex)
			local arynMagLvl = GetItemAllParams(nItemIndex)			
				-----------------------------------Xoa Vat Pham--------------------------------
				RemoveItemByIndex(nItemIndex)
				ConsumeEquiproomItem(nXu,4,IdVatPham1,1,1) ; 
				ConsumeEquiproomItem(nDa,6,1,IdVatPham2,-1);
				Pay(nTienVan);
				---------------------Them Vat Pham Moi--------------------------------
				if nValue == 1 then
						local ItemIndex = AddItemEx(nEquipVer,0,nQuality,nGenre,nDetailType,nParticular,nLevel,nSeries,nLuck,arynMagLvl[1],arynMagLvl[2],arynMagLvl[3],arynMagLvl[4],arynMagLvl[5],arynMagLvl[6])
						local msg = format("<color=yellow>Chóc mõng "..myplayersex().." <color=green>%s<color> ®· reroll thuéc tÝnh trang bÞ <color=blue><%s><color> thµnh c«ng. <pic=7>" ,GetName(), GetItemName(ItemIndex) )
						Msg2SubWorld(msg) 
				elseif nValue == 2 then
					i = random (1,100)
					if i < 31 then
					local ItemName = AddItemEx(nEquipVer,nEquipRandSeed,nQuality,nGenre,0,random(0,8),nLevel,nSeries,nLuck,arynMagLvl[1],arynMagLvl[2],arynMagLvl[3],arynMagLvl[4],arynMagLvl[5],arynMagLvl[6])
					local msg = format("<color=yellow>Chóc mõng "..myplayersex().." <color=green>%s<color> ®· Ho¸n Binh thµnh c«ng <color=gold><%s><color>." ,GetName(), GetItemName(ItemName) )
					Msg2SubWorld(msg)
					elseif i < 61 then
					local ItemName = AddItemEx(nEquipVer,nEquipRandSeed,nQuality,nGenre,1,random(0,2),nLevel,nSeries,nLuck,arynMagLvl[1],arynMagLvl[2],arynMagLvl[3],arynMagLvl[4],arynMagLvl[5],arynMagLvl[6])
					local msg = format("<color=yellow>Chóc mõng "..myplayersex().." <color=green>%s<color> ®· Ho¸n Binh thµnh c«ng <color=gold><%s><color>." ,GetName(), GetItemName(ItemName) )
					Msg2SubWorld(msg)
					else
					AddItemEx(nEquipVer,nEquipRandSeed,nQuality,nGenre,nDetailType,nParticular,nLevel,nSeries,nLuck,arynMagLvl[1],arynMagLvl[2],arynMagLvl[3],arynMagLvl[4],arynMagLvl[5],arynMagLvl[6])
					Msg2Player("Ho¸n Binh ThÊt B¹i")
					end
				elseif nValue == 3 then
				Msg2Player("Dßng 1: "..arynMagLvl[1])
 				Msg2Player("Dßng 2: "..arynMagLvl[2])
				Msg2Player("Dßng 3: "..arynMagLvl[3])
				Msg2Player("Dßng 4: "..arynMagLvl[4])
				Msg2Player("Dßng 5: "..arynMagLvl[5])
				Msg2Player("Dßng 6: "..arynMagLvl[6])
				end
			end	
end


function OnBreak()
	Msg2Player("Thao T¸c BÞ Hñy, Xin Thö L¹i!")
end
-----------------------------------------------------------------------------------------------
