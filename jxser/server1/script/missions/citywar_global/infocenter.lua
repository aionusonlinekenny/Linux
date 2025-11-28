--Edit by NamCungNhatThien
--Date: 31-08-2015
--http://www.clbgamesvn.com/
--*****************************************
Include("\\script\\missions\\citywar_global\\infocenter_head.lua")
MapTab = {};
MapTab[1]= {213, 1633, 3292};
MapTab[2]= {214, 1633, 3292};
MapTab[3]= {215, 1633, 3292};
MapTab[4]= {216, 1633, 3292};
MapTab[5]= {217, 1633, 3292};
MapTab[6]= {218, 1633, 3292};
MapTab[7]= {219, 1633, 3292};
MapTab[8]= {220, 1633, 3292};
MapCount = getn(MapTab);

function main()
	dofile("script/missions/citywar_global/infocenter.lua")
	ArenaBaoDanh()				--L«i ®µi
	--ArenaMain()				--Khiªu chiÕn lÖnh
	--Say("Mäi th¾c m¾c vÒ c«ng thµnh chiÕn cã thÓ ®Õn NPC <color=red>xa phu c«ng thµnh<color> gÇn c¸c xa phu thµnh thÞ ®Ó t×m hiÓu")
end
--*******************************Menu L«i ®µi*********************************************************************
function ArenaBaoDanh()
	local nCityId = getSigningUpCity(1);--GetArenaTargetCity()
	--if (tonumber(GetLocalDate("%H"))>= 18 and tonumber(GetLocalDate("%H")) < 19 and IsSigningUp(nCityId) == 1) then
	if (IsSigningUp(nCityId) == 1) then
		Say(format("HiÖn giê <color=yellow>%s<color> l«i ®µi C«ng Thµnh ChiÕn ®ang bao danh, c¸c h¹ cã muèn b¸o danh cho bang héi cña m×nh kh«ng?",GetCityAreaName(nCityId)), 
			3, 
			"V©ng ta ®Õn ®Ó b¸o danh/SignUpTheOne", 
			"Kh«ng, ta chØ t×m hiÓu th«ng tin vÒ viÖc dù tuyÓn thi ®Êu/OnHelp",
			"BiÕt råi, ta ®i tr­íc ®©y /OnCancel");
	else
		if(WhichArenaBegin()~=0) then	
			Say("§©y lµ n¬i nghÞ sù c«ng thµnh chiÕn, ng­¬i ®Õn cã viÖc g×?", 
				3,
				"Vµo ®Êu tr­êng tû vâ/PreEnterGame",
				"T×m hiÓu th«ng tin vÒ viÖc dù tuyÓn thi ®Êu/OnHelp",
				"BiÕt råi, ta ®i tr­íc ®©y /OnCancel");
		else
			Say("§©y lµ n¬i nghÞ sù c«ng thµnh chiÕn, ng­¬i ®Õn cã viÖc g×?", 
				4,
				"Tham gia c«ng thµnh chiÕn tr­êng/CTC",
				"T×m hiÓu th«ng tin vÒ viÖc dù tuyÓn thi ®Êu/OnHelp",
				"Mua dông cô hç trî C«ng thµnh chiÕn/AskDeal",
				"BiÕt råi, ta ®i tr­íc ®©y /OnCancel");
		end

	end
end

function CTC()
	CityID = WhichWarBegin();
	if (CityID >= 1 and CityID <= 7) then
		GoCityWar()
	else
		Say("C«ng thµnh chiÕn tr­êng lµ n¬i ®ao kiÕm v« t×nh, nÕu kh«ng tíi tham chiÕn th× h·y lÊy sinh m¹ng lµm träng\nThêi gian chiÕn ®Êu ch­a ®Õn h·y mau vÒ ®i", 0);
	end;
end;
--*********************************B¸o danh l«i ®µi********************************************************
function SignUpTheOne()
	CityID = 0;
	for i = 1, 7 do
		if (IsSigningUp(i) == 1) then		--KiÓm tra b¸o danh l«i ®µi
			CityID = i;
		end;
	end;

	if (IsSigningUp(CityID) == 1) then
		SetTaskTemp(15, CityID);
		AskClientForNumber("SignUpFinal", 1000000, 99999999, "Xin nhËp sè tiÒn B¸o Danh vµo:");
	else
		Say("<#><"..GetCityAreaName(CityID).."<#> >thµnh, b¸o danh trËn L«i ®µi ch­a b¾t ®Çu ", 0);
	end;
end;
function SignUpFinal(Fee)
	CityID = GetTaskTemp(15);
	SignUpCityWarArena(CityID, Fee);		--B¸o danh l«i ®µi
end;
--**************************KiÓm tra b¾t ®Çu l«i ®µi*****************************
function WhichArenaBegin()
	for i=0, 7 do
		if (IsArenaBegin(i) == 1) then
			return 1;
		end;
	end;
	return 0;
end;
--*************************Vµo ®Êu tr­êng*****************************************
function PreEnterGame()
	TongName, result = GetTong()
	if (TongName ~= "") then
		for i = 0, 7 do
			if (IsArenaBegin(i) == 1) then
				Tong1, Tong2 = GetArenaBothSides(i);			--LÊy tªn 2 bang l«i ®µi
				if (Tong1 == TongName or Tong2 == TongName) then
					EnterBattle(i);
					return
				end;
			end;
		end;
	end;
	EnterGame();
end
function EnterGame()
	ExtraArenaInfo = {"(Kho¶ng trèng) ", "(Kho¶ng trèng) ", "(Kho¶ng trèng) ", "(Kho¶ng trèng) ", "(Kho¶ng trèng) ", "(Kho¶ng trèng) ", "(Kho¶ng trèng) ", "(Kho¶ng trèng) "};
	for i = 0, 7 do
		if (IsArenaBegin(i) == 1) then
			Tong1, Tong2 = GetArenaBothSides(i);
			ExtraArenaInfo[i + 1] = " ("..Tong1.." vs "..Tong2..") "
		end;
	end;

	Say("B¹n muèn vµo c«ng thµnh chiÕn dù tuyÓn thi ®Êu l«i ®µi kh«ng??", 9, "L«i ®µi 1"..ExtraArenaInfo[1].."/EnterBattle", "L«i ®µi 2"..ExtraArenaInfo[2].."/EnterBattle", "L«i ®µi 3"..ExtraArenaInfo[3].."/EnterBattle", "L«i ®µi 4"..ExtraArenaInfo[4].."/EnterBattle", "L«i ®µi 5"..ExtraArenaInfo[5].."/EnterBattle", "L«i ®µi 6"..ExtraArenaInfo[6].."/EnterBattle", "L«i ®µi 7"..ExtraArenaInfo[7].."/EnterBattle", "L«i ®µi 8"..ExtraArenaInfo[8].."/EnterBattle","Kh«ng ®i n÷a/OnCancel");
end
function EnterBattle(nBattleId)

	if (IsArenaBegin(nBattleId) ~= 1) then 
		return 
	end;

	SetFightState(0)
	M,X,Y = GetWorldPos();
	SetTask(300, M);
	SetTask(301, X);
	SetTask(302, Y);
	NewWorld(MapTab[nBattleId + 1][1], MapTab[nBattleId + 1][2], MapTab[nBattleId + 1][3]);
end
--*****************************H­íng dÉn**********************************************
function OnHelp()
	Talk(8, "",	"L«i ®µi bang héi lµ n¬i häc hái vâ nghÖ gi÷a c¸c bang héi trªn giang hå! §©y sÏ lµ n¬i thi ®Êu c«ng b»ng",	"Muèn tham gia L«i ®µi bang héi, tr­íc hÕt ph¶i gÆp ta ®Ó xin phÐp! Ng­êi xin phÐp ph¶i lµ bang chñ cña bang héi thi ®Êu!",	"Sau khi tæ ®éi, ®éi tr­ëng 2 bªn sÏ ®Õn b¸o danh. Bang chñ hai bªn  mçi ng­êi ph¶i ®Æt c­îc thi ®Êu <color=yellow>100 v¹n l­îng<color>. ",	"Sau khi ®Æt c­îc xong, xin phÐp thi ®Êu ®· hoµn thµnh. Trong lóc cã 2 bang héi kh¸c ®ang thi ®Êu, kh«ng cho phÐp b¸o danh",	"Xin phÐp thµnh c«ng xong, thµnh viªn cña hai bang héi cã <color=yellow>10 phót<color> gia nhËp ®Êu tr­êng. Sau ®ã thi ®Êu sÏ chÝnh thøc b¾t ®Çu!" ,"Th¾ng b¹i phô thuéc vµo ®iÓm tÝch lòy thi ®Êu cña hai bªn. Mçi thµnh viªn bang héi lµm träng th­¬ng ®èi ph­¬ng sÏ ®­îc 3 ®iÓm, ®èi ph­¬ng bÞ trõ 1 ®iÓm", 	"KÕt thóc thi ®Êu, bang héi nµo tÝch lòy ®iÓm cao h¬n sÏ giµnh th¾ng lîi!",	"Ngoµi ra, trong lóc thi ®Êu mét bªn nµo kh«ng cßn thµnh viªn nµo ë l¹i ®Êu tr­êng th× th¾ng lîi sÏ thuéc vÒ bªn kia. ","Bang héi chiÕn th¾ng cã thÓ thu håi <color=yellow>100 v¹n l­îng<color> ®· ®ãng, ngoµi ra cßn ®­îc <color=yellow>80 v¹n l­îng<color> tiÒn th­ëng vµ <color=yellow>12.000 ®iÓm kinh nghiÖm bang héi<color>. Bang héi thua cuéc sÏ kh«ng lÊy l¹i ®­îc tiÒn ®· ®ãng, mµ cßn bÞ trõ <color=yellow>14.000 ®iÓm kinh nghiÖm bang héi<color>");
end;




function SignupACity(sel)
	CityID = sel + 1;
	if (IsSigningUp(CityID) == 1) then
		SetTaskTemp(15, CityID);
		AskClientForNumber("SignUpFinal", 1000000, 99999999, "Xin nhËp sè tiÒn ®Êu thÇu vµo:");
	else
		Say("<color=yellow>"..GetCityAreaName(CityID).."<color> thµnh, b¸o danh trËn L«i ®µi ch­a b¾t ®Çu ", 0);
	end;
end;