-- ¤ng chñ tiÒn trang ë thµnh thŞ - Editor by AloneScript (Linh Em)

Include("\\script\\lib\\alonelib.lua");
Include("\\script\\global\\head_qianzhuang.lua") -- Ç®×¯Í·ÎÄ¼ş
IncludeForRegionVer("\\script\\global\\", "gamebank_proc.lua")

function main_proc()
	dofile("script/global/Ç®×¯¹¦ÄÜ.lua");
	if (GetSex() == 0) then
		-- Say("<color=green>¤ng chñ tiÒn trang:<color> VŞ thiÕu hiÖp kia cÇn l·o phu gióp g×?"..Note("tientrang_thanhthi"),2,"§©y cã b¸n bao l× x× kh«ng?/buy_sele","Ta chØ ghĞ qua th«i./no")
		Say("<color=green>¤ng chñ tiÒn trang:<color> VŞ thiÕu hiÖp kia cÇn l·o phu gióp g×?"..Note("tientrang_thanhthi"),1,"Ta chØ ghĞ qua th«i./no")
	else
		-- Say("<color=green>¤ng chñ tiÒn trang:<color> VŞ c« n­¬ng kia cÇn l·o phu gióp g×?"..Note("tientrang_thanhthi"),2,"§©y cã b¸n bao l× x× kh«ng?/buy_sele","Ta chØ ghĞ qua th«i./no")
		Say("<color=green>¤ng chñ tiÒn trang:<color> VŞ c« n­¬ng kia cÇn l·o phu gióp g×?"..Note("tientrang_thanhthi"),1,"Ta chØ ghĞ qua th«i./no")
	end
end
------------ ¢òºì°ü ---------------------
function buy_sele()
	Say("§­îc ®­îc, chç nµy ®óng lµ cã b¸n bao l× x×, tiÓu hång bao 10v, ®¹i hång bao 100v.\n§Æc biÖt cã <color=green>Hång bao nh­ ı vµ Hång bao mõng thä<color>. \nNg­¬i muèn mua lo¹i nµo ? ",5,"TiÓu hång bao/buy1","§¹i hång bao /buy2","Hång bao nh­ ı /buy3","Hång bao mõng thä /hesui_hongbao","Kh«ng mua n÷a./no")
	--Say("§­îc ®­îc, chç nµy ®óng lµ cã b¸n bao l× x×, tiÓu hång bao 1v, ®¹i hång bao 10v, ng­êi muèn mua lo¹i nµo ? ",3,"Mua tiÓu hång bao/buy1","Mua ®¹i hång bao/buy2","Kh«ng mua n÷a./no")
end

function buy1()
	if (GetCash() >= 100000) then
		Pay(100000)
		AddItem(6,1,14,1,0,0,0)
		Talk(1,"","¤ng chñ tiÒn trang: §©y lµ TiÓu hång bao cña ng­¬i, xin h·y cÇm lÊy!")
	else
		Talk(1,"","¤ng chñ tiÒn trang: H©y dµ! Ng­¬i kh«ng cã ®ñ tiÒn råi!")
	end
end

function buy2()
	if (GetCash() >= 1000000) then
		Pay(1000000)
		AddItem(6,1,13,1,0,0,0)
		Talk(1,"","¤ng chñ tiÒn trang: §©y lµ §¹i hång bao cña ng­¬i, xin h·y cÇm lÊy!")
	else
		Talk(1,"","¤ng chñ tiÒn trang: H©y dµ! Ng­¬i kh«ng cã ®ñ tiÒn råi!")
	end
end

function buy3()
	if (GetCash() >= 10000000) then
		Pay(10000000)
		AddItem(6,1,13,1,0,0,0)
		Talk(1,"","¤ng chñ tiÒn trang: §©y lµ §¹i hång bao cña ng­¬i, xin h·y cÇm lÊy!")
	else
		Talk(1,"","¤ng chñ tiÒn trang: H©y dµ! Ng­¬i kh«ng cã ®ñ tiÒn råi!")
	end
end

function no()
end
