function LastNpcTalk()

	local nNpcIndex = GetLastDiagNpc()
	local Name = GetNpcName(nNpcIndex)
	local IdNpc = GetNpcSettingIdx(nNpcIndex)
	local nScript = GetNpcScript(nNpcIndex)
	local DropFile = GetNpcDropRateFile(nNpcIndex)
	local NguHanh = GetNpcSeries(nNpcIndex)
	local Life = GetNpcLife(nNpcIndex)
	local NpcKind = GetNpcKind(nNpcIndex)
if NpcKind == nil or nNpcIndex == nil then
Msg2Player("<color=yellow>Ch­a nãi chuyÖn v¬i NPC<color>")
return 0
else
	local file  = openfile("npcinfo.lua", "a+")
	write(file,strchar(34).."Name: "..Name.." ID: "..IdNpc.." Script: "..nScript.." DropFile: "..DropFile.." Life: "..Life.." NguHanh: "..NguHanh.." Kind: "..NpcKind..strchar(34),'\n')
	closefile(file)
	Msg2Player("<color=yellow>Th«ng tin ®­îc l­u l¹i ë file server1-npcinfo.lua<color>")
end
end
