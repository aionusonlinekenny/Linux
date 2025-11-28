Include("\\script\\dailogsys\\dailogsay.lua");

tbTrangBi={
	[1]={
		szName = "Vò KhÝ",
		tbEquip={
			{"HuyÒn ThiÕt KiÕm",0,0,0},
			{"§¹i Phong §ao",0,0,1},
			{"Kim C« Bæng",0,0,2},
			{"Ph¸ Thiªn KÝch",0,0,3},
			{"Ph¸ Thiªn chïy",0,0,4},
			{"Th«n NhËt Tr·m",0,0,5},
			{"B¸ V­¬ng Tiªu",0,1,0},
			{"To¸i NguyÖt §ao",0,1,1},
			{"Khæng T­íc Linh",0,1,2},
		}
	},	
	[2]={
		szName = "D©y ChuyÒn",
		tbEquip={
			{"Toµn th¹ch h¹ng liªn",0,4,0},
			{"Lôc PhØ Thóy Hé Th©n phï ",0,4,1},
		}
	},
	[3]={
		szName = "¸o Gi¸p",
		tbEquip={
			{"ThÊt B¶o Cµ Sa",0,2,0},
			{"Ch©n Vò Th¸nh Y",0,2,1},
			{"Thiªn NhÉn MËt Trang",0,2,2},
			{"Gi¸ng Sa Bµo",0,2,3},
			{"§­êng Nghª gi¸p",0,2,4},
			{"V¹n L­u Quy T«ng Y",0,2,5},
			{"TuyÒn Long bµo",0,2,6},
			{"Long Tiªu ®¹o Y",0,2,8},
			{"Cöu VÜ B¹ch Hå trang",0,2,9},
			{"TrÇm H­¬ng sam",0,2,10},
			{"TÝch LÞch Kim Phông gi¸p",0,2,11},
			{"V¹n Chóng TÒ T©m Y",0,2,12},
			{"L­u Tiªn QuÇn",0,2,13},
		}
	},
	[4]={
		szName = "§ai L­ng",
		tbEquip={
			{"Thiªn Tµm Yªu §¸i",0,6,0},
			{"B¹ch Kim Yªu §¸i",0,6,1},
		}
	},
	[5]={
		szName = "Giµy",
		tbEquip={
			{"Cöu TiÕt X­¬ng VÜ Ngoa",0,5,0},
			{"Thiªn Tµm Ngoa",0,5,1},
			{"Kim Lò hµi",0,5,2},
			{"Phi Phông Ngoa",0,5,3},
		}
	},
	[6]={
		szName = "Bao Tay",
		tbEquip={
			{"Long Phông HuyÕt Ngäc Tr¹c",0,8,0},
			{"Thiªn Tµm Hé UyÓn",0,8,1},
		}
	},
	[7]={
		szName = "Nãn",
		tbEquip={
			{"Tú L« m·o",0,7,0},
			{"Ngò l·o qu¸n",0,7,1},
			{"Tu La Ph¸t kÕt",0,7,2},
			{"Th«ng Thiªn Ph¸t Qu¸n",0,7,3},
			{"YÓm NhËt kh«i",0,7,4},
			{"TrÝch Tinh hoµn",0,7,5},
			{"¤ Tµm M·o",0,7,6},
			{"Quan ¢m Ph¸t Qu¸n",0,7,7},
			{"¢m D­¬ng V« Cùc qu¸n",0,7,8},
			{"HuyÒn Tª DiÖn Tr¸o",0,7,9},
			{"Long HuyÕt §Çu hoµn",0,7,10},
			{"Long L©n Kh«i",0,7,11},
			{"Thanh Tinh Thoa",0,7,12},
			{"Kim Phông TriÓn SÝ ",0,7,13},
		}
	},	
	[8]={
		szName = "Ngäc Béi",
		tbEquip={
			{"Long Tiªn H­¬ng Nang",0,9,0},
			{"D­¬ng Chi B¹ch Ngäc",0,9,1},
		}
	},	
	[9]={
		szName = "NhÉn",
		tbEquip={
			{"Toµn Th¹ch Giíi ChØ ",0,3,0},
		}
	},	
}

tbMagic_VuKhi={
	[0]={ --Kim
		{"STVL ngo¹i c«ng ®iÓm", 220},
		{"STVL néi c«ng ®iÓm", 440},
		{"Kh¸ng §éc", 290},
		--{"T¨ng ®¼ng cÊp kü n¨ng hÖ Kim", 390},
	},		
	[1]={ --Méc
		{"§éc s¸t ngo¹i c«ng", 230},
		{"§éc s¸t néi c«ng", 480},
		{"Kh¸ng L«i", 320},
		{"Thêi gian phôc håi", 90},
		--{"T¨ng ®¼ng cÊp kü n¨ng hÖ Méc", 410},
	},
	[2]={ --Thuû
		{"B¨ng s¸t ngo¹i c«ng", 240},
		{"B¨ng s¸t néi c«ng", 450},
		{"Kh¸ng Ho¶", 310},
		{"Thêi gian cho¸ng", 340},
		--{"T¨ng ®¼ng cÊp kü n¨ng hÖ Thuû", 400},
	},
	[3]={ --Ho¶
		{"Ho¶ s¸t ngo¹i c«ng", 250},
		{"Ho¶ s¸t néi c«ng", 460},		
		{"Thêi gian lµm chËm", 360},
		--{"T¨ng ®¼ng cÊp kü n¨ng hÖ Ho¶", 420},
	},
	[4]={ --Thæ
		{"L«i s¸t ngo¹i c«ng", 260},
		{"L«i s¸t néi c«ng", 470},
		{"Kh¸ng B¨ng", 300},		
		{"Thêi gian tróng §éc", 380},
		--{"T¨ng ®¼ng cÊp kü n¨ng hÖ Thæ", 430},
	},
}

tbMagic_TrangPhuc={
	[0]={ --Kim
		{"Kh¸ng §éc", 290},
		{"Ph¶n ®ßn cËn chiÕn", 80},
	},		
	[1]={ --Méc
		{"Kh¸ng L«i", 320},
		{"Thêi gian phôc håi", 90},
	},
	[2]={ --Thuû
		{"Kh¸ng Ho¶", 310},
		{"Thêi gian cho¸ng", 340},
	},
	[3]={ --Ho¶		
		{"Phßng thñ VËt lý", 280},
		{"Thêi gian lµm chËm", 360},
	},
	[4]={ --Thæ
		{"Kh¸ng B¨ng", 300},
		{"Thêi gian tróng §éc", 380},
	},
}

tbMagic_All={
	[1]={ --Vò KhÝ
		{"Sinh lùc", 150},
		{"Néi lùc", 160},
		--{"Kh«ng thÓ ph¸ huû", 50},
		{"ChuyÓn ho¸ s¸t th­¬ng thµnh néi lùc", 270},
		{"STVL ngo¹i c«ng (%)", 10},
		{"Tèc ®é ®¸nh ngo¹i c«ng", 30},
		{"TØ lÖ c«ng kÝch chÝnh x¸c", 20},
		{"T¨ng ph¹m vi s¸t th­¬ng", 100},
		--{"Kü n¨ng vèn cã", 110},
		{"Bá qua nÐ tr¸nh", 40},
		{"Hót sinh lùc", 130},
		{"Hót néi lùc", 140},		
	},
	[2]={ --Trang bÞ
		{"Sinh lùc", 150},
		{"Néi lùc", 160},
		--{"Kh«ng thÓ ph¸ huû", 50},
		--{"Kü n¨ng vèn cã", 110},
		{"ChuyÓn ho¸ s¸t th­¬ng thµnh néi lùc", 270},
		{"Phôc håi sinh lùc mçi nöa gi©y", 180},
		{"Tèc ®é di chuyÓn (GiÇy)", 70},		
		{"TØ lÖ c«ng kÝch chÝnh x¸c", 20},		
		{"Kh¸ng tÊt c¶", 120},
		{"Sinh khÝ", 330},		
		{"Søc m¹nh", 210},
		{"Th©n ph¸p", 370},	
		{"May m¾n", 350},
		
	},
}

tb5hanh = {
	[0]={"Kim","yellow"},				
	[1]={"Méc","green"},
	[2]={"Thuû","blue"},
	[3]={"Ho¶","red"},
	[4]={"Thæ","orange"}
}

tbCheTao = {
	nItemId = 0,
	szName = "",
	nGenre = 0,
	nDetail = 0,
	nPart = 0,
	nSeries = 0,
	tbOptions = {}
}

function main()
	dofile("script/global/gm/julianv/npc/npc_dotim.lua")
	MAIN_TITLE = "<npc>Xin chµo <bclr=red>"..GetName().."<bclr>!"
	local szTitle = MAIN_TITLE.." C¸c h¹ muèn chÕ t¹o <bclr=pink>®å tÝm<bclr> ch¨ng?"
	local tbOpt = {}
	for i,tb in tbTrangBi do
		tinsert(tbOpt, {i..". "..tb.szName,PurpleItem_diaglog,{i}})
	end	
	tinsert(tbOpt, {"KÕt thóc ®èi tho¹i",no})
	
	CreateNewSayEx(szTitle, tbOpt)
end

function PurpleItem_diaglog(num)	
	MAIN_TITLE = MAIN_TITLE.."\n§ang chÕ t¹o <bclr=pink>"..tbTrangBi[num].szName.."<bclr>"
	local tbOpt = {}	
	for id,item in tbTrangBi[num].tbEquip do
		local nGenre = item[2]
		local nDetail = item[3]
		local nPart = item[4]
		tinsert(tbOpt, {item[1], getItemSeries, {num, id, nGenre, nDetail, nPart}})
	end
		tinsert(tbOpt, {"Tho¸t",no})
	CreateNewSayEx(MAIN_TITLE, tbOpt)
end

function getItemSeries(nID, nItemId, nGenre, nDetail, nPart)
	tbCheTao.nItemId = nID
	tbCheTao.szName = tbTrangBi[nID].tbEquip[nItemId][1]
	tbCheTao.nGenre = nGenre
	tbCheTao.nDetail = nDetail	
	tbCheTao.nPart = nPart	
	MAIN_TITLE = MAIN_TITLE.."\n(+)Tªn trang bÞ: <bclr=violet>"..tbCheTao.szName.."<bclr>"	
	local szTitle = MAIN_TITLE.."\n(+)Chän ngò hµnh:"
	local tbOpt = {
		{"Kim", getLine, {1,0}},				
		{"Méc", getLine, {1,1}},
		{"Thuû", getLine, {1,2}},
		{"Ho¶", getLine, {1,3}},
		{"Thæ", getLine, {1,4}},
		{"Tho¸t",no}
	}		
	CreateNewSayEx(szTitle, tbOpt)	
	
end
	
function getLine(nLine, nSeries, tbLineOpt)	
	tbCheTao.nSeries = nSeries
	if nLine == 1 then
		MAIN_TITLE = MAIN_TITLE.."\n(+)Ngò hµnh hÖ: <color="..tb5hanh[nSeries][2]..">"..tb5hanh[nSeries][1].."<color>"
	end
	local szTitle
	local tbOpt = {}
	if tbLineOpt ~= nil then 
		tinsert(tbCheTao.tbOptions, tbLineOpt)
		Msg2Player("Dßng "..(nLine-1)..": <color=green>"..tbCheTao.tbOptions[nLine-1][1])		
	end
	if nLine <= 6 then
		szTitle = MAIN_TITLE.."\n(+)Chän dßng "..nLine..":"
		insertTable(tbOpt, nLine)		
	else
		szTitle = "<npc>ChÕ t¹o <bclr=red>"..tbCheTao.szName.." <bclr>HÖ: <color="..tb5hanh[nSeries][2]..">"..tb5hanh[nSeries][1].."<color>\n(+)C¸c dßng ®· chän:"		
		for i=1, getn(tbCheTao.tbOptions) do
			szTitle = szTitle.."\nDßng "..i..": <color=pink>"..tbCheTao.tbOptions[i][1].."<color>"
		end
		tinsert(tbOpt, {"§ång ý chÕ t¹o", CheTaoDoTim})
		tinsert(tbOpt, {"Tho¸t", no})
	end
	CreateNewSayEx(szTitle, tbOpt)
end

function insertTable(tbTable, nLine)	
	if tbCheTao.nItemId == 1 then			
		for _,optVK in tbMagic_VuKhi[tbCheTao.nSeries] do
			tinsert(tbTable, {optVK[1], getLine, {nLine+1, tbCheTao.nSeries, optVK}})
		end
		for _,opt1 in tbMagic_All[1] do
			tinsert(tbTable, {opt1[1], getLine, {nLine+1, tbCheTao.nSeries, opt1}})
		end
	else
		for _,optTP in tbMagic_TrangPhuc[tbCheTao.nSeries] do
			tinsert(tbTable, {optTP[1], getLine, {nLine+1, tbCheTao.nSeries, optTP}})
		end
		for _,opt2 in tbMagic_All[2] do
			tinsert(tbTable, {opt2[1], getLine, {nLine+1, tbCheTao.nSeries, opt2}})
		end
	end		
	tinsert(tbTable, {"Tho¸t",no})
	
end

function CheTaoDoTim()
	AddQualityItem(2, tbCheTao.nGenre, tbCheTao.nDetail, tbCheTao.nPart, 10, tbCheTao.nSeries, 500, tbCheTao.tbOptions[1][2], tbCheTao.tbOptions[2][2], tbCheTao.tbOptions[3][2], tbCheTao.tbOptions[4][2], tbCheTao.tbOptions[5][2], tbCheTao.tbOptions[6][2])
	Msg2Player("NhËn ®­îc <color=pink>"..tbCheTao.szName)
end