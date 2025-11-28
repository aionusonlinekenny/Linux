--Started by ZhuYingTai 14/5/2015 3p xo 1 lan
Include("\\script\\lib\\timerlist.lua")
Include("\\script\\lib\\player.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
-- Include("\\script\\lib\\player.lua")
tbWinCashMsg = {
"%s ®· NhËn ®­îc %s v¹n l­îng tõ <color=orange>§¹i ThÇn Tµi<color>. ThËt may m¾nÙ<pic=26>",
-- "Con b¹c %s cÇm %s v¹n l­îng ¨n ®­îc tõ bÇu cua mµ khãc r»ng: Trêi vÉn cßn th­¬ng con.. Cuéc ®êi thËt kh«ng nhÉn t©m víi nh÷ng ng­êi khèn khæ nh­ ta.",
-- "Banh X¸c ®¹i nh©n h¨ng m¸u h« lªn: %s!, Ng­¬i ¨n ®­îc cña ta %s v¹n råi. §õng cã ¨n non mµ bá vÒ nhÐ. Ha ha",
-- "£. %s. Ng­¬i lµm c¸ch nµo mµ th¾ng ®­îc %s v¹n l­îng tõ ta hay vËy? Ng­¬i cã d¸m thö víi ta lÇn n÷a kh«ng? ",
-- "%s bçng d­ng hÐt to¸ng lªn: H¶o h÷u vÒ trung t©m Ba L¨ng huyÖn ta chia tiÒn nÌ. Võa tróng %s v¹n l­îng ®· thiÖt ®ã chø.",
-- "%s mÆt mµy nh­ hãa ®iªn hãa d¹i, tay ch©n ®Ëp lo¹n x¹ rÇm rÇm lªn bµn. Cuèi cïng «ng trêi ®· kh«ng phô lßng ta. ¡n ®­îc %s v¹n råi. H« h«.",
}
tbWinCoinMsg = {
"%s ®· NhËn ®­îc %s TiÒn ®ång tõ <color=orange>§¹i ThÇn Tµi<color>. ThËt may m¾nÙ<pic=26>",
-- "BÇu cua, cua bÇu. Cuéc ®êi ®· sang trang kh¸c víi %s sau khi h¾n tróng %s KNB tõ Banh X¸c ®¹i nh©n.",
-- "Th©n bÊt do kØ trêi chu ®Êt diÖt. %s sau khi tróng bÇu cua véi v¹ ch¹y vÒ thñ khè cÊt hÕt %s KNB ¨n ®­îc. ThËt lµ trang h¶o h¸n..",
-- "Ng­êi ®êi th­êng nãi: ®á b¹c ®en t×nh. ThËt qu¶ lµ chÝnh x¸c. %s tróng lu«n %s KNB. ¤ng trêi kh«ng lÊy kh«ng cña ai mét c¸i g×.",
-- "Mçi ngµy %s d¸n m¾t vµo mµn h×nh bÇu cua dïng giÊy mùc ghi chÐp l¹i quy luËt thËt kh«ng uæng c«ng. Tróng liÒn %s KNB. Cã c«ng mµi s¾t cã ngµy nªn kim.",
-- "Lµm giµu kh«ng khã víi bÇu cua. %s ®Æt tróng ngay %s KNB. Xa gÇn tËn trêi mµ gÇn ngay tr­íc m¾t. Ba L¨ng th¼ng tiÕn nµo.",
-- "§Õn víi Vâ l©m bÝ sö tr¶i nghiÖm bÇu cua. Ai ngê %s tróng ngay %s KNB. Sao hªn vËy ta?",
}
FishGame = FishGame or {
tbPlayerList = {},--luu toan bo thong tin nguoi choi: {nIndex,{Chua so cac con danh:["Bau"] = nCash,["Cua"] = nCash....},nAwardCash = 0-- luu so tien thang neu nguoi choi out game hoac trong truong hop dac biet khong add duoc tien}
nResult = {},--{"Bau","Cua"}

nTotalCash = 0,-- luu toan bo so tien danh
nTotalCoin = 0,-- lua tona bo so xu danh
nStarted = 0,
nTOTAL_RATE = 0,
DOUBLE_RATE = 1,-- ti le ra 2 amt giong nhau ti le chuan
NORMAL_RATE = 3,-- ti le ra 3 mat khac nhau ti le chuan
}
tbAllResult = tbAllResult or {

}

function FishGame:Init()
-- if SubWorldID2Idx(53) < 0 then-- kiem tra xem co phai map tuong duong ko?
	-- return
-- end
if self.nStarted == 0 then
self.TimerID = TimerList:AddTimer(self, 18*60); --1 phut se chay 1 lan
self.nStarted = 1
self.nStatus = 0
end
local nLuckRand= random(1,10)
self.NORMAL_RATE = nLuckRand
self.DOUBLE_RATE = nLuckRand * 2
for i=1,6 do-- khoi tao bang gia tri
	for j=1,6 do
		for k=1,6 do
			if i==j or i==k or k==j then
				tinsert(tbAllResult,1,{i,j,k,self.DOUBLE_RATE})
				self.nTOTAL_RATE = self.nTOTAL_RATE + self.DOUBLE_RATE
			else
				tinsert(tbAllResult,1,{i,j,k,self.NORMAL_RATE})
				self.nTOTAL_RATE = self.nTOTAL_RATE + self.NORMAL_RATE
			end
		end
	end
end
end
function FishGame:Stop()-- dong bau cua
self.nStarted = 0
TimerList:DelTimer(self.TimerID);
end
-- FishGame:Init()
function FishGame:GetNextResult()
print("Da chay qua")
local nRand = random(1,self.nTOTAL_RATE)
local nResult = 0
local nValue = 0
for i = 1,getn(tbAllResult) do
	nValue = nValue + tbAllResult[i][4]
	if nRand <= nValue then
		nResult = i
		break
	end
end
if nResult == 0 then
return nil
end
local tbResult = {ChangeToString(tbAllResult[nResult][1]),ChangeToString(tbAllResult[nResult][2]),ChangeToString(tbAllResult[nResult][3])}
for i=1,3 do
self.nResult[tbResult[i]] = self.nResult[tbResult[i]] or 0--
self.nResult[tbResult[i]] = self.nResult[tbResult[i]] + 1
end
-- end

-- end
local szMsg = format("<color=green>KÕt qu¶ ®ît nµy <color=yellow> %s , %s ,%s <color=green>. 1 phót n÷a cã thÓ cÇu may<color>",tbResult[1],tbResult[2],tbResult[3])
WriteLog("Ket qua bau cua lan nay"..tbResult[1].."va"..tbResult[2].."va"..tbResult[3])
Msg2SubWorld(szMsg)
return 1
end
function ChangeToString(nValue)
if nValue == 1 then
return "Tý"
elseif nValue == 2 then
return "Söu"
elseif nValue == 3 then
return "DÇn"
elseif nValue == 4 then
return "MÑo"
elseif nValue == 5 then
return "Th×n"
elseif nValue == 6 then
return "Tþ"
end
end
function FishGame:CalAwardForPlayer()
print("Da chay qua 2")
local nLoseCash = 0
local nLoseCoint = 0
for szName,tbInfo in self.tbPlayerList do
	for szChoice,nPoint in self.nResult do
	local tbKind = tbInfo.tbPut[szChoice]
	if tbKind then--
		if tbKind.nCash then--
			tbInfo.nAwardCash =  tbInfo.nAwardCash + (nPoint + 1)*tbKind.nCash
			nLoseCash = nLoseCash + (nPoint + 1)*tbKind.nCash
		end
		if tbKind.nCoin then--
			tbInfo.nAwardCoin =  tbInfo.nAwardCoin + (nPoint + 1)*tbKind.nCoin
			nLoseCoint = nLoseCoint + (nPoint + 1)*tbKind.nCoin
		end
	end
	end
tbInfo.tbPut = {-- reset sau khi nhan giai

}-- xoa toan bo du lieu danh truoc day
-- end
end
WriteLog("Bau cua lan nay tong tien van dat "..self.nTotalCash.." thua "..nLoseCash)
WriteLog("Bau cua lan nay tong tien don dat "..self.nTotalCoin.." thua "..nLoseCoint)
self.nTotalCash = 0--
self.nTotalCoin = 0
self.nResult = {}
end
function FishGame:AddAwardForPlayer()
print("Da chay qua 3")
for szName,tbInfo in self.tbPlayerList do
	
	if callPlayerFunction(tbInfo.nIndex,GetName) == szName and tbInfo.nAwardCash and tbInfo.nAwardCash > 0 then--  tien van
		callPlayerFunction(tbInfo.nIndex,Earn,tbInfo.nAwardCash*10000)
		callPlayerFunction(tbInfo.nIndex,Msg2Player,format("Ng­¬i nhËn ®­îc sè tiÒn %d v¹n tõ <color=orange>§¹i ThÇn Tµi<color>",tbInfo.nAwardCash))
		if tbInfo.nAwardCash > 100  then--<color=yellow> %d v¹n <color>
				Msg2SubWorld(format("<color=green>%s<color> nhËn ®­îc <color=yellow>%d tiÒn v¹n<color>Ùtõ ho¹t ®éng <color=yellow>§¹i ThÇn Tµi<color>. ThËt may m¾nÙ<pic=26>",szName,tbInfo.nAwardCash))
			-- Msg2SubWorld(format(tbWinCashMsg[random(getn(tbWinCashMsg))],"<color=green>"..szName.."<color>","<color=yellow>"..tbInfo.nAwardCash.."<color>"))
			WriteLog(format("Nhan vat %s th¾ng so tien %d v¹n",szName ,tbInfo.nAwardCash))
		end
		tbInfo.nAwardCash = 0
	end
	if callPlayerFunction(tbInfo.nIndex,GetName) == szName and tbInfo.nAwardCoin and tbInfo.nAwardCoin > 0 then-- TiÒn ®ång
		-- print ("Da trao thuong tien dong cho"..szName)
		local nCoin = tbInfo.nAwardCoin
		if nCoin <= 100 then
			callPlayerFunction(tbInfo.nIndex,AddStackItem,nCoin,4,417,1,1,0,0)
		else-- lon hon 100
			local nRound = nCoin/100
			for i=1,nRound do
				callPlayerFunction(tbInfo.nIndex,AddStackItem,100,4,417,1,1,0,0)
			end
			if mod(nCoin,100) > 0 then
				callPlayerFunction(tbInfo.nIndex,AddStackItem,mod(nCoin,100),4,417,1,1,0,0)
			end
		end
		callPlayerFunction(tbInfo.nIndex,Msg2Player,format("Ng­¬i nhËn ®­îc %d TiÒn ®ång tõ <color=orange>§¹i ThÇn Tµi<color> ThËt may m¾n <pic=26> !",nCoin))
		Msg2SubWorld(format("<color=green>%s<color> nhËnÙ§­îc <color=yellow>%d TiÒn ®ång<color>Ùtõ ho¹t ®éng <color=yellow>§¹i ThÇn Tµi<color>. ThËt may m¾nÙ<pic=26> !",szName,nCoin))
		-- Msg2SubWorld(format(tbWinCoinMsg[random(getn(tbWinCoinMsg))], "<color=green>"..szName.."<color>","<color=yellow>"..nCoin.."<color>"))
		WriteLog(format("Nhan vat %s th¾ng so %d TiÒn ®ång",szName ,nCoin))
		tbInfo.nAwardCoin = 0
	end
end
end
function main()-- doi thoai voi npc
--dofile("script/global/ctc/global/tinhnang/baucua/baucua.lua")
if FishGame.nStarted ~= 1 then
Say("TÝnh n¨ng chØ ®­îc khai më khung giê:\n\n\n<color=yellow>\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tÙ0:01 AM §Õn 23:59 PM everyday!<color>\n\n\nVui lßng quay l¹i sau.",0)
return
end
-- do 
-- Say("Xin lçi tÝnh n¨ng t¹m ®ãng ®Ó mäi ng­uêi cã thêi gian tham gia ho¹t ®éng",0)
-- return
-- end
-- FishGame:GetNextResult()
Say("Ng­êi anh em cÇn g× ë ta?",3,"cÇu may/OnChoseKind","Xem c¸c L­îtÙcÇu may lÇn nµy/showFishGate","Th«i ta hÕt tiÒn råi/no")
end
function showFishGate()
local szName = GetName()
if not FishGame.tbPlayerList[szName]  then--
Say("Ng­¬i ch­a <color=yellow>cÇu may<color> con nµo c¶",0)
return
end
local pPlayer =FishGame.tbPlayerList[szName]
local szMsg = ""
for szChoice,tbKind in pPlayer.tbPut do
szMsg = szMsg.."cöa: <color=green>"..szChoice.."<color> ".."TiÒn cÇu may:"
if tbKind.nCash then
szMsg = szMsg.."<color=red>"..tbKind.nCash.."<color> v¹n "
end
if tbKind.nCoin then
szMsg = szMsg.." <color=yellow>"..tbKind.nCoin.."<color> TiÒn ®ång"
end
szMsg=szMsg.."\n"
end
Say(szMsg,0)
end
function OnChoseKind()
Say("Ng­¬i muèn cÇu may?",3,"TiÒn v¹n/#joinFishGame(1)","TiÒn ®ång/#joinFishGame(2)","Th«i ta cÇu may nhiÒu qu¸ råi/no")
-- Say("Ng­¬i muèn ch¬i b»ng g×?",2,"TiÒn v¹n/#joinFishGame(1)","Th«i ta thua nhiÒu qu¸ råi/no")
end
function joinFishGame(nKind)
if FishGame.nStatus ~= 1 then
Say("Ng­¬i cã gÊp qu¸ kh«ng? §îi 1 phót n÷a míi cã thÓ <color=yellow>kh« m¸u<color> tiÕp nhÐ",0)
return
end
FishGame:OnPlayerJoin(PlayerIndex,GetName())
if nKind == 1 then
local tbSay = {
"Tý/#OnChoose(1,1)",
"Söu/#OnChoose(2,1)",
"DÇn/#OnChoose(3,1)",
"MÑo/#OnChoose(4,1)",
"Th×n/#OnChoose(5,1)",
"Tþ/#OnChoose(6,1)",
"Th«i ta kh«ng ch¬i n÷a/no"
}
Say("Ng­¬i chän con nµo?",getn(tbSay),tbSay)
else
local tbSay = {
"Tý/#OnChoose(1,2)",
"Söu/#OnChoose(2,2)",
"DÇn/#OnChoose(3,2)",
"MÑo/#OnChoose(4,2)",
"Th×n/#OnChoose(5,2)",
"Tþ/#OnChoose(6,2)",
"Th«i ta kh«ng ch¬i n÷a/no"
}
Say("Ng­¬i chän con nµo?",getn(tbSay),tbSay)

end
end
function OnChoose(nChoice,nKind)
-- Say("")
if nKind == 1 then
local nMaxCount = 500
g_AskClientNumberEx(1,nMaxCount, format("TiÒn (1-%d) v¹n", nMaxCount), {FishGame.GetNumberFromClient,{FishGame,nChoice,nKind} })
else
local nMaxCount = 500
g_AskClientNumberEx(1,nMaxCount, format("TiÒn ®ång (1-%d)", nMaxCount), {FishGame.GetNumberFromClient,{FishGame,nChoice,nKind} })
end
end
function FishGame:GetNumberFromClient(nChoice,nKind,nPutCash)
self:OnPlayerPut(PlayerIndex,GetName(),nPutCash,nChoice,nKind)
end
function FishGame:OnPlayerPut(nPlayerIndex,szName,nPutCash,nChoice,nKind)
if nPutCash > 500 then
Say("§õng cã ¨n gian...:D",0)
return
end
if not self.tbPlayerList[szName] or self.tbPlayerList[szName].nIndex ~= nPlayerIndex then
callPlayerFunction(nPlayerIndex,Say,"Cã lçi xay ra vui lßng liÖn hÖ GM ®Ó biÕt thªm chi tiÕt",0)
return
end
local pPlayer = self.tbPlayerList[szName]
local szChoice =""
if nChoice == 1 then
	szChoice = "Tý"
elseif nChoice == 2 then
	szChoice = "Söu"
elseif nChoice == 3 then
	szChoice = "DÇn"
elseif nChoice == 4 then
	szChoice = "MÑo"
elseif nChoice == 5 then
	szChoice = "Th×n"
elseif nChoice == 6 then
	szChoice = "Tþ"
end
-- if nKind == 1 then-- tien van ne

-- else -- tien dong

-- end
if nKind == 1 then-- tien van
if pPlayer.tbPut[szChoice] and pPlayer.tbPut[szChoice].nCash and pPlayer.tbPut[szChoice].nCash + nPutCash >= 500 then
Say("Ng­¬i kh« m¸u qu¸ <color=yellow>500<color> v¹n mét L­ît råi. Th¾ng ta quÞt tiÒn lu«n ®ã:T...",0)
return
end
local nOwnCash = callPlayerFunction(nPlayerIndex,GetCash)
if nOwnCash < nPutCash * 10000 then
callPlayerFunction(nPlayerIndex,Say,"Kh«ng ®ñ tiÒn mµ còng d¸m kh« m¸u. §i chç kh¸c ch¬i gióp kÎ kiÕt x¸c nµy",0)
return
end
callPlayerFunction(nPlayerIndex,Pay,nPutCash*10000)
pPlayer.tbPut[szChoice] = pPlayer.tbPut[szChoice] or {}
pPlayer.tbPut[szChoice].nCash = pPlayer.tbPut[szChoice].nCash or 0-- chua co thi khoi tao
pPlayer.tbPut[szChoice].nCash = pPlayer.tbPut[szChoice].nCash + nPutCash	
WriteLog(format("Nhan vat %s dat cua %s so tien %d v¹n",szName,szChoice,nPutCash))
if nPutCash >= 1 then--
Msg2SubWorld(format("<color=orange> %s <color>  kh« m¸u <color=yellow>%d V¹n<color> vµo cöa <color=green>%s<color> víi <color=orange>§¹i ThÇn Tµi<color>Ù<pic=7> ",szName,nPutCash,szChoice))
end
self.nTotalCash = self.nTotalCash + nPutCash
else-- tien dong
if pPlayer.tbPut[szChoice] and pPlayer.tbPut[szChoice].nCoin and pPlayer.tbPut[szChoice].nCoin + nPutCash >= 500 then
Say("Ng­¬i cÇu may qu¸ <color=yellow>500 TiÒn ®ång<color> mét con råi. §õng cÇu may nh­ thÕ chø..",0)
return
end
local nOwnCoin = callPlayerFunction(nPlayerIndex,CalcEquiproomItemCount,4, 417, 1, -1)
if nOwnCoin < nPutCash then
callPlayerFunction(nPlayerIndex,Say,"Kh«ng ®ñ <color=yellow>TiÒn ®ång<color> mµ còng d¸m kh« m¸u víi ta. TÐ ®i",0)
return
end
if callPlayerFunction(nPlayerIndex,ConsumeEquiproomItem,nPutCash, 4, 417, 1, -1) ~= 1 then--
callPlayerFunction(nPlayerIndex,Say,"Xin lçi cã lçi xÈy nghiªm träng vui lßng liªn hÖ GM")
return
end
pPlayer.tbPut[szChoice] = pPlayer.tbPut[szChoice] or {}
pPlayer.tbPut[szChoice].nCoin = pPlayer.tbPut[szChoice].nCoin or 0-- chua co thi khoi tao
pPlayer.tbPut[szChoice].nCoin = pPlayer.tbPut[szChoice].nCoin + nPutCash
WriteLog(format("Nhan vat %s dat cua %s so tien %d TiÒn ®ång",szName,szChoice,nPutCash))
if nPutCash >= 1 then
Msg2SubWorld(format("<color=orange>%s<color> mang <color=yellow>%d TiÒn ®ång<color> cÇu may <color=green>%s<color> víi <color=orange>§¹i ThÇn Tµi<color>Ù<pic=7>.",szName,nPutCash,szChoice))
end
self.nTotalCoin = self.nTotalCoin + nPutCash

end
end
function FishGame:OnPlayerJoin(nPlayerIndex,szName)
if not self.tbPlayerList[szName] then
self:AddNewPlayer(nPlayerIndex,szName)
return
end
if self.tbPlayerList[szName].nAwardCash > 0 then-- tra lai tien thang truoc do
	callPlayerFunction(nPlayerIndex,Earn,self.tbPlayerList[szName].nAwardCash*10000 )
	callPlayerFunction(nPlayerIndex,Msg2Player,format("Ng­¬i nhËn ®­îc sè tiÒn %d v¹n tõ <color=orange>§¹i ThÇn Tµi<color> thËt may m¾nÙ<pic=26>",self.tbPlayerList[szName].nAwardCash))
	WriteLog(format("Nhan vat %s NhËn so tien %d v¹n",szName ,self.tbPlayerList[szName].nAwardCash))
	self.tbPlayerList[szName].nAwardCash = 0
end
if self.tbPlayerList[szName].nAwardCoin > 0 then-- tra lai tien thang truoc do
		local nCoin = self.tbPlayerList[szName].nAwardCoin
		if nCoin <= 100 then
			callPlayerFunction(nPlayerIndex,AddStackItem,nCoin,4,417,1,1,0,0)
		else-- lon hon 100
			local nRound = nCoin/100
			for i=1,nRound do
				callPlayerFunction(nPlayerIndex,AddStackItem,100,4,417,1,1,0,0)
			end
			if mod(nCoin,100) > 0 then
				callPlayerFunction(nPlayerIndex,AddStackItem,mod(nCoin,100),4,417,1,1,0,0)
			end
		end
		self.tbPlayerList[szName].nAwardCoin = 0
		callPlayerFunction(nPlayerIndex,Msg2Player,format("Ng­¬i nhËn ®­îc %d TiÒn ®ång tõ <color=orange>§¹i ThÇn Tµi<color> thËt may m¾nÙ<pic=26>",nCoin))
		-- Msg2SubWorld(format("Con b¹c <color=green> %s<color> ¨n ®­îc tõ Banh X¸c phu nh©n <color=yellow> %d KNB <color> tõ bÇu cua thËt may m¾n.",szName,nCoin))
		WriteLog(format("Nhan vat %s NhËn so TiÒn ®ång %d ",szName ,nCoin))
		-- tbInfo.nAwardCoin = 0
end
self.tbPlayerList[szName].nIndex = nPlayerIndex-- tra lai index cho dung
end
function FishGame:AddNewPlayer(nPlayerIndex,szName)
self.tbPlayerList[szName] = {
nIndex = nPlayerIndex,
tbPut ={
-- ["BÇu"] = {}
-- ["Cua"] = {}
-- ["T«m"] = {}
-- ["C¸"] = {}
-- ["Gµ"] = {}
-- ["Nai"] = {}
},
nAwardCash = 0,
nAwardCoin = 0,
}
end
function FishGame:OnTime()-- moi 1 phut se chay 1 lan
print("BAU CUA DA CHAY")
local nMin = tonumber(GetLocalDate("%M")); -- lay so phut
local nX = mod(nMin,3)-- phut 1, 2 cho danh phut thu 3 ko cho danh
if nX == 0 then-- dang tinh ket qua khong cho danh tranh bug
FishGame.nStatus = 0
if FishGame:GetNextResult() ~= 1 then-- loi tinh toan
print("Bi dien roi")
return
end
FishGame:CalAwardForPlayer()
FishGame:AddAwardForPlayer()
else
FishGame.nStatus = 1
end
-- Say("TÝnh n¨ng chØ ®­îc khai më c¸c khung giê 6h-7h, 12h-13h,17h-19h, 22h-23h59h»ng ngµy. Vui lßng quay l¹i sau",0)
local nNowTime = tonumber(date( "%H%M "))
-- if (nNowTime >=600 and nNowTime < 700 ) or (nNowTime >=1200 and nNowTime < 1300 ) or (nNowTime >=1700 and nNowTime < 1900 ) or (nNowTime >=2200) then
if nNowTime >= 0001 and nNowTime < 2359 then
return 1
end
-- if (nNowTime >= 0 and nNowTime < 1100) or (nNowTime >= 1300 and nNowTime < 2200)  then
 self:Stop()
 return
 -- end
-- return
end


function AddNpc_baucua_Dialog() 
	local nNpcIndex = AddNpc(455,1,SubWorldID2Idx(78),1569*32,3235*32,0,"§¹i ThÇn Tµi");
	SetNpcScript(nNpcIndex, "\\script\\global\\ctc\\global\\tinhnang\\baucua\\baucua.lua");
end