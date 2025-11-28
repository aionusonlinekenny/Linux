Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\config\\12\\extend.lua")
Include("\\script\\lib\\droptemplet.lua")
Include("\\script\\lib\\log.lua")

NPC_PARAM_POS = 1
NPC_PARAM_DEATH = 2
NPC_PARAM_TASK_ID = 3

TRACK_LIST = 
{
	{2873*32,3649*32},
	{2853*32,3665*32},
	{2833*32,3689*32},
	{2818*32,3710*32},
	{2801*32,3734*32},
	{2777*32,3745*32},
	{2755*32,3767*32},
	{2727*32,3778*32},
	{2702*32,3775*32},
	{2670*32,3794*32},
	{2649*32,3823*32},
	{2620*32,3831*32},
	{2571*32,3868*32},
	{2529*32,3920*32},
	{2485*32,3895*32},
	{2462*32,3865*32},
	{2453*32,3812*32},
	{2420*32,3800*32},
	{2370*32,3760*32},
	{2337*32,3779*32},
	{2274*32,3818*32},
	{2246*32,3784*32},
	{2203*32,3759*32},
	{2146*32,3728*32},
	{2109*32,3770*32},
	{2078*32,3796*32},
	{2024*32,3775*32},
	{1999*32,3745*32},
	{1968*32,3781*32},
	{1922*32,3815*32},
	{1887*32,3823*32},
	{1879*32,3757*32},
	{1878*32,3687*32},
	{1917*32,3638*32},
	{1945*32,3605*32},
	{1959*32,3562*32},
	{1957*32,3526*32},
	{1949*32,3499*32},
}

tbCarriage = {}


function add_carriage(nMapId, nTaskId, szName, nCamp)
	
	local szScriptPath = "\\script\\activitysys\\config\\12\\carriage.lua"

	local nMapIndex = SubWorldID2Idx(nMapId)
	if nMapIndex >= 0 then
		local nNpcIndex = AddNpcEx(1903, 1, random(0,4), nMapIndex, %TRACK_LIST[1][1], %TRACK_LIST[1][2], 1, szName, 0)
		if nNpcIndex > 0 then
			SetNpcAI(nNpcIndex, 0)
			SetNpcCurCamp(nNpcIndex, nCamp)
			SetNpcActiveRegion(nNpcIndex, 1)
			SetNpcParam(nNpcIndex, %NPC_PARAM_POS, 2)
			SetNpcParam(nNpcIndex, %NPC_PARAM_TASK_ID, nTaskId)
			SetNpcScript(nNpcIndex, szScriptPath)
			SetNpcTimer(nNpcIndex, 18)
			return nNpcIndex
		end
	end
	return 0
end

function OnTimer(nNpcIndex, nTimeOut)
	local nPosId = GetNpcParam(nNpcIndex, %NPC_PARAM_POS)
	local tbPos =  %TRACK_LIST[nPosId]
	
	if not tbPos then
		return
	end
	
	if GetNpcParam(nNpcIndex, %NPC_PARAM_DEATH) == 1 then
		return 
	end
	
	if is_arrive_at(nNpcIndex, tbPos[1], tbPos[2]) then
		nPosId = nPosId + 1
		SetNpcParam(nNpcIndex, %NPC_PARAM_POS, nPosId)
		tbPos =  %TRACK_LIST[nPosId]
	end
	
	if nPosId > getn(%TRACK_LIST) then
		SetNpcParam(nNpcIndex, %NPC_PARAM_DEATH, 1)
		local nTaskId = GetNpcParam(nNpcIndex, %NPC_PARAM_TASK_ID)
		pActivity:TaskFinish(nTaskId)
		DelNpc(nNpcIndex)
	else
		NpcWalk(nNpcIndex, tbPos[1]/32, tbPos[2]/32)
	end
	
	SetNpcTimer(nNpcIndex, 18)
end

function is_arrive_at(nNpcIndex, nX, nY)
	local MAX_DIS = 100
	local nX32, nY32 = GetNpcPos(nNpcIndex)

	if abs(nX - nX32) < MAX_DIS and abs(nY - nY32) < MAX_DIS then
		return 1
	end
end

function OnDeath(nNpcIndex)
	if GetNpcParam(nNpcIndex, %NPC_PARAM_DEATH) == 1 then
		return
	end
	
	SetNpcParam(nNpcIndex, %NPC_PARAM_DEATH, 1)
	
	if (PlayerId and PlayerId > 0) and (PlayerIndex and PlayerIndex > 0) then 
		local szPlayerName = ""
		szPlayerName = GetName()
		local szAction = format("%s ®· c­íp tiªu %s", szPlayerName, GetNpcName(nNpcIndex))
		
	AddGlobalCountNews(szAction, 2)
	Msg2SubWorld("Chóc mõng cao thñ <color=yellow>"..GetName().."<color> ®· C­íp Tiªu cña <color=yellow>"..GetNpcName(nNpcIndex).."<color> thµnh c«ng!")	
		%tbLog:PlayerAwardLog(%EVENT_LOG_TITLE, szAction)		
	end
	
	local nTaskId = GetNpcParam(nNpcIndex, %NPC_PARAM_TASK_ID)
	pActivity:TaskFailed(nTaskId, nNpcIndex)
	
	local tbAward = {[1]={szName="Hé Tiªu LÖnh",tbProp={6,1,4791,1,0,0},},}
	
	if (PlayerId and PlayerId > 0) and (PlayerIndex and PlayerIndex > 0) then 
		tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex, tbAward, "Carriage Drop Item", 1)
	else
		tbDropTemplet:GiveAwardByList(nNpcIndex, -1, tbAward, "Carriage Drop Item", 1)
	
	str = "<color=green>Chóc mõng cao thñ <color=yellow>"..GetName().." ®· C­íp Tiªu cña "..GetNpcName(nNpcIndex).." thµnh c«ng!"
	AddGlobalCountNews(str, 2)
	Msg2SubWorld("Chóc mõng cao thñ <color=yellow>"..GetName().."<color> ®· C­íp Tiªu cña <color=fire>"..GetNpcName(nNpcIndex).."<color> thµnh c«ng!")

	end
	
end
