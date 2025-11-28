------------------------------------------------------------------------------
-- File Name: hotrotanthu.lua
-- Npc Name: Hç trî t©n thñ
-- §­êng dÉn: \\script\\global\\npc\\hotrotanthu.lua
-- Author by AloneScript (Linh Em) @ 05-08-2018
------------------------------------------------------------------------------
IncludeLib("SETTING")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\activitysys\\npcdailog.lua");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\lib\\itemblue.lua")
Include("\\script\\lib\\alonelib.lua")
Include("\\script\\global\\seasonnpc.lua")

function main()
	dofile("script/global/npc/hotrotanthu.lua")
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)
	tbDailog.szTitleMsg = "<npc>Chµo mõng c¸c b¹n tham gia vµo <color=yellow>Vâ L©m TruyÒn Kú<color> phiªn b¶n <color=red>C«ng Thµnh ChiÕn<color>. HiÖn ®ang trong giai ®o¹n thö nghiÖm, h·y nhËn hç trî råi tham gia c¸c tÝnh n¨ng ®Ó tr·i nghiÖm tr­íc khi m¸y chñ chÝnh thøc ®i vµo ho¹t ®éng."
	tbDailog.szTitleMsg = gsub(tbDailog.szTitleMsg , "<dec>", "")
	tbDailog:Show()
end
