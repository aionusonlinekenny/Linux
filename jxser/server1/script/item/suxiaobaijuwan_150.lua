Include("\\script\\global\\baijuwanhead.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\vng_event\\tochieukynang150\\head.lua")

tbFastSpeedSkill_Banjuwan_150 = {}

tbFastSpeedSkill_Banjuwan_150.nTargetExp = 1540

function tbFastSpeedSkill_Banjuwan_150:AddSkillStatckExp(nSkillId, nExp)
	local nTotleExp = nExp
	local nNextExp = GetSkillNextExp(nSkillId) - GetSkillExp(nSkillId)
	local nNeedAddExp = 0
	local szSkillName = GetSkillName(nSkillId)
	while nExp > nNextExp do
		if GetCurrentMagicLevel(nSkillId, 0) >= GetSkillMaxLevel(nSkillId) then
			Msg2Player(format("Sö dông B¹ch C©u Hoµn §Æc BiÖt thµnh c«ng, <color=yellow> %s <color> ®é tu luyÖn n©ng cao <color=yellow> %d <color>", szSkillName, nTotleExp))
			return
		end
		nNeedAddExp = nNextExp
		nExp = nExp - nNeedAddExp
		AddSkillExp(nSkillId, nNeedAddExp, 1)		
		nNextExp = GetSkillNextExp(nSkillId)
	end
	AddSkillExp(nSkillId, nExp, 1)
	Msg2Player(format("Sö dông B¹ch C©u Hoµn §Æc BiÖt thµnh c«ng, <color=yellow> %s <color> ®é tu luyÖn n©ng cao <color=yellow> %d <color>", szSkillName, nTotleExp))
end

function tbFastSpeedSkill_Banjuwan_150:CheckSkill(nSkillId)
	local nCurSkillLevel = GetCurrentMagicLevel(nSkillId, 0);
	local nSkillExp = GetSkillExp(nSkillId)
	
	if HaveMagic(nSkillId) == -1 or HaveMagic(nSkillId) >= 20 then
		return 0
	end
--	print("Ñ§Ï°ÁËµ±Ç°µÄ¼¼ÄÜ, nSkillId = " .. nSkillId)
--	print(nSkillExp .. "\t" .. nCurSkillLevel)
	if nSkillExp ~= -1 and nCurSkillLevel >= 1 and nCurSkillLevel < GetSkillMaxLevel(nSkillId) then
		return 1
	end
end

function tbFastSpeedSkill_Banjuwan_150:AddSkillToList(tbDec, tbSrc)
	for i = 1, getn(tbSrc) do
		local nSkillId = tbSrc[i]
		if self:CheckSkill(nSkillId) == 1 then
			tinsert(tbDec , nSkillId)
		end
	end
end

function tbFastSpeedSkill_Banjuwan_150:GetCanUpdateSkill()
	local tbSkill = {};
	
	self:AddSkillToList(tbSkill, ARY_UPGRADE_SKILL_150)
	return tbSkill;
end

function tbFastSpeedSkill_Banjuwan_150:ShowMenu(nItemIndex)
	local tbSkill = self:GetCanUpdateSkill()
	
	local szTitle = "Xin h·y lùa chän kü n¨ng mµ ng­¬i muèn t¨ng:"
	
	tbOpt = {}
	for i=1, getn(tbSkill) do
		local nSkillId = tbSkill[i]
		local szSkillName = GetSkillName(nSkillId)
		tinsert(tbOpt, 	{szSkillName, self.UseItem, {self, nItemIndex, nSkillId}}	)
	end
	tinsert(tbOpt , {"Hñy bá "})
	CreateNewSayEx(szTitle, tbOpt)
end

function tbFastSpeedSkill_Banjuwan_150:UseItem(nItemIndex, nSkillId)
	if not self:CheckSkill(nSkillId) then
		return
	end
	if IsMyItem(nItemIndex) == 1 then
	
		self:AddSkillStatckExp(nSkillId, self.nTargetExp)
		RemoveItemByIndex(nItemIndex)
	end
end

function main(nItemIndex)
	tbFastSpeedSkill_Banjuwan_150:ShowMenu(nItemIndex)
	return 1
end
