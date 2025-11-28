-- ÎÄ¼şÃû¡¡£ºjinengmiji_90.lua
-- ´´½¨Õß¡¡£ºwangjingjun
-- ÄÚÈİ¡¡¡¡£º¸÷ÃÅÅÉµÄÃØ¼®£¬ ¿ÉÒÔÑ§Ï°90¼¶¼¼ÄÜ
-- ´´½¨Ê±¼ä£º2011-07-12 15:59:01

Include("\\script\\dailogsys\\dailogsay.lua")
--£¨ÉÙÁÖ0 ÌìÍõ1  ÌÆÃÅ2  Îå¶¾3   ¶ëÃ¼4  ´äÑÌ5   Ø¤°ï6   ÌìÈÌ7   Îäµ±8   À¥ÂØ9£©
sbook_list =
{	-- ¸ñÊ½£º{¼¼ÄÜID, ¼¼ÄÜµÈ¼¶, °ïÅÉID, ËùĞè¼¶±ğ, ¼¼ÄÜÊéÃû³Æ, ¼¼ÄÜÃû³Æ}
	[4040] = {	
		{1220, 20, 0, 150, "ThiÕu L©m MËt TŞch", "ThiÕu L©m ThÊt TruyÒn - Kim Quyªn La H¸n"},
	},
	[4039] = {	
		{1221, 20, 1, 150, "Thiªn V­¬ng MËt TŞch", "Thiªn V­¬ng ThÊt TruyÒn - Chinh ChiÕn B¸t Ph­¬ng"},
	},
	[4041] = {	 
		{1223, 20, 2, 150, "§­êng M«n MËt TŞch ", "§­êng M«n ThÊt TruyÒn - HÊp Tinh TrËn"},
	},
	[4042] = {	 
		{1222, 20, 3, 150, "Ngò §éc MËt TŞch", "Ngò §éc ThÊt TruyÒn - S©m La §éc H¶i"},
	},
	[4043] = {	 
		{1224, 20, 4, 150, "Nga Mi MËt TŞch", "Nga My ThÊt TruyÒn - Ba La T©m Kinh"},
	},
	[4044] = {	 
		{1225, 20, 5, 150, "Thóy Yªn MËt TŞch", "Thóy Yªn ThÊt TruyÒn - HuyÒn B¨ng V« Tøc"},
	},
	[4045] = {	 
		{1227, 20, 6, 150, "C¸i Bang MËt TŞch", "C¸i Bang ThÊt TruyÒn - ¤ Y QuyÕt"},
	},
	[4046] = {	 
		{1226, 20, 7, 150, "Thiªn NhÉn MËt TŞch", "Thiªn NhÉn ThÊt TruyÒn - LiÖt Háa PhÉn Thiªn"},
	},
	[4047] = {	 
		{1228, 20, 8, 150, "Vâ §ang MËt TŞch ", "Vâ §ang ThÊt TruyÒn - Ch©n Vò ThÊt TiÖt"},
	},
	[4048] = {	 
		{1229, 20, 9, 150, "C«n L«n MËt TŞch", "C«n L«n ThÊt TruyÒn - Thiªn C­¬ng KhÊt Kİnh"},
	},
}

function LearnSkillByBook(index, list, nItemIndex, nPlayerIndex)

	if(GetLastFactionNumber() ~= list[index][3]) then							-- ²»ÊÇÖ¸¶¨ÃÅÅÉ
		Msg2Player("B¹n cÇm lÊy "..list[index][5].."Nghiªn cøu c¶ nöa ngµy, kÕt qu¶ còng kh«ng lÜnh ngé ®­îc g× ")
		return 1
	end
	if(GetLevel() < list[index][4]) then							-- µ«Î´µ½Ö¸¶¨¼¶±ğ
		Msg2Player("B¹n cÇm lÊy "..list[index][5].."Nghiªn cøu c¶ nöa ngµy, kÕt qu¶ lÜnh ngé rÊt İt. ")
		return 1
	end
	if(HaveMagic(list[index][1]) ~= -1) then							-- ÒÑÑ§¹ı¸Ã¼¼ÄÜ
		Msg2Player("B¹n ®· cÇm "..list[index][5].."NghiÒn tíi ngÉm lui, nh­ng còng kh«ng häc ®­îc g× trong ®ã ")
		return 1
	end
	
	-- ÅĞ¶Ïµ±Ç°µÄÎïÆ·ÊÇ·ñÎªÉÙÁÖÃØ¼®£¬ÊÇÔòÏÈÉ¾³ı£¬ºóÔö¼Ó¼¼ÄÜ
	if CallPlayerFunction(nPlayerIndex, IsMyItem, nItemIndex) ~= 1 then
		return 
	end
	if CallPlayerFunction(nPlayerIndex, RemoveItemByIndex, nItemIndex) ~= 1 then
		WriteLog("Hñy Bá ThiÕu L©m MËt TŞch thÊt b¹i")
		return 
	end
	
	AddMagic(list[index][1], list[index][2])										-- Ñ§»á¼¼ÄÜ

	WriteLog(date("%H%M%S")..": Tµi kho¶n:"..GetAccount()..", nh©n vËt:"..GetName()..", Sö dông: "..list[index][5].."§· häc ®­îc: "..list[index][6]);
	Msg2Player("§· häc ®­îc kü n¨ng "..list[index][6].."'. ")
	return 0
end

function selectskill(list, nItemIndex, nPlayerIndex)
	local szTitle = "§¹i hiÖp muèn häc lo¹i kü n¨ng nµo"
	local tbOpt = {}
	for index,v in list do
		tinsert(tbOpt, {v[6], LearnSkillByBook, {index, list, nItemIndex, PlayerIndex}})
	end
	tinsert(tbOpt, {"§Ó ta suy nghÜ l¹i", cancel})
	CreateNewSayEx(szTitle, tbOpt)
end

function main(nItemIndex)
	Genre, DetailType, Particular=GetItemProp(nItemIndex)
	selectskill(sbook_list[Particular], nItemIndex, PlayerIndex)
	return 1
end
