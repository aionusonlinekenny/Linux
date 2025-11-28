


function OnDeath(nNpcIndex)
	local nPlayerIndex	= NpcIdx2PIdx(nNpcIndex);
	if nPlayerIndex > 0 then
		local szDeadName	= GetName()
		local szKiller		= doFunByPlayer(nPlayerIndex, GetName)
		local nCount		= doFunByPlayer(nPlayerIndex, GetTask, tbMissionClass.TSK_Kills)
		szMsg		= format("<color=green>%s<color> ®· h¹ cháng ®Ýt <color=yellow>%s<color> trong l«i ®µi Hoa S¬n", szKiller, szDeadName)

		doFunByPlayer(nPlayerIndex, SetTask, tbMissionClass.TSK_Kills, nCount + 1)
		doFunByPlayer(nPlayerIndex, Msg2Player, format("Sè ng­êi ®· ®¸nh b¹i: %d", nCount + 1))
		doFunByPlayer(nPlayerIndex, Msg2Player, szMsg)
		Msg2Player(szMsg)
	end
	Msg2Player("B¹n ®· hi sinh anh dòng ®­îc ban th­ëng<color=green> 1 nhÊt kü cµng kh«n phï.")
                        Msg2SubWorld("§¹i hiÖp <color=green>"..GetName().."<color=yellow> BÞ h¹ cháng ®Ýt trong l«i ®µi <color=green>Hoa S¬n")
                        AddItem(6,1,4640,1,0,0)
                        AddItem(6,1,4696,1,0,0)
                        AddItem(6,1,4696,1,0,0)
	tbMissionClass:GotoSignUpPlace()
	
	local nPlayerCount = tbMissionClass:GetMSPlayerCount(0)
	
	if nPlayerCount == 1 then
		tbMissionClass:OnClose()
	end
end