Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_event\\change_request_baoruong\\exp_award.lua")

tbKG_Key_Require = {
	["chiakhoanhuy"] = {6, 1, 2744},
	["chiakhoavang"] = {6, 1, 30191},
}
tbKG_Box_Award = 
{
	["chiakhoanhuy"] = 
	{
		{szName="§iÓm kinh nghiÖm 1", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(1000000, "B¶o R­¬ng KiÕm Gia")
					end,
					nRate = 52,
		},
		{szName="§iÓm kinh nghiÖm 2", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(2000000, "B¶o R­¬ng KiÕm Gia")
					end,
					nRate = 30,
		},
		{szName="§iÓm kinh nghiÖm 3", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(3000000, "B¶o R­¬ng KiÕm Gia")
					end,
					nRate = 10,
		},
		{szName="§iÓm kinh nghiÖm 4", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(4000000, "B¶o R­¬ng KiÕm Gia")
					end,
					nRate = 5,
		},
		{szName="§iÓm kinh nghiÖm 5", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(5000000, "B¶o R­¬ng KiÕm Gia")
					end,
					nRate = 3,
		},		
	},	
	["chiakhoavang"] = 
	{
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
		{szName="§iÓm kinh nghiÖm 1", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(6000000, "B¶o R­¬ng KiÕm Gia")
					end,
					nRate = 81.118,
		},
		{szName="§iÓm kinh nghiÖm 2", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(12000000, "B¶o R­¬ng KiÕm Gia")
					end,
					nRate = 5,
		},
		{szName="§iÓm kinh nghiÖm 3", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(20000000, "B¶o R­¬ng KiÕm Gia")
					end,
					nRate = 3,
		},
		{szName="§iÓm kinh nghiÖm 4", 
					pFun = function (tbItem, nItemCount, szLogTitle)
						%tbvng_ChestExpAward:ExpAward(50000000, "B¶o R­¬ng KiÕm Gia")
					end,
					nRate = 0.5,
		},	
	},
}

nWidth = 1
nHeight = 1
nFreeItemCellLimit = 1

function main(nIndexItem)	
	local tbKey1 = tbKG_Key_Require["chiakhoanhuy"]
	local tbKey2 = tbKG_Key_Require["chiakhoavang"]
	local nCount1 = CalcItemCount(3, tbKey1[1], tbKey1[2], tbKey1[3], -1) 
	local nCount2 = CalcItemCount(3, tbKey2[1], tbKey2[2], tbKey2[3], -1) 
	if nCount1 == 0 and nCount2 == 0 then
		Say("CÇn ph¶i cã Ch×a Khãa Vµng hoÆc Ch×a Khãa Nh­ ý míi cã thÓ më ®­îc B¶o R­¬ng KiÕm Gia", 1, "§ãng/no")
		return 1
	end

	if CountFreeRoomByWH(nWidth, nHeight, nFreeItemCellLimit) < nFreeItemCellLimit then
		Say(format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", nFreeItemCellLimit, nWidth, nHeight))
		return 1
	end	
	local tbOpt = {}
	if nCount1 ~= 0 then
		tinsert(tbOpt,format("Sö dông Ch×a khãa nh­ ý/#VnKGBoxNewAward(%d, '%s')", nIndexItem, "chiakhoanhuy"))
	end
	if nCount2 ~= 0 then
		tinsert(tbOpt,format("Sö dông Ch×a khãa vµng/#VnKGBoxNewAward(%d, '%s')", nIndexItem, "chiakhoavang"))
	end
	if getn(tbOpt) > 0 then
		tinsert(tbOpt, "§ãng/Oncancel")
		Say("Sö dông ch×a khãa ®Ó më r­¬ng:", getn(tbOpt), tbOpt)
	end
	return 1
end

function Oncancel()end

function VnKGBoxNewAward(nItemIdx, strKeyType)
	print("strKeyType: ",strKeyType)
	local tbKey = tbKG_Key_Require[strKeyType]
	local tbAward = tbKG_Box_Award[strKeyType]
	if not tbKey or not tbAward then
		return
	end
	if ConsumeItem(3, 1, tbKey[1], tbKey[2], tbKey[3], -1) ~= 1 then
		Say("CÇn ph¶i cã Ch×a Khãa Vµng hoÆc Ch×a Khãa Nh­ ý míi cã thÓ më ®­îc B¶o R­¬ng KiÕm Gia", 1, "§ãng/no")
		return
	end
	
	if ConsumeItem(3, 1, 6, 1, 30203, -1) ~= 1 then
		Say("Kh«ng t×m thÊy B¶o R­¬ng KiÕm Gia", 1, "§ãng/no")
		return
	end	
	tbAwardTemplet:Give(tbAward, 1, {"KiemGiaMeCung", "SuDungBaoRuongKiemGia"})	
end 
