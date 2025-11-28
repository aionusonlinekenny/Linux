Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_event\\ngusackettinh\\head.lua")
Include("\\script\\vng_event\\ngusackettinh\\item\\star_head.lua")

TSK_USED = 5019	-- ÈÎÎñ±äÁ¿´u¶¨
--1 ngµy dc sö dông 5 lÇn vËt phÈm Tiªn Linh §¬n - Modified by DinhHQ - 20111013
NDAILYTIME = 10

tbNSKT_star_happiness = {}

function main()
	

	if(tbNSKT_Item_Star:checkCondition() == 0)then
		Talk(1, "", "B¹n kh«ng ®ñ ®iÒu kiÖn sö dông vËt phÈm! Yªu cÇu cÊp ®é trªn 50 ")
		return 1
	end
	
	local tbAward = {
		{nExp_tl=1,nCount = 500000,},
		}
	local szFailMsg = format("Mçi ngµy mçi nh©n vËt chØ cã thÓ sö dông nhiÒu nhÊt   %d Ph¸o Hoa Mõng Xu©n, ®îi ngµy mai h·y sö dông tiÕp",NDAILYTIME)	
	if PlayerFunLib:CheckTaskDaily(TSK_USED, NDAILYTIME, szFailMsg, "<") == 1 then
		PlayerFunLib:AddTaskDaily(TSK_USED, 1) 
		tbAwardTemplet:Give(tbAward, 1, {"ngusackettinh", "use_star_happiness"} )
		CastSkill(1175, 2)
		return 0
	end
	
	
	return 1
end