	-- ®óng giê h­íng mét tæ phôc vô khİ së h÷u Gameserver ph¸t hÖ thèng th«ng c¸o

	-- ViÖt h·y kh«ng g©y ra th«ng c¸o by peres 2006/05/11

	function TaskShedule()

	TaskName( "Tù ®éng tin tøc —— th«ng c¸o ");

	-- 10 phót mét lÇn

	TaskInterval(10);

	-- kh«ng thiÕt TaskTme, cßn l¹i lµ Relay khëi ®éng th× mµ b¾t ®Çu

	-- x ®iÓm y xa nhau thñy (y%10==0)

	local n_cur_h	= tonumber(date( "%H "));

	local n_cur_m	= tonumber(date( "%M "));

	if (n_cur_m > 50) then

	n_cur_h = mod((n_cur_h + 1), 24);

	end

	n_cur_m = mod((n_cur_m - mod(n_cur_m, 10) + 10), 60);

	TaskTime( n_cur_h, n_cur_m );

	TaskCountLimit(0);

	OutputMsg( " He thong thong bao tin tuc tu dong ");

	end

	g_strTipMsg =

	{

	--		"? giang hå nghe ®ån ? ®Ó nghªnh tiÕp t©n niªn, ngµy gÇn ®©y quan phñ t­¬ng tæ chøc "C¶n con cäp" tiÓu trß ch¬i, c¸c thµnh nha m«n sÏ ë 19: 00~23: 00 tæ chøc nh©n thñ khø tham dù ho¹t ®éng, tŞnh héi th­ëng cho ®ang ho¹t ®éng trung kiÖt xuÊt hiÖp sÜ, c¸c vŞ ®Õn lóc ®ã kh¶ dÜ ®¸o c¸c thµnh phè lín nha m«n sai dŞch chç b¸o danh tham gia.",

	--		"? hoa ®µo ®¶o ? ®¸o hoa ®µo Èn sÜ chç mua ? má h¹o ?, lµ ®­îc ë hoa ®µo ®¶o tu luyÖn ®ång thêi, ®µo ®­îc c¸c lo¹i bÊt ®ång cÊp bËc huyÒn tinh má! ChÕ t¹o Tö S¾c trang bŞ, tõ nay vÒ sau dÔ dµng h¬n!",

	--		"? hoa ®µo ®¶o ? hoa ®µo trªn ®¶o cã thÓ sö dông (®¹i) b¹ch c©u hoµn tiÕn hµnh ? ly tuyÕn uû trŞ ?, tu luyÖn, o¹t má l­ìng kh«ng lÇm. Hoa ®µo ®¶o tu luyÖn kinh nghiÖm d÷ ly tuyÕn uû trŞ kinh nghiÖm chång tİnh to¸n, kh«ng ¶nh h­ëng lÉn nhau",

	--		"? hoa ®µo ®¶o ? tõ thÊt thµnh phè lín ng­êi chÌo thuyÒn täa thuyÒn lµ ®­îc leo lªn hoa ®µo ®¶o, ngo¹n gia tiÕn nhËp ®¼ng cÊp kh«ng hÒ cã 50 cÊp h¹n chÕ, 5 cÊp ngo¹n gia còng cã thÓ ®µo ®­îc huyÒn tinh má; nh­ng 50 cÊp d­íi ngo¹n gia v« ph¸p thu ®­îc tu luyÖn kinh nghiÖm",

	--		-- "? hoa ®µo ®¶o ? ®· tõng mua qu¸ ch¸o mång 8 th¸ng ch¹p ngo¹n gia, tiÕn nhËp hoa ®µo ®¶o, ch¸o mång 8 th¸ng ch¹p h÷u hiÖu thêi gian tù ®éng chuyÓn hãa thµnh cã thÓ ®µo má thêi gian (tu luyÖn kinh nghiÖm kh«ng hÒ gÊp ®«i)",

	--		"? ng­êi mang tin tøc nhiÖm vô ? ngµi kh¶ dÜ ë c¸c thµnh phè lín dŞch quan chç lÜnh ®¸o hoµn toµn míi ng­êi mang tin tøc nhiÖm vô råi ~(t×nh h×nh cô thÓ vµ tØ mØ tham kiÕn quan vâng: jx. xoyo. com)",

	--		"? trang bŞ mµi mßn ®iÒu chØnh ?: Trang bŞ bÒn ®é mµi mßn ®¸o 0, tù ®éng tõ trªn ng­êi dì xuèng, biÕn thµnh < h­ hao trang bŞ > ®Ó ®Æt ë tói ®eo l­ng lı (trang bŞ kh«ng cÇn thiÕt thÊt). < h­ hao trang bŞ > nh­ng ®¸o l©m an ? thÇn bİ th­¬ng nh©n ? chç phôc håi nh­ cò",

	--		"? giang hå nghe ®ån ? cã ng­êi ph¸t hiÖn rÊt nhiÒu tuyÖt thÕ cao thñ xuÊt hiÖn ë 7 thµnh phè lín chu vi, thÕ tÊt trong chèn giang hå l¹i ®em nhÊc lªn mét håi sãng to giã lín.",

	--		"VÖ quèc chiÕn tranh chi phong háa liªn thµnh ho¹t ®éng vu mçi tuÇn thø b¶y chñ nhËt 15:00~17:00 më ra. Ngo¹n gia kh¶ dÜ ®i qua d÷ thµnh ®« phñ, T­¬ng D­¬ng phñ, l©m An phñ, §¹i Lı phñ, D­¬ng Ch©u phñ cöa thµnh thñ vÖ ®èi tho¹i tíi tham gia tèng ph­¬ng thñ thµnh chiÕn dŞch; ®i qua d÷ ph­îng t­êng phñ, BiÖn Kinh phñ cöa thµnh thñ vÖ ®èi tho¹i tíi tham gia kim ph­¬ng thñ thµnh chiÕn dŞch.",

	--		-- "? t×nh nghÜa giang hå ?12 nguyÖt 31 nhËt, ®Ö nhŞ giíi vâ l©m liªn kÕt tiÕn nhËp gi¸n ®o¹n kú. C¸c m«n ph¸i thu ®­îc tiÒn 32 danh tuyÓn thñ t­¬ng kh¶ dÜ lÜnh ®¸o bµi danh th­ëng cho. 06 niªn 1 nguyÖt 8 nhËt lÇn thø ba vâ l©m liªn kÕt gÇn b¾t ®Çu, bØ t¸i lo¹i h×nh lµ thÇy trß hai ng­êi thi ®Êu.",

	--		-- "? t×nh nghÜa giang hå ?12 nguyÖt 8 nhËt ®Ö nhŞ giíi vâ l©m liªn kÕt chİnh thøc b¾t ®Çu, bØ t¸i lo¹i h×nh vi m«n ph¸i thi ®¬n thi ®Êu, bØ t¸i kú vi 12 nguyÖt 8 nhËt -12 nguyÖt 28 nhËt, liªn kÕt sau khi kÕt thóc, tiÒn 32 danh chiÕn ®éi qu©n héi thu ®­îc phong phó bµi danh th­ëng cho. T×nh h×nh cô thÓ vµ tØ mØ thØnh tham kiÕn quan vâng th«ng c¸o vµ vâ l©m liªn kÕt t­¬ng quan giíi thiÖu.",

	--		-- "? vâng kiÕm tµi liÖu míi nhÊt phiÕn: T×nh nghÜa giang hå ?: 2005-10-31 toµn bé khu toµn bé phôc ®ång thêi më ra, kİnh xin l­u ı, t×nh h×nh cô thÓ vµ tØ mØ thØnh tham kiÕn quan vâng.",

	--		-- "? t×nh nghÜa giang hå ?: §ång b¹n hÖ thèng nhiªn t×nh më ra, ngo¹n gia kh¶ dÜ ë 7 thµnh phè lín Tr­êng Ca M«n m«n nh©n chç lÜnh ®ång b¹n nhiÖm vô! §ång thêi nh­ng ®¸o c¸c ®¹i tay míi th«n long ngò chç lÜnh ®ång b¹n néi dung vë kŞch nhiÖm vô.",

	--		"? t×nh nghÜa giang hå ?: §ång b¹n hÖ thèng nhiªn t×nh më ra, ngo¹n gia kh¶ dÜ ë 7 thµnh phè lín Tr­êng Ca M«n m«n nh©n chç lÜnh ®ång b¹n nhiÖm vô! §ång thêi nh­ng ®¸o c¸c ®¹i tay míi th«n long ngò chç lÜnh ®ång b¹n néi dung vë kŞch nhiÖm vô.",

	--		"? ngÉu nhiªn sù kiÖn hÖ thèng ?: NgÉu nhiªn sù kiÖn hÖ thèng toµn diÖn më ra, ®ång b¹n bŞ v©y triÖu ho¸n d­íi tr¹ng th¸i tøc míi cã thÓ g©y ra.",

	--		"? huy hoµng chi d¹ ho¹t ®éng ?: Huy hoµng chi d¹ ho¹t ®éng vu mçi ngµy 19:30 ®¸o 20:00, 20:30 ®¸o 22:30 ®óng giê më ra. (t×nh h×nh cô thÓ vµ tØ mØ tham kiÕn quan vâng: jx. xoyo. com)",

	--		"? thÇn bİ b¶n ®å b¶o tµng ?: ThÇn bİ b¶n ®å b¶o tµng kinh hiÖn giang hå, v« h¹n b¶o tµng ®Òu ë tr­íc m¾t. (t×nh h×nh cô thÓ vµ tØ mØ tham kiÕn quan vâng: jx. xoyo. com)",

	--		"? kú tr©n c¸c ? thuËt dŞch dung sÜ, v©n du bèn ph­¬ng th­¬ng nh©n, linh phiÕn gÇn ®©y kÕt ph­êng ®æi h¹ mét nhµ tr¨m n¨m l·o cöa hµng ——<color=yellow> kú tr©n c¸c <color>(®iÓm kİch d­íi gãc ph¶i c¸i nót), t©n xu©n trong lóc th­¬ng phÈm ­u ®·i b¸n ch¹y (­u ®·i thêi gian: 2006 niªn 1 nguyÖt 24 nhËt tíi 2 nguyÖt 7 nhËt). (t×nh h×nh cô thÓ vµ tØ mØ tham kiÕn quan vâng: jx. xoyo. com)",

	};

	-- t©n c«ng n¨ng b¸o tr­íc tin tøc

	g_nFutureDate = 2000010424;

	STR_HEAD_FUTURE = " [9 nguyÖt phong ba ho¹t ®éng ] ";

	g_strFutureMsg =

	{

	"9 nguyÖt phong ba ho¹t ®éng ®ang tiÕn hµnh, mçi ngµy, mçi tuÇn, mçi th¸ng ®Òu cã th­ëng cho chê ng­¬i. Tõ ®¸o trong thêi gian, tham gia ho¹t ®éng, tû nh­ tèng kim ®¹i chiÕn, d· tÈu nhiÖm vô, s¸t thñ nhiÖm vô ®Òu cã thÓ tèng vi tİch ph©n. Cã thÓ ®i kiÕn vâ l©m truyÒn thô cã lÏ ë trang chİnh kh¸n t×nh h×nh cô thÓ vµ tØ mØ ",

	"9 nguyÖt phong ba ho¹t ®éng ®ang tiÕn hµnh, mçi ngµy vi tİch ph©n kh¶ dÜ ®æi lÊy th­ëng cho, cô thÓ nh­ sau: Mçi tuÇn tæng vi tİch ph©n bµi danh tiÒn m­êi ngo¹n gia t­¬ng thu ®­îc chu th­ëng cho, toµn bé ho¹t ®éng trong lóc, tæng vi tİch ph©n bµi danh tiÒn m­êi, t­¬ng thu ®­îc nguyÖt th­ëng cho. Qu¸n qu©n th­ëng cho vi ®¹i m· n·o nhÉn th­ëng cho cã lÏ ngÉu nhiªn thu ®­îc mét bé ®¹i hoµng kim trang bŞ, kü n¨ng + 1!",

	"? ®iÒu chØnh b¹ch c©u hoµn giíi c¸ch: Tõ 9 nguyÖt 8 nhËt khëi, l©m an ng­êi b¸n hµng rong cã m¹i b¹ch c©u hoµn, gi¸ tiÒn lµ 1 mét ®ång tiÒn / mét: Mçi ngµy tõ 0:00 ®¸o 12:00 ly tuyÕn kinh nghiÖm vÉn nh­ cò t¨ng béi!",

	};

	function TaskContent()

	str = "";

	local ndateH 	= tonumber(date( "%H "));

	local ndateM	= tonumber(date( "%M "));

	local ndateD	= tonumber(date( "%Y%m%d "));

	if (ndateH < 21 and ndateM == 0 and ndateD >= 20090116 and ndateD < 20100216) then

	str	= "HiÖn nay vò l©m nh©n sÜ kh¶ dÜ ®¸o NPC tµi thÇn chç tÆng lÔ vµ lÜnh ph¸o hoa "

	elseif (ndateH == 21 and ndateM == 0 and ndateD >= 20090116 and ndateD < 20100216) then

	str	= "Vò l©m nh©n sÜ nhanh lªn mét chót lai lÜnh t­ëng, ®ång thêi cã c¬ héi lÜnh cµng nhiÒu may m¾n th­ëng cho!";

	else

	return

	--str = getTipMsg();

	end

	GlobalExecute(format( "dw Msg2SubWorld([[%s]])", str));

	end

	-- thñ nªu lªn tin tøc

	function getTipMsg()

	nCount = getn(g_strTipMsg);

	nIndex = random(1, nCount);

	return g_strTipMsg[nIndex];

	end

	-- thñ b¸o tr­íc tin tøc

	function getFutureMsg()

	nCurDate = tonumber(date( "%Y%m%d%H "));

	str = "";

	if (g_nFutureDate > nCurDate) then -- cã hay kh«ng ë chØ ®Şnh ngµy tr­íc, b»ng kh«ng kh«ng ph¸t

	nCount = getn(g_strFutureMsg);

	nIndex = random(1, nCount);

	str = STR_HEAD_FUTURE.. (g_strFutureMsg[nIndex]);

	end

	return str;

	end

	function GameSvrConnected(dwGameSvrIP)

	end

	function GameSvrReady(dwGameSvrIP)

	end


