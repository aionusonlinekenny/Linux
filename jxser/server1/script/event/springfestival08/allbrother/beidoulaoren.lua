Include("\\script\\event\\springfestival08\\allbrother\\event.lua");	-- 
Include("\\script\\event\\BeiDouChuanGong\\zhizuochuangongwan.lua");	-- 
Include("\\script\\event\\other\\xunmashu\\dialog.lua")
Include("\\script\\task\\metempsychosis\\npc_saodiseng.lua");			-- ∂‡÷ÿ◊™…˙∂‘ª∞
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\task\\metempsychosis\\translife_4_ex.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\task\\metempsychosis\\task_head.lua")
function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName);
	end
	
	local tbDailog = DailogClass:new(szNpcName);
	tbDailog.szTitleMsg = "<npc>Xin chµo, tπi hπ lµ truy“n nh©n cÒa Bæc ß»u M´n, chºng hay c∏c hπ c«n g◊?";
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	tbDailog:AddOptEntry("H‰c k¸ n®ng trÔng sinh 5", kynangtrungsinh5);
	tbDailog:AddOptEntry("Nhi÷m vÙ t¯ h∂i giai huynh Æ÷", allbrother_0801_main);
	tbDailog:AddOptEntry("H‰c Bæc ß»u Tr≠Íng Sinh ThuÀt vµ TrÔng Sinh", beidou_translife_main);
	tbDailog:AddOptEntry("Luy÷n ti™n Æan truy“n c´ng", BeiDouChuanGong_main, {1});
	--Tπm Æ„ng k¸ n®ng TS 4 - Modified By DinhHQ - 20111102
	--tbDailog:AddOptEntry("Ta muËn h‰c k¸ n®ng Chi’n ˝ Thi™n Thu", beidou_learn_specialskill);
	
	if tbXunMaShu0903:IsActDate() then
	--	tbDailog:AddOptEntry("Hoπt ÆÈng [B∂o r≠¨ng th«n b›]", tbXunMaShu0903.DialogMain_Box, {tbXunMaShu0903});
	--	tbDailog:AddOptEntry("Bæc ß»u Thu«n M∑ ThuÀt", tbXunMaShu0903.DialogMain_Horse, {tbXunMaShu0903});
	end
	
	tbDailog:Show();
end

function kynangtrungsinh5()
	local szTitle = "C©n nhæc k¸ tr≠Ìc khi ch‰n. MÁi nh©n vÀt chÿ Æ≠Óc ch‰n 1 l«n. Ng≠¨i muËn nhÀn k¸ n®ng nµo?"
	local tbOpt =
	{
	
		{"ßπi Di÷p Kh› Tr∏o",daidiepkhitrao},
		{"Tr‰ng K›ch Tuy÷t ßËi",trongkichtuyetdoi},
		{"TrÎ lπi",main},
		{"Tho∏t"},
	}
	CreateNewSayEx(szTitle, tbOpt)
end


function daidiepkhitrao()
local nlevel = GetLevel();
local ntranscount = ST_GetTransLifeCount();

if (HaveMagic(993) >= 0) or (HaveMagic(998) >= 0) then
Talk(1,"","MÁi nh©n vÀt chÿ Æ≠Óc nhÀn 1 l«n")
return 1	
end

if (ntranscount == 5) and (HaveMagic(993) < 0) and (HaveMagic(998) < 0) then
		AddMagic(993,1)
	else
Talk(1,"","TrÔng Sinh 5 rÂi h∑y nhÀn skill")
end
	
end

function trongkichtuyetdoi()
local nlevel = GetLevel();
local ntranscount = ST_GetTransLifeCount();

if (HaveMagic(993) >= 0) or (HaveMagic(998) >= 0) then
Talk(1,"","MÁi nh©n vÀt chÿ Æ≠Óc nhÀn 1 l«n")
return 1	
end

if (ntranscount == 5) and (HaveMagic(993) < 0) and (HaveMagic(998) < 0) then
		AddMagic(998,1)
	SetTask(6565,1)
else
Talk(1,"","TrÔng Sinh 5 rÂi h∑y nhÀn skill")
end
	
end

