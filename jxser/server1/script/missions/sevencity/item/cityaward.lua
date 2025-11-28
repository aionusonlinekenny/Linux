-- ¹¥³ÇÀñ°üÊ¹ÓÃ½Å±¾
Include("\\script\\lib\\awardtemplet.lua")

--Giíi h¹n ®iÓm kinh nghiÖm mçi ngµy lµ 50triÖu khi sö dông c¸c lo¹i b¶o r­¬ng - Modified by DinhHQ - 20110428
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")

tbAward = {
--	{szName="§iÓm kinh nghiÖm 1", 
--				pFun = function (tbItem, nItemCount, szLogTitle)
--					%tbvng_ChestExpAward:ExpAward(1500000, "C«ng Thµnh LÔ Bao (míi)")
--				end,
--				nRate = 60,
--	},
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
	{szName="Thiªn V­¬ng Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4640,1,0,0}, nRate=5, nExpiredTime=10080},
	{szName="Ngò §éc Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4641,1,0,0}, nRate=5, nExpiredTime=10080},
	{szName="Thóy Yªn Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4642,1,0,0}, nRate=5, nExpiredTime=10080},
	{szName="C«n L«n Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4643,1,0,0}, nRate=5, nExpiredTime=10080},
	{szName="Thiªn NhÉn Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4644,1,0,0}, nRate=5, nExpiredTime=10080},
	{szName="ThiÕu L©m Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4645,1,0,0}, nRate=5, nExpiredTime=10080},
	{szName="§­êng M«n Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4646,1,0,0}, nRate=5, nExpiredTime=10080},
	{szName="Nga Mi Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4647,1,0,0}, nRate=5, nExpiredTime=10080},
	{szName="Vâ §ang Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4648,1,0,0}, nRate=5, nExpiredTime=10080},
	{szName="C¸i Bang Hoµng Kim Trang BÞ B¶o R­¬ng (NgÉu nhiªn)", tbProp={6,1,4649,1,0,0}, nRate=5, nExpiredTime=10080},
	{szName="M· Bµi-Siªu Quang", tbProp={6,1,3483,1,0,0}, nRate=0.5, nExpiredTime=43200},
	{szName="M· bµi - B«n Tiªu", tbProp={6,1,2333,1,0,0}, nRate=1, nExpiredTime=43200},
	{szName="M· bµi - Phiªn Vò", tbProp={6,1,2334,1,0,0}, nRate=1, nExpiredTime=43200},
	
--Giíi h¹n ®iÓm kinh nghiÖm mçi ngµy lµ 50triÖu khi sö dông c¸c lo¹i b¶o r­¬ng - Modified by DinhHQ - 20110428
--	{nExp = 1500000,  nRate = 48.02},
--	{nExp = 2000000,  nRate = 30},
--	{nExp = 5000000,  nRate = 5},
--	{nExp = 10000000, nRate	= 3},
--	{nExp = 20000000, nRate	= 2},
--	{nExp = 50000000, nRate	= 1},	
}

function main(nItemIndex)
	if (CalcFreeItemCellCount() < 1) then
		Say("Hµnh trang Ýt nhÊt ph¶i cã <color=red>1<color> « trèng míi nhËn ®­îc phÇn th­ëng.")
		return 1
	end
	tbAwardTemplet:Give(tbAward, 1, {"SEVENCITY", "UseCityAward"})
	return 0
end

function test()
	local rate = 0
	for i = 1, getn(tbAward) do
		rate = rate + tbAward[i].nRate
	end
	if (floor(rate) ~= 100) then
		error(format("total rate is wrong", rate))
	end
end

test()
