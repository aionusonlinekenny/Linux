Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\task\\task_addplayerexp.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
IncludeLib("ITEM")

function main()
		 
		if CalcFreeItemCellCount() < 6 then
			CreateTaskSay({"CÇn Ýt nhÊt 6 « trèng míi cã thÓ nhËn vËt phÈm",  "§Ó ta s¾p xÕp l¹i./Cancel",});
				return 1;
			end
			local nGoldPoint = GetExtPoint(1);
			if nGoldPoint > 1500 then 
				Talk(1, "", "Max 1.500 Lóa Vµng råi, Xin h·y ®i Reset Event ®Ó nhËn th­ëng tiÕp ")				
					return 1;
				end			
				tl_addPlayerExp(5000000)
				AddExtPoint(1,1)
				PickUp_haohangx_2()			
		return 0;
	end






tb_Mareial_haohang_khoa = 
{
	100000,
	{
						{G=6,D=1,P=2527,LV=1,nExpiredTime=43200,szname="Håi Thiªn T¸i T¹o LÔ Bao ",nrate=0.085}, 
						{G=6,D=1,P=30109,LV=1,nExpiredTime=43200,szname="H¹t Thiªn TuÕ",nrate=0.075}, 
						{G=6,D=1,P=4822,LV=1,szname="Tö Tinh Kho¸ng Th¹ch",nrate=0.070},
						{G=6,D=1,P=2975,LV=1,nExpiredTime=43200,szname="Tèc HiÖu B¹ch C©u Hoµn cÊp 150",nrate=0.045}, 
						{G=0,D=11,P=647,LV=1,nExpiredTime=43200,szname="MÆt n¹ chiÕn tr­êng V­¬ng Gi¶",nrate=0.0018},
						{G=0,D=11,P=806,LV=1,nExpiredTime=43200,szname="MÆt n¹ chiÕn tr­êng Th¸nh Gi¶",nrate=0.0012},
						{G=0,D=11,P=828,LV=1,nExpiredTime=43200,szname="MÆt n¹ chiÕn tr­êng B¸ Gi¶",nrate=0.0010},
						{G=0,D=11,P=817,LV=1,nExpiredTime=43200,szname="MÆt n¹ chiÕn tr­êng Hoµng Gi¶",nrate=0.0001},
						--{G=6,D=1,P=2125,LV=1,szname="Ngò Hµnh Kú Th¹ch",nrate=0.0098},  
						{G=6,D=1,P=71,nrate=0.010,szname="Tiªn Th¶o Lé",nExpiredTime=43200,},					
	
						{G=6,D=1,P=2391,LV=1,nExpiredTime=43200,szname="Tö Ngäc"	 ,nrate=0.0021	},
						{G=6,D=1,P=2390,LV=1,nExpiredTime=43200,szname="B¹ch Ngäc"	 ,nrate=0.0018	}, 
						{G=6,D=1,P=1181,LV=1,nExpiredTime=43200,szname="Tiªn Th¶o Lé §Æc BiÖt ",nrate=0.0015}, 
						{G=6,D=1,P=26,LV=1,szname="Vâ L©m MËt TÞch"	 ,nrate=0.0014	},		
						{G=6,D=1,P=22,LV=1,szname="TÈy Tñy Kinh"	 ,nrate=0.0013},	
						{G=6,D=1,P=30226,LV=1,nExpiredTime=43200,szname="Ch×a Khãa Hoµng Kim",nrate=0.070	},
					
						{G=0,D=10,P=11,LV=10,nExpiredTime=43200,szname="Ngùa Duy Huy ",nrate=0.015},
						{G=0,D=10,P=14,LV=10,nExpiredTime=43200,szname="Kim Tinh B¹ch Hæ V­¬ng"	 ,nrate=0.0007	},
						{G=0,D=10,P=21,LV=10,nExpiredTime=43200,szname="Ngùa Phong V©n ThÇn M· ",nrate=0.0006},
						{G=0,D=10,P=15,LV=10,nExpiredTime=43200,szname="Háa Tinh Kim Hæ V­¬ng"	 ,nrate=0.0009	},						
						{G=0,D=10,P=24,LV=10,nExpiredTime=43200,szname="D­¬ng §µ",nrate=0.0001},
						{G=0,D=10,P=18,LV=10,nExpiredTime=43200,szname="H·n HuyÕt Long CÈu (Th­êng) ",nrate=0.002	},
								
						{G=0,D=10,P=25,LV=10,nExpiredTime=43200,szname="H­¬u §èm",nrate=0.006	},													
						{G=0,D=10,P=23,LV=10,nExpiredTime=43200,szname="Ngùa L¹c §µ"	 ,nrate=0.0002	},
						{G=0,D=10,P=18,LV=10,nExpiredTime=43200,szname="H·n HuyÕt Long CÈu (Th­êng) ",nrate=0.0005},	
						{G=0,D=10,P=11,LV=10,nExpiredTime=43200,szname="Ngùa Duy Huy ",nrate=0.0008	},						
						{G=0,D=10,P=21,LV=10,nExpiredTime=43200,szname="Ngùa Phong V©n ThÇn M· ",nrate=0.0003	},	
						{G=6,D=1,P=30469,LV=1,nExpiredTime=43200,szname="Phi Phong CÊp 10",nrate=0.0024},
						
				
		}
}

function PickUp_haohangx_2( nItemIndex, nPlayerIndex )
		local nrate = random(1,tb_Mareial_haohang_khoa[1]);
		local nsum = 0
		for nkey,nitem in tb_Mareial_haohang_khoa[2] do
			nsum = nsum + (nitem["nrate"] * tb_Mareial_haohang_khoa[1])
			if (nsum > nrate) then
				local g = nitem["G"];
				local d = nitem["D"];
				local p = nitem["P"];
				local p = nitem["P"];
				local l = nitem["LV"];
				local stime = nitem["nExpiredTime"]
				local nidx = tbAwardTemplet:GiveAwardByList({tbProp = {g,d,p,1,0,0}, nExpiredTime=stime}, "test", 1)			
				local szitemname = nitem["szname"]
				Msg2Player(format("B¹n nhËn ®­îc 1 <color=yellow>%s<color>",szitemname))
				WriteLog(format("[zhongqiu2007]\t Date:%s\t Account:%s\t Name:%s\t GetItem:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szitemname));
				return 0
			end
		end
		return 0;
end