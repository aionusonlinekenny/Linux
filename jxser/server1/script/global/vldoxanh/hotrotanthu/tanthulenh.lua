IncludeLib("SETTING")
IncludeLib("ITEM");
IncludeLib("FILESYS")
Include("\\script\\task\\system\\task_string.lua")
Include("\\script\\global\\titlefuncs.lua")
Include("\\script\\global\\judgeoffline.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\global\\fuyuan.lua")
Include("\\script\\missions\\leaguematch\\npc\\officer.lua")
IncludeLib("LEAGUE");
Include("\\script\\global\\skills_table.lua")
Include("\\script\\task\\lv120skill\\head.lua")
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\misc\\daiyitoushi\\toushi_function.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\item\\ib\\shenxingfu.lua")
Include("\\script\\global\\findboss.lua") 
Include("\\script\\global\\fuyuan.lua")
Include("\\script\\global\\translife.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\missions\\leaguematch\\npc\\officer.lua")
Include("\\script\\global\\vldoxanh\\hotrotanthu\\hotroitem.lua")
Include("\\script\\global\\vldoxanh\\hotrotanthu\\hotropgaming.lua")
Include("\\script\\bonusvlmc\\fucmain.lua")
Include("\\script\\global\\kenny.lua")
TITLEDIALOG = "Tªn nh©n vËt : <color=green>%s<color>\n".."Tªn tµi kho¶n: <color=green>%s<color>\n".."Täa ®é       : <color=green>%d, %d/%d<color>\n\n".."Chµo mõng b¹n tham gia<color=red> Vâ l©m §å Xanh<color><enter>§­îc Edit bëi<color=green> Kenny NguyÔn<color><enter>Mäi chi tiÕt xin vui lßng liªn hÖ:<color=blue> www.vldoxanh.com<color><enter>SÏ nhËn ®­îc hç trî khi cÇn thiÕt."

function main()
dofile("script/global/pgaming/hotrotanthu/tanthulenh.lua")
local nW,nX,nY = GetWorldPos()
		local szTitle =  "Chµo mõng <color=green>"..GetName().."<color> tham gia<color=red> Vâ l©m §å Xanh<color><enter>§­îc Edit bëi<color=green> Kenny NguyÔn<color><enter>Mäi chi tiÕt xin vui lßng liªn hÖ:<color=green> www.vldoxanh.com<color><enter>SÏ nhËn ®­îc hç trî khi cÇn thiÕt.\n\n<pic=138> Online    : <color=green>"..GetPlayerCount().."<color>\nTäa ®é       : <color=green>"..nW..","..nX..","..nY.."<color>"
		local tbOpt =
	{
			
		{"NhËn th­ëng theo cÊp", top10all},
		{"NhËn th­ëng theo giêi ch¬i Online",tichluy},
		{"NhËn hç trî Skill 9x - 12x",HoTroSkill},
		{"Hñy vËt phÈm",DisposeItem},
		{"Gi¶i kÑt nh©n vËt",giaiket},
		{"Tho¸t"},
	}
		CreateNewSayEx(szTitle,tbOpt)	
	return 1				
end
function giaiket() 
w,x,y=GetWorldPos() 
if (w~=53) then 
SetFightState(0) 
NewWorld(53,200*8,200*16) 
else 
SetPos(200*8, 200*16) 
end 
Msg2Player("B¹n di chuyÓn vÒ <color=yellow>Ba L¨ng HuyÖn<color> thµnh c«ng."); 
end 
function lebao()
dofile("script/global/pgaming/hotrotanthu/tanthulenh.lua")	
		if GetTask(3010) == 1 then
			Talk(1, "", "C¸c h¹ ®· nhËn phÇn th­ëng nµy råi mµ");
			return
		end
		local tbAwardItem = {szName = "LÔ bao t©n thñ", tbProp = {6, 1, 4258, 1,0,0}, nCount = 1, nExpiredTime = 150080, nBindState = -2}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "NhËn ®­îc LÔ bao t©n thñ");
		SetTask(3010,1)
end
function top10all()
dofile("script/global/pgaming/hotrotanthu/duatop.lua");	
	duatop()
end
function DisposeItem()
GiveItemUI("Hñy vËt phÈm", "§¹i hiÖp h·y cÈn träng trong viÖc hñy vËt phÈm, vËt phÈm ®· hñy kh«ng thÓ lÊy l¹i ®­îc!", "DisposeConfirm", "onCancel", 1);
end

function DisposeConfirm(nCount)
	for i=1, nCount do
		local nItemIndex = GetGiveItemUnit(i)
		local strItem = GetItemName(nItemIndex)
		RemoveItemByIndex(nItemIndex)
		WriteLog(date("%Y%m%d %H%M%S").."\t".." GM Hñy Item "..GetAccount().."\t"..GetName().."\t".." Huû item "..strItem)
	end--for
	Msg2Player("Thao t¸c hñy vËt phÈm thµnh c«ng")
	Talk(1, "", "Thao t¸c thµnh c«ng, kiÓm tra l¹i!");	
end

function tichluy()
	local nW,nX,nY = GetWorldPos()
	local szTitle =  "Chµo mõng <color=green>"..GetName().."<color> tham gia<color=red> Vâ l©m §å Xanh<color><enter>§­îc Edit bëi<color=green> Kenny NguyÔn<color><enter>Mäi chi tiÕt xin vui lßng liªn hÖ:<color=green> www.vldoxanh.com<color><enter>SÏ nhËn ®­îc hç trî khi cÇn thiÕt.\n\n<pic=138> Online    : <color=green>"..GetPlayerCount().."<color>\nTäa ®é       : <color=green>"..nW..","..nX..","..nY.."<color>"		local tbOpt =
	{
		{"NhËn th­ëng phóc duyªn", phucduyen},	
		{"NhËn th­ëng danh väng", danhvong},
		{"NhËn th­ëng tiªn th¶o lé",tienthaolo},
		{"Tho¸t"},
	}
		CreateNewSayEx(szTitle,tbOpt)					
end

function phucduyen()
OnGain_Self()	
end
function danhvong()
W33_prise()		
end
function tienthaolo()
if (GetGameTime()  >= 7200) then

		local tbAwardItem ={szName = "Tiªn th¶o lé", tbProp = {6, 1, 71, 1,0,0}, nCount = 5, nExpiredTime = 10080, nBindState = -2}
		tbAwardTemplet:GiveAwardByList(tbAwardItem, "Chóc mõng ®¹i hiÖp nhËn 5 b×nh Tiªn Th¶o Lé");

else

	Say("C¸c h¹ hµnh tÈu giang hå ch­a ®ñ.",0)

end

end

function nhiemvu()
VLMC_main()		
end	