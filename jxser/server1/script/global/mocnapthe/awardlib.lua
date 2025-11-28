Include("\\script\\dailogsys\\dailogsay.lua")

function MenuPlayerCard()

	do Talk(1, "", "PhÇn th­ëng ch­a ®­îc cËp nhËt")
	return end
	
	local tbOpt = {"<dec><npc>Ng­¬i muèn nhËn mèc n¹p thÎ nµo?"};
		tinsert(tbOpt, "PhÇn th­ëng ®¹t mèc n¹p thÎ mÖnh gi¸ 20.000 VN§/PlayerCard20k")
		tinsert(tbOpt, "PhÇn th­ëng ®¹t mèc n¹p thÎ mÖnh gi¸ 50.000 VN§/PlayerCard20k")
		tinsert(tbOpt, "PhÇn th­ëng ®¹t mèc n¹p thÎ mÖnh gi¸ 100.000 VN§/PlayerCard20k")
		tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")
	CreateTaskSay(tbOpt)
end

function PlayerCard20k()
	if (CalcFreeItemCellCount() < 24) then
		Talk(1, "", "Vui lßng s¾p xÕp l¹i tói hµnh trang cña b¹n råi h·y nhËn th­ëng")
	return end
	
	local nCount = GetCardPayment();
	if (nCount < 20) then
		Talk(1, "", "B¹n ®ñ ®iÒu kiÖn ®Ó nhËn mèc n¹p thÎ nµy, vui lßng lµm thªm tiÒn ®Ó nhËn hç trî nµy")
	return end

	if (GetTaskModule(PLAYER_CHARGECARD, GetName(), TASKMODULE_CHARGECARD_20K) ~= 0) then
		Talk(1, "", "B¹n ®· nhËn phÇn th­ëng nµy råi, kh«ng thÓ nhËn thªm ®­îc nöa")
	return end
	-------------------------------- D÷ liÖu nhËn th­ëng -------------------------------------------------
	local tbAward = {
	}
	tbAwardTemplet:GiveAwardByList(tbAward, "Hç trî phÇn th­ëng n¹p thÎ - mèc 20k")
	SetTaskModule(PLAYER_CHARGECARD, GetName(), TASKMODULE_CHARGECARD_20K, 1)
	-----------------------------------------------------------------------------------------------------------
end

function PlayerCard50k()
	if (CalcFreeItemCellCount() < 24) then
		Talk(1, "", "Vui lßng s¾p xÕp l¹i tói hµnh trang cña b¹n råi h·y nhËn th­ëng")
	return end
	
	local nCount = GetCardPayment();
	if (nCount < 50) then
		Talk(1, "", "B¹n ®ñ ®iÒu kiÖn ®Ó nhËn mèc n¹p thÎ nµy, vui lßng lµm thªm tiÒn ®Ó nhËn hç trî nµy")
	return end

	if (GetTaskModule(PLAYER_CHARGECARD, GetName(), TASKMODULE_CHARGECARD_50K) ~= 0) then
		Talk(1, "", "B¹n ®· nhËn phÇn th­ëng nµy råi, kh«ng thÓ nhËn thªm ®­îc nöa")
	return end
	-------------------------------- D÷ liÖu nhËn th­ëng -------------------------------------------------
	local tbAward = {
	}
	tbAwardTemplet:GiveAwardByList(tbAward, "Hç trî phÇn th­ëng n¹p thÎ - mèc 50k")
	SetTaskModule(PLAYER_CHARGECARD, GetName(), TASKMODULE_CHARGECARD_50K, 1)
	-----------------------------------------------------------------------------------------------------------
end

function PlayerCard100k()
	if (CalcFreeItemCellCount() < 24) then
		Talk(1, "", "Vui lßng s¾p xÕp l¹i tói hµnh trang cña b¹n råi h·y nhËn th­ëng")
	return end
	
	local nCount = GetCardPayment();
	if (nCount < 50) then
		Talk(1, "", "B¹n ®ñ ®iÒu kiÖn ®Ó nhËn mèc n¹p thÎ nµy, vui lßng lµm thªm tiÒn ®Ó nhËn hç trî nµy")
	return end

	if (GetTaskModule(PLAYER_CHARGECARD, GetName(), TASKMODULE_CHARGECARD_100K) ~= 0) then
		Talk(1, "", "B¹n ®· nhËn phÇn th­ëng nµy råi, kh«ng thÓ nhËn thªm ®­îc nöa")
	return end
	-------------------------------- D÷ liÖu nhËn th­ëng -------------------------------------------------
	local tbAward = {
	}
	tbAwardTemplet:GiveAwardByList(tbAward, "Hç trî phÇn th­ëng n¹p thÎ - mèc 100k")
	SetTaskModule(PLAYER_CHARGECARD, GetName(), TASKMODULE_CHARGECARD_100K, 1)
	-----------------------------------------------------------------------------------------------------------
end