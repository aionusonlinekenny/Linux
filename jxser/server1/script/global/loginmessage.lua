Include("\\script\\global\\login_head.lua")
Include("\\script\\lib\\awardtemplet.lua")
IncludeLib("SETTING")
function Login_Server()
	local OrgPlayer = PlayerIndex;
	 local autochat = "Website: <color=blue>www.vldoxanh.com<color>\n<color=green>Server miÔn phÝ cho c¸c b¹n ®am mª game Vâ L©m TruyÒn Kú. Chóc c¸c b¹n cã nh÷ng gi©y phót th­ gi·n vui vÎ.<pic=115><pic=115><color>"        
	 Msg2Player(format(autochat)) 
	PlayerIndex = OrgPlayer
end
if login_add then login_add(Login_Server, 2) end
function CGSupportNewPlayer_Login()
	local szAccount = GetAccount()
	if szAccount=="administrator" then
		return
	end
	if GetLevel() == 1 and GetTask(5003,20) == 0 then 
	local tanthu =
	{
		{szName="<color=yellow>ThÇn Hµnh Phï", tbProp={6,1,1266}, nCount = 1, nBindState = -2, nExpiredTime = 43200},
		{szName="<color=yellow>Thæ §Þa Phï", tbProp={6,1,438}, nCount = 1, nBindState = -2, nExpiredTime = 43200},
		{szName="<color=yellow>LÑnh bµi T©n Thñ", tbProp={6,1,4265}, nCount = 1, nBindState = -2},
}
		tbAwardTemplet:GiveAwardByList(tanthu, "T©n Thñ")
			Msg2SubWorld("Chµo mõng t©n thñ <color=yellow>"..GetName().."<color> ®· tham gia vµo <color=blue>http://www.vldoxanh.com<color>");
			SetTask(5003,20)	
	end
end
if login_add then login_add(CGSupportNewPlayer_Login,1) end
------Mod-----
local tbModAccount = {"kennylucia","kennylucia1","kennylucia2","kennylucia3","kennylucia4","kennylucia5","kennylucia6","kennylucia7","kennylucia8","kennylucia9","kennylucia10","kennylucia11","kennylucia12","kennylucia13","kennylucia14","kennylucia15"}
function Mod()
local szAccount = GetAccount()
	for i=1, getn(%tbModAccount) do
		if szAccount == %tbModAccount[i] then
			if GetTask(5002,20) == 0 then 
				local index = AddItem(6,1,4636,0,0,0,0)
				SetItemBindState(index,-2)
				local index = AddItem(6,1,4867,0,0,0,0)
				SetItemBindState(index,-2)
				SetTask(5002,20)
			end
		end
	end
end
if login_add then login_add(Mod,1) end

function loginGamer()
local szAccount = GetAccount()
	if szAccount=="administrator" then
		if GetTask(5001,20) == 0 then 
			AddStackItem(50,4,417,1,1,0,0,0) --TiÒn §ång
			Earn(50000000) --- 5K v¹n
			AddLeadExp(20000)		--NhËn tµi l·nh ®¹o.
			AddItem(6,1,1266,0,0,0) --NhËn ThÇn Hµnh Phï
			AddItem(6,1,438,0,0,0) --NhËn Thæ §Þa Phï	
			ST_LevelUp(179)
			local index = AddItem(6,1,4636,0,0,0,0)
			SetItemBindState(index,-2)
			--AddMagic(732,60)
			--AddMagic(733,60)
			SetTask(5001,20)
		end
		return
	end	
----Thong Bao NV Online
	Msg2SubWorld("<color=yellow>§¹i hiÖp<color><color=green> "..GetName().."<color> lªn m¹ng råi...")	
end