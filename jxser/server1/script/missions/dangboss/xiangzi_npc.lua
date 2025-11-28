
local tbAward = 
{
	{nExp = 5e6},
	{
--		{szName="NhÊt Kû Cµn Kh«n Phï", tbProp={6, 1, 2126, 1, 0, 0}, nExpiredTime = 60*24*30, nRate = 0.5},
--		{nExp = 5e7, nRate = 2},
--		{szName="ThÇn bÝ kho¸ng th¹ch", tbProp={6, 1, 398, 1, 0, 0}, nRate = 1.5},
	
--		{szName="Thiªn tinh b¹ch c©u hoµn", tbProp={6, 1, 2183, 1, 0, 0}, nRate = 4},
--		{szName="B¹ch C©u Hoµn ®Æc biÖt", tbProp={6, 1, 1157, 1, 0, 0}, nRate = 5, nExpiredTime = 60*24*7},
		
--		{szName="Qu¶ Hoµng Kim", tbProp={6, 1, 907, 1, 0, 0}, nRate = 6, nExpiredTime = 60*24*7},
		
--		{nExp = 2e7, nRate = 10},
--		{szName="TÈy Tñy Kinh", tbProp={6, 1, 22, 1, 0, 0}, nRate = 8},
	
--		{szName="Vâ L©m MËt TÞch", tbProp={6, 1, 26, 1, 0, 0}, nRate = 8},
--		{nExp = 1e7, nRate = 15},
		
--		{szName="HuyÒn tinh kho¸ng th¹ch cÊp 8", tbProp={6, 1, 147, 8, 0, 0}, nRate = 20},
--		{szName="HuyÒn tinh kho¸ng th¹ch cÊp 7", tbProp={6, 1, 147, 7, 0, 0}, nRate = 20},
		{nExp = 1e7, nRate = 26},
		
		{nExp = 15e6, nRate = 20.5},
		
	
		
		{nExp = 5e7, nRate = 29},
		
		
		{szName="Vâ L©m MËt TÞch", tbProp={6, 1, 26, 1, 0, 0}, nRate = 0.5},
		{szName="TÈy Tñy Kinh", tbProp={6, 1, 22, 1, 0, 0}, nRate = 0.5},
		{szName="Qu¶ Hoµng Kim", tbProp={6, 1, 907, 1, 0, 0}, nRate = 5, nExpiredTime = 60*24*7},
		{szName="Thiªn Niªn Huy Hoµng qu¶", tbProp={6, 1, 2270, 1, 0, 0} , nExpiredTime = 60*24*7, nRate= 18.5},
	}
}
Include("\\script\\lib\\awardtemplet.lua")
function main()
	local nNpcIndex = GetLastDiagNpc()
	
	if GetNpcParam(nNpcIndex, 4) ~= 1 then
		SetNpcParam(nNpcIndex, 4, 1)
		tbAwardTemplet:GiveAwardByList(%tbAward, "®iÓm b¶o r­¬ng")
		DelNpc(nNpcIndex)
	else
		return
	end
end

