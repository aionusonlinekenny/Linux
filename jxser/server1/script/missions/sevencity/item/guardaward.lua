-- ÎÀÖùÀñ°üÊ¹ÓÃ½Å±¾
Include("\\script\\lib\\awardtemplet.lua")

--Giíi h¹n ®iÓm kinh nghiÖm mçi ngµy lµ 50triÖu khi sö dông c¸c lo¹i b¶o r­¬ng -vu tru le bao
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")

tbAward = {
	{szName="§iÓm kinh nghiÖm 1", 
				pFun = function (tbItem, nItemCount, szLogTitle)
					%tbvng_ChestExpAward:ExpAward(2000000, "C«ng Thµnh LÔ Bao (míi)")
				end,
				nRate = 1,
	},
	{szName="CÈm Nang Thay §æi Trêi §Êt", tbProp={6,1,1781,1,0,0}, tbParam={60}, nRate=31.5},
	{szName="ThÎ Hoµng Kim", tbProp={6,1,4654,1,0,0}, nRate=2},
	{szName="LÖnh Bµi Thñy TÆc", tbProp={6,1,4659,1,0,0}, nRate=5},
	{szName="B¶o R­¬ng V« Danh", tbProp={6,1,4663,1,0,0}, nRate=0.5},
	{szName="B¶o R­¬ng Vinh DiÖu", tbProp={6,1,4662,1,0,0}, nRate=0.5},
	{szName="LÖnh Bµi ChiÕn M·", tbProp={6,1,4664,1,0,0}, nRate=5},
	{szName="Ch×a Khãa Hoµng Kim", tbProp={6,1,4650,1,0,0}, nRate=2, nExpiredTime=20160},
	{szName="Thiªn V­¬ng Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4664,1,0,0}, nRate=5, nExpiredTime=10080},
	{szName="Ngò §éc Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4664,1,0,0}, nRate=5, nExpiredTime=10080},
	{szName="Thóy Yªn Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4664,1,0,0}, nRate=5, nExpiredTime=10080},
	{szName="C«n L«n Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4664,1,0,0}, nRate=5, nExpiredTime=10080},
	{szName="Thiªn NhÉn Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4664,1,0,0}, nRate=5, nExpiredTime=10080},
	{szName="ThiÕu L©m Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4664,1,0,0}, nRate=5, nExpiredTime=10080},
	{szName="§­êng M«n Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4664,1,0,0}, nRate=5, nExpiredTime=10080},
	{szName="Nga Mi Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4664,1,0,0}, nRate=5, nExpiredTime=10080},
	{szName="Vâ §ang Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4664,1,0,0}, nRate=5, nExpiredTime=10080},
	{szName="C¸i Bang Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4664,1,0,0}, nRate=5, nExpiredTime=10080},
	{szName="M· Bµi-Siªu Quang", tbProp={6,1,3483,1,0,0}, nRate=0.5, nExpiredTime=43200},
	{szName="M· bµi - B«n Tiªu", tbProp={6,1,4664,1,0,0}, nRate=1, nExpiredTime=43200},
	{szName="M· bµi - Phiªn Vò", tbProp={6,1,4664,1,0,0}, nRate=1, nExpiredTime=43200},	
	
}

function main()
	if (CalcFreeItemCellCount() < 1) then
		Say("Hµnh trang Ýt nhÊt ph¶i cã <color=red>1<color> « trèng míi nhËn ®­îc phÇn th­ëng.")
		return 1
	end
	tbAwardTemplet:Give(tbAward, 1, {"SEVENCITY", "UseGuardAward"})
	return 0
end

function test()
	local rate = 0
	for i = 1, getn(tbAward) do
		rate = rate + tbAward[i].nRate
	end
	if (floor(rate) ~= 100) then
		error(format("invalid rate: %d", rate))
	end
end

