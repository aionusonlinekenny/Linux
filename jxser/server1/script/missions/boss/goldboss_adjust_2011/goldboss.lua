-- ÎÄ¼þÃû¡¡£ºgoldboss.lua
-- ´´½¨Õß¡¡£ºwangjingjun
-- ÄÚÈÝ¡¡¡¡£º»Æ½ðbossµ÷Õû£¬ÐÂÔöboss24Ð¡Ê±ºó×Ô¶¯É¾³ý
-- PS	   : ÓÉÓÚÔÚ¸ÃÎÄ¼þ¼ÓÔØµÄÊ±ºòÐèÒª½øÐÐbossËÀÍö×¢²á£¬ÖØ¸´¼ÓÔØ£¬bossËÀÍö»á¶à¸ø½±Àø
-- ´´½¨Ê±¼ä£º2011-10-02 08:15:46

Include("\\script\\lib\\droptemplet.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\misc\\eventsys\\type\\npcdeath.lua")
--Change boss award 2012 - Modified By DinhHQ - 20120315
Include("\\script\\lib\\awardtemplet.lua")
--local tbEquiptAward =
--{
--	[1873] = 
--	{
--		
--	},
--	[1874] = 
--	{
--		
--	},
--	[1875] = 
--	{
--		
--	},
--}

local tbDropItem = {
	[1]={{szName="Lam Thñy Tinh",tbProp={4,238,1,1,0,0},nCount=1,nRate=80},},
	[2]={{szName="Lôc Thñy Tinh",tbProp={4,240,1,1,0,0},nCount=1,nRate=80},},
	[3]={{szName="Tö Thñy Tinh",tbProp={4,239,1,1,0,0},nCount=1,nRate=80},},
	[4]={{szName="Tinh Hång B¶o Th¹ch",tbProp={4,353,1,1,0,0},nCount=1,nRate=80},},
	[5]={{szName="Tiªn Th¶o Lé ®Æc biÖt",tbProp={6,1,1181,1,0,0},nCount=1,nRate=60},},
	[6]={{szName="Hoµng Kim Ên (C­êng hãa)",tbProp={0,3210},nCount=1,nRate=5,nQuality = 1,nExpiredTime=10080,},},
	[7]={{szName="Hoµng Kim Ên (Nh­îc hãa)",tbProp={0,3220},nCount=1,nRate=5,nQuality = 1,nExpiredTime=10080,},},
	[8]={{szName="Long §¶m",tbProp={0,4487},nCount=1,nRate=5,nQuality = 1,nExpiredTime=10080,},},
	[9]={{szName="Cuång Lan",tbProp={0,4492},nCount=1,nRate=5,nQuality = 1,nExpiredTime=10080,},},
	[10]={{szName="Ngù Phong Hãa Gi¶i",tbProp={0,3474},nCount=1,nRate=5,nQuality = 1,nExpiredTime=10080,},},
	[11]={{szName="PhÖ Quang Hãa Gi¶i",tbProp={0,3477},nCount=1,nRate=5,nQuality = 1,nExpiredTime=10080,},},
	[12]={{szName="KhÊp ThÇn Hãa Gi¶i",tbProp={0,3480},nCount=1,nRate=5,nQuality = 1,nExpiredTime=10080,},},
	[13]={{szName="K×nh Thiªn Hãa Gi¶i",tbProp={0,3483},nCount=1,nRate=5,nQuality = 1,nExpiredTime=10080,},},
	[14]={{szName="V« Cùc Hãa Gi¶i",tbProp={0,3486},nCount=1,nRate=5,nQuality = 1,nExpiredTime=10080,},},
	[15]={{szName="Cao CÊp Hãa Gi¶i",tbProp={0,3489},nCount=1,nRate=5,nQuality = 1,nExpiredTime=10080,},},
	[16]={{szName="Anh Hïng ThiÕp",tbProp={6,1,1604,1,0,0},nCount=1,nRate=70,nExpiredTime=10080},},
}
local tbNpcInfo = 
{
	[1] = {1873,"Tr­¬ng Tuyªn",},		
	[2] = {1874,"Kim ThÝ L­îng",},		
	[3] = {1875,"Mé Dung Toµn",},		
}

function checkNpc(nNpcIndex)
	local nNpcId = GetNpcSettingIdx(nNpcIndex)
	local szName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szName = NpcName2Replace(szName)
	end
	
	for i=1,getn(%tbNpcInfo) do	
		local szNpcName = %tbNpcInfo[i][2]
		if NpcName2Replace then
			szNpcName = NpcName2Replace(szNpcName)
		end 
		if (szNpcName == szName) and (nNpcId == %tbNpcInfo[i][1]) then
			return 1
		end
	end
	return 0
end

function addNews(nNpcIndex, nPlayerIndex)
	local szName = GetName(nPlayerIndex)
	if NpcName2Replace then
		szName = NpcName2Replace(szName)
	end
	
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local szNews = format("§¹i hiÖp <color=yellow>%s<color> t¹i <color=yellow>%s<color> ®· tiªu diÖt thµnh c«ng <color=yellow>%s<color>!", szName, SubWorldName(SubWorld),szNpcName)
	AddGlobalNews(szNews)
end

function goldbossdeath(nNpcIndex, nPlayerIndex)
--	print("boss ËÀÍö " .. GetNpcName(nNpcIndex))
	if checkNpc(nNpcIndex) ~= 1 then
		return 
	end
	
	addNews(nNpcIndex, nPlayerIndex)
	--Thay ®æi phÇn th­ëng - Modified by DinhHQ - 20111009
	local tbItemAward = 
	{
		[1873] = {szName="Thiªn Linh §¬n",tbProp={6,1,3022,1,0,0},nCount = 20, nExpiredTime = 7 * 24 * 60},
		[1874] = {szName="Thiªn Linh §¬n",tbProp={6,1,3022,1,0,0},nCount = 20, nExpiredTime = 7 * 24 * 60},
		[1875] = {szName="Thiªn Linh §¬n",tbProp={6,1,3022,1,0,0},nCount = 30, nExpiredTime = 7 * 24 * 60},
	}
	--Bá  phÇn th­ëng Thiªn Chi R­¬ng - Modified by DinhHQ - 20111009
	local tbOtherAward = 
	{
		[1873] = {90, 30},
		[1874] = {94.825, 30},
		[1875] = {94.825, 40},
	}
	
	local nKind = GetNpcParam(nNpcIndex, 1)
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,tbItemAward[nKind],format("killed_%s",szNpcName))
	--Bá  phÇn th­ëng Thiªn Chi R­¬ng - Modified by DinhHQ - 20111009
	local nRate = random(1,10000) / 100
	if nRate <= tbOtherAward[nKind][1] then
		local tbTeam = getPlayerTeam()
		addTianzhibaoxiang(tbOtherAward[nKind][2], nNpcIndex, tbTeam)
	else
		tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,%tbEquiptAward[nKind],format("killed_%s",szNpcName))
	end
	--Change boss award 2012- Modified by DinhHQ - 20120315
	tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,%tbDropItem,format("killed_%s",szNpcName))	
	--tbDropTemplet:GiveAwardByList(nNpcIndex, PlayerIndex,%tbEquiptAward[nKind],format("killed_%s",szNpcName))
	--PhÇn th­ëng exp
	local tbAwardExp = {
		["Killer"] = {nExp = 20e6, szName = "§iÓm kinh nghiÖm"},
		["Around"] = {nExp = 10e6, szName = "§iÓm kinh nghiÖm"},
	}
	nOldPlayer = PlayerIndex	
	local nTeamSize = GetTeamSize();	
	if (nTeamSize > 1) then
		for i=1,nTeamSize do
			PlayerIndex = GetTeamMember(i)
			tbAwardTemplet:Give(tbAwardExp["Killer"], 1, {"DCPhanThuongBoss", "PhÇn th­ëng exp cho tæ ®éi tiªu diÖt "..szNpcName})
		end
	else		
		tbAwardTemplet:Give(tbAwardExp["Killer"], 1, {"DCPhanThuongBoss", "PhÇn th­ëng exp cho ng­êi tiªu diÖt "..szNpcName})
	end
	local tbRoundPlayer, nCount = GetNpcAroundPlayerList(nNpcIndex, 20);	
	for i=1,nCount do	
		PlayerIndex = tbRoundPlayer[i]
		tbAwardTemplet:Give(tbAwardExp["Around"], 1, {"DCPhanThuongBoss", "PhÇn th­ëng exp cho ng­êi ®øng gÇn "..szNpcName})
	end
	PlayerIndex = nOldPlayer
end

function getPlayerTeam()
	local tbTeam = {}
	local nTeamSize = GetTeamSize()
	if nTeamSize == 0 then
		tinsert(tbTeam, PlayerIndex)
	else
		for i = 1, nTeamSize do
			local nPlayerIndex = GetTeamMember(i)
			tinsert(tbTeam, nPlayerIndex)
		end
	end
	return tbTeam
end

function addTianzhibaoxiang(nCount, nNpcIndex, tbTeam)
	local tbTianzhibaoxiang = 
	{
		szName = "R­¬ng Thiªn Chi", 
		nLevel = 95,
		nNpcId = 1876,
		nIsboss = 0,
		nTime = 5 * 60,		-- ´æÔÚÊ±¼ä 5 ·ÖÖÓ
		szScriptPath = "\\script\\missions\\boss\\goldboss_adjust_2011\\tianzhibaoxiang.lua",
	}
	local nNpcX,nNpcY,nMapIndex = GetNpcPos(nNpcIndex)
	local nMapId = SubWorldIdx2ID(nMapIndex)
	tbTianzhibaoxiang.tbNpcParam = tbTianzhibaoxiang.tbNpcParam or {}
	tbTianzhibaoxiang.tbNpcParam[1] = GetLocalTime()		-- µÃµ½´´½¨µÄÊ±¼ä
	tbTianzhibaoxiang.tbNpcParam[2] = getn(tbTeam)
	for i=1, getn(tbTeam) do
		tbTianzhibaoxiang.tbNpcParam[i+2] = tbTeam[i]
	end
	
	local nRow = 6
	local nOffset = 3 * 32
	-- ÖÐ¼äÔ¤ÁôÒ»¸öÎ»ÖÃ·ÅÖÃÌìÁéµ¤£¬ËùÒÔÔÚ¼ÆËã¿ÉÏÔÊ¾ÐÐÊýÊ±£¬ÔÚ×ÜÊýÉÏÐèÒª+1
	local nClow = floor(nCount / nRow) + 1
	local nMidRow = floor(nRow / 2)
	local nMidClow = floor(nClow / 2)
	local nStartX = nNpcX - nMidRow * nOffset
	local nStartY = nNpcY - nMidClow * nOffset
	
	-- Ã¿ÐÐ6¸ö±¦Ïä£¬ÒÔbossËÀÍöµÄÎ»ÖÃÎªÖÐÐÄ³É¾ØÕóÅÅÁÐ
	for j=1, nClow do
		for i=1, nRow do
			if nCount > 0 then
				-- ÖÐÐÄÎ»ÖÃÏÔÊ¾ÌìÁéµ¤£¬²»·ÅÖÃ±¦Ïä
				if j ~= nMidClow or i ~= nMidRow then
					local x = nStartX + i * nOffset
					local y = nStartY + j * nOffset
					basemission_CallNpc(tbTianzhibaoxiang, nMapId, x, y)
					nCount = nCount - 1
				end
			else
				break
			end
		end
	end	
end

function OnTimer(nNpcIndex)
	DelNpc(nNpcIndex)
end

function register()
	for i=1,getn(%tbNpcInfo) do	
		local szNpcName = %tbNpcInfo[i][2]
		if NpcName2Replace then
			szNpcName = NpcName2Replace(szNpcName)
		end 
		EventSys:GetType("NpcDeath"):Reg(szNpcName, goldbossdeath)
	end
end

register()