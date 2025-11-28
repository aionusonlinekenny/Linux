Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\droptemplet.lua")
tbMazeExtAward = {};
tbMazeExtAward.	tbTSK_GetBaoRuong = 3076;
tbMazeExtAward.tbExpAward = {szName = "§iÓm Kinh NghiÖm", nExp = 2e6}
tbMazeExtAward.tbServerAward = {-- Phan thuong server cu
	[1] = {
		{szName = "§iÓm Kinh NghiÖm", nExp = 10e6},
	},
	[2] = {
			{{szName="§å Phæ Tinh S­¬ng Kh«i",tbProp={6,1,4836,1,0,0},nCount=1,nRate=3},},
			{{szName="§å Phæ Tinh S­¬ng Y",tbProp={6,1,4837,1,0,0},nCount=1,nRate=3},},
			{{szName="§å Phæ Tinh S­¬ng Hµi",tbProp={6,1,4838,1,0,0},nCount=1,nRate=3},},
			{{szName="§å Phæ Tinh S­¬ng Yªu §¸i",tbProp={6,1,4839,1,0,0},nCount=1,nRate=3},},
			{{szName="§å Phæ Tinh S­¬ng Hé UyÓn",tbProp={6,1,4840,1,0,0},nCount=1,nRate=3},},
			{{szName="§å Phæ Tinh S­¬ng H¹ng Liªn",tbProp={6,1,4841,1,0,0},nCount=1,nRate=3},},
			{{szName="§å Phæ Tinh S­¬ng Ngäc Béi",tbProp={6,1,4842,1,0,0},nCount=1,nRate=3},},
			{{szName="§å Phæ Tinh S­¬ng Th­îng Giíi",tbProp={6,1,4843,1,0,0},nCount=1,nRate=3},},
			{{szName="§å Phæ Tinh S­¬ng H¹ Giíi",tbProp={6,1,4844,1,0,0},nCount=1,nRate=3},},
			{{szName="§å Phæ Tinh S­¬ng KhU Giíi",tbProp={6,1,4845,1,0,0},nCount=1,nRate=1},},
			{{szName="HuyÒn ThiOt",tbProp={6,1,4846,1,0,0},nCount=1,nRate=0.25},},
			{{szName="§å Phæ NguyÖt KhuyOt H¹ng Liªn",tbProp={6,1,4848,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.25},},
			{{szName="§å Phæ NguyÖt KhuyOt Kh«i",tbProp={6,1,4849,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.25},},
			{{szName="§å Phæ NguyÖt KhuyOt Th­îng Giíi",tbProp={6,1,4850,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.25},},
			{{szName="§å Phæ NguyÖt KhuyOt Hé UyÓn",tbProp={6,1,4851,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.25},},
			{{szName="§å Phæ NguyÖt KhuyOt Yªu §¸i",tbProp={6,1,4852,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.25},},
			{{szName="§å Phæ NguyÖt KhuyOt Hµi",tbProp={6,1,4855,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.25},},
			{{szName="§å Phæ NguyÖt KhuyOt H¹ Giíi",tbProp={6,1,4856,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=0.25},},
			{{szName="§å Phæ NguyÖt KhuyOt Béi",tbProp={6,1,4857,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.125},},
			{{szName="Tinh S­¬ng Th¹ch",tbProp={6,1,4847,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.125},},
			{{szName="§å Phæ NguyÖt KhuyOt Vò KhU",tbProp={6,1,4854,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.0625},},
			{{szName="Hµnh HiÖp LÖnh",tbProp={6,1,2566,1,0,0},nCount=5,nRate=52},},
			{{szName="NguyÖt KhuyOt Tinh Th¹ch",tbProp={6,1,4858,1,0,0},nCount=1,nRate=1},},
			{{szName="NguyÖt KhuyOt Th¹ch",tbProp={6,1,4859,1,0,0},nCount=1,nRate=2},},
			{{szName="Thanh C©u Th¹ch",tbProp={6,1,2710,1,0,0},nCount=1,nRate=2},},
			{{szName="§»ng Long Hån",tbProp={6,1,4809,1,0,0},nCount=1,nRate=0.013},},
			{{szName="§»ng Long Th¹ch",tbProp={6,1,4810,1,0,0},nCount=1,nRate=0.0125},},
			{{szName="§»ng Long HuyÕt",tbProp={6,1,4811,1,0,0},nCount=1,nRate=0.0125},},
		

	},		
}
function tbMazeExtAward:MazeBossAward(mate)
	local nOldPlayer = PlayerIndex
	PlayerIndex = mate.m_PlayerIndex
	tbAwardTemplet:Give(self.tbServerAward[2], 1, {"KiemGiaMeCung", "KillBossLongCuuThienAward"})
	PlayerIndex = nOldPlayer
end

function tbMazeExtAward:_Message(CaptainName)
	local strMessage = format("Tæ ®éi cña <color=green> %s <color>®· tiªu diÖt thµnh c«ng Boss Long Cöu Thiªn t¹i ThÝ KiÕm Cèc",CaptainName)
	AddGlobalNews(strMessage)
	local handle = OB_Create();
	ObjBuffer:PushObject(handle, strMessage)
	RemoteExecute("\\script\\event\\msg2allworld.lua", "broadcast", handle)
	OB_Release(handle)
end

function tbMazeExtAward:MazeStepFinishAward(mate)
		local tbMazeAward = {
			{szName="B¶o R­¬ng KiÕm Gia",tbProp={6,1,30203,1,0,0},nCount=1},
		}
		local nOldPlayer = PlayerIndex
		PlayerIndex = mate.m_PlayerIndex
		if PlayerFunLib:CheckTaskDaily(self.tbTSK_GetBaoRuong, 5, format("H«m nay ng­¬i ®· nhËn<color=yellow> 5 <color>lÇn phÇn th­ëng nµy, kh«ng thÓ nhËn thªm."), "<") then
			PlayerFunLib:AddTaskDaily(self.tbTSK_GetBaoRuong, 1)
			tbAwardTemplet:Give(tbMazeAward, 1, {"KiemGiaMeCung", "KillBossAward"})
		end	
		PlayerIndex = nOldPlayer
end
