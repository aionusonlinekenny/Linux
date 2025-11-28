Include("\\script\\global\\login_head.lua")
function main(nItemIdx)
dofile("script/item/goldbag.lua")
local nDate = tonumber(GetLocalDate("%d"))
if ( GetTask(DAY) ~= nDate ) then
		SetTask(DAY, nDate);
		SetTask(352,0);
	if (GetTask(352) <= 50) then
local k = random(1,200)
SetTask(352,GetTask(352) + 1)
		if (k <= 2) then 
	AddStackItem(1,4,417,1,1,0,0,0)
	AddGlobalNews("§¹i hiÖp <color=green>"..GetName().."<color> më tói Hoµng Kim , may m¾n nhËn ®­îc <color=gold>TiÒn §ång<color> !")
	Msg2Player("Më cÈm nang Hoµng Kim, nhËn ®­îc  TiÒn §ång")
		elseif (k >= 60) and (k <= 62) then
	AddEventItem(343)
	AddGlobalNews("§¹i hiÖp <color=green>"..GetName().."<color> më tói Hoµng Kim , may m¾n nhËn ®­îc <color=gold>Kim Nguyªn B¶o<color> !")
	Msg2Player("Më cÈm nang Hoµng Kim, nhËn ®­îc  Kim Nguyªn B¶o")
		elseif (k >= 161) then
		local x = random(1,12)
			if x == 2 then
 	AddEventItem(238)
	AddGlobalNews("§¹i hiÖp <color=green>"..GetName().."<color> më tói Hoµng Kim , may m¾n nhËn ®­îc <color=green>Thñy Tinh<color> !")
	Msg2Player("Më cÈm nang Hoµng Kim, nhËn ®­îc  Thñy Tinh")
			elseif x == 4 then
	AddEventItem(239)
	AddGlobalNews("§¹i hiÖp <color=green>"..GetName().."<color> më tói Hoµng Kim , may m¾n nhËn ®­îc <color=green>Thñy Tinh<color> !")
	Msg2Player("Më cÈm nang Hoµng Kim, nhËn ®­îc  Thñy Tinh")
			elseif x == 6 then
	AddEventItem(240)
	AddGlobalNews("§¹i hiÖp <color=green>"..GetName().."<color> më tói Hoµng Kim , may m¾n nhËn ®­îc <color=green>Thñy Tinh<color> !")
	Msg2Player("Më cÈm nang Hoµng Kim, nhËn ®­îc  Thñy Tinh")
			elseif (x == 1) or (x == 7) or (x == 8) then
	AddEventItem(353)
	AddGlobalNews("§¹i hiÖp <color=green>"..GetName().."<color> më tói Hoµng Kim , may m¾n nhËn ®­îc <color=green>Tinh Hång B¶o Th¹ch<color> !")
	Msg2Player("Më cÈm nang Hoµng Kim, nhËn ®­îc  Tinh Hång B¶o Th¹ch")
			elseif (x == 9) or (x == 10) or (x == 11) then
	local p = random(122,124)
	AddItem(6,1,p,1,1,1)
	AddGlobalNews("§¹i hiÖp <color=green>"..GetName().."<color> më tói Hoµng Kim , may m¾n nhËn ®­îc <color=pink>Phóc Duyªn Lé<color> !")
	Msg2Player("Më cÈm nang Hoµng Kim, nhËn ®­îc  Phóc Duyªn Lé")
			elseif (x == 3) or (x == 12) then
	AddItem(6,1,26,1,1,1)	
	AddGlobalNews("§¹i hiÖp <color=green>"..GetName().."<color> më tói Hoµng Kim , may m¾n nhËn ®­îc <color=gold>Vâ L©m MËt TÞch<color> !")
	Msg2Player("Më cÈm nang Hoµng Kim, nhËn ®­îc  Vâ L©m MËt TÞch")
			else
	AddItem(6,1,22,1,1,1)	
	AddGlobalNews("§¹i hiÖp <color=green>"..GetName().."<color> më tói Hoµng Kim , may m¾n nhËn ®­îc <color=gold>TÈy Tñy Kinh<color> !")
	Msg2Player("Më cÈm nang Hoµng Kim, nhËn ®­îc  TÈy Tñy Kinh")
			end
		elseif (k >=63) and (k <= 160) then
	local m = random (5,45)
	n = GetLevel()
	AddOwnExp(n*m*30)
		else
	local m = random (5,45)
	n = GetLevel()
	Earn(n*m*5)
		end
	else
	Talk(1,"","<color=green>H«m nay ®· më ®ñ 50 C¶m nang Hoµng Kim råi, ngµy mai h·y më tiÕp<color>")
	end
	
else	--Sau khi da set ngay

if (GetTask(352) <= 50) then
local k = random(1,200)
SetTask(352,GetTask(352) + 1)
		if (k <= 2) then 
	AddStackItem(1,4,417,1,1,0,0,0)
	AddGlobalNews("§¹i hiÖp <color=green>"..GetName().."<color> më tói Hoµng Kim , may m¾n nhËn ®­îc <color=gold>TiÒn §ång<color> !")
	Msg2Player("Më cÈm nang Hoµng Kim, nhËn ®­îc  TiÒn §ång")
		elseif (k >= 60) and (k <= 62) then
	AddEventItem(343)
	AddGlobalNews("§¹i hiÖp <color=green>"..GetName().."<color> më tói Hoµng Kim , may m¾n nhËn ®­îc <color=gold>Kim Nguyªn B¶o<color> !")
	Msg2Player("Më cÈm nang Hoµng Kim, nhËn ®­îc  Kim Nguyªn B¶o")
		elseif (k >= 191) then
		local x = random(1,12)
			if x == 2 then
 	AddEventItem(238)
	AddGlobalNews("§¹i hiÖp <color=green>"..GetName().."<color> më tói Hoµng Kim , may m¾n nhËn ®­îc <color=green>Thñy Tinh<color> !")
	Msg2Player("Më cÈm nang Hoµng Kim, nhËn ®­îc  Thñy Tinh")
			elseif x == 4 then
	AddEventItem(239)
	AddGlobalNews("§¹i hiÖp <color=green>"..GetName().."<color> më tói Hoµng Kim , may m¾n nhËn ®­îc <color=green>Thñy Tinh<color> !")
	Msg2Player("Më cÈm nang Hoµng Kim, nhËn ®­îc  Thñy Tinh")
			elseif x == 6 then
	AddEventItem(240)
	AddGlobalNews("§¹i hiÖp <color=green>"..GetName().."<color> më tói Hoµng Kim , may m¾n nhËn ®­îc <color=green>Thñy Tinh<color> !")
	Msg2Player("Më cÈm nang Hoµng Kim, nhËn ®­îc  Thñy Tinh")
			elseif (x == 1) or (x == 7) or (x == 8) then
	AddEventItem(353)
	AddGlobalNews("§¹i hiÖp <color=green>"..GetName().."<color> më tói Hoµng Kim , may m¾n nhËn ®­îc <color=green>Tinh Hång B¶o Th¹ch<color> !")
	Msg2Player("Më cÈm nang Hoµng Kim, nhËn ®­îc  Tinh Hång B¶o Th¹ch")
			elseif (x == 9) or (x == 10) or (x == 11) then
	local p = random(122,124)
	AddItem(6,1,p,1,1,1)
	AddGlobalNews("§¹i hiÖp <color=green>"..GetName().."<color> më tói Hoµng Kim , may m¾n nhËn ®­îc <color=pink>Phóc Duyªn Lé<color> !")
	Msg2Player("Më cÈm nang Hoµng Kim, nhËn ®­îc  Phóc Duyªn Lé")
			elseif (x == 3) or (x == 12) then
	AddItem(6,1,26,1,1,1)	
	AddGlobalNews("§¹i hiÖp <color=green>"..GetName().."<color> më tói Hoµng Kim , may m¾n nhËn ®­îc <color=gold>Vâ L©m MËt TÞch<color> !")
	Msg2Player("Më cÈm nang Hoµng Kim, nhËn ®­îc  Vâ L©m MËt TÞch")
			else
	AddItem(6,1,22,1,1,1)	
	AddGlobalNews("§¹i hiÖp <color=green>"..GetName().."<color> më tói Hoµng Kim , may m¾n nhËn ®­îc <color=gold>TÈy Tñy Kinh<color> !")
	Msg2Player("Më cÈm nang Hoµng Kim, nhËn ®­îc  TÈy Tñy Kinh")
			end
		elseif (k >=63) and (k <= 190) then
	local m = random (5,45)
	n = GetLevel()
	AddOwnExp(n*m*30)
		else
	local m = random (5,45)
	n = GetLevel()
	Earn(n*m*5)
		end
	else
	Talk(1,"","<color=green>H«m nay ®· më ®ñ 50 C¶m nang Hoµng Kim råi, ngµy mai h·y më tiÕp<color>")
	end

end
end 