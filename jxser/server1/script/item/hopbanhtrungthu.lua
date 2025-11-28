Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\task\\task_addplayerexp.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
IncludeLib("ITEM")

function main()
	AddOwnExp(5000000);
	PickUp_haohangx_2()
end;





tb_Mareial_haohang_khoa = 
{
	100000,
	{
						{G=6,D=1,P=2527,LV=1,nExpiredTime=43200,szname="Håi Thiªn T¸i T¹o LÔ Bao ",nrate=0.085}, 
						{G=6,D=1,P=4822,LV=1,szname="Tö Tinh Kho¸ng Th¹ch",nrate=0.070},
						--{G=6,D=1,P=2125,LV=1,szname="Ngò Hµnh Kú Th¹ch",nrate=0.0098},  
						{G=6,D=1,P=71,nrate=0.010,szname="Tiªn Th¶o Lé",nExpiredTime=43200,},	
						{G=6,D=1,P=2975,LV=1,nExpiredTime=43200,szname="Tèc HiÖu B¹ch C©u Hoµn cÊp 150",nrate=0.045}, 	
						{G=0,D=11,P=647,LV=1,nExpiredTime=43200,szname="MÆt n¹ chiÕn tr­êng V­¬ng Gi¶",nrate=0.0018},
						{G=0,D=11,P=806,LV=1,nExpiredTime=43200,szname="MÆt n¹ chiÕn tr­êng Th¸nh Gi¶",nrate=0.0012},
						{G=0,D=11,P=828,LV=1,nExpiredTime=43200,szname="MÆt n¹ chiÕn tr­êng B¸ Gi¶",nrate=0.0010},
						{G=0,D=11,P=817,LV=1,nExpiredTime=43200,szname="MÆt n¹ chiÕn tr­êng Hoµng Gi¶",nrate=0.0001},
	
						{G=6,D=1,P=4809,LV=1,szname="§»ng Long Hån"	 ,nrate=0.0021	},
						{G=6,D=1,P=4810,LV=1,szname="§»ng Long HuyOt"	 ,nrate=0.0018	}, 
						{G=6,D=1,P=4811,LV=1,szname="§»ng Long Th¹ch ",nrate=0.0015}, 
						{G=6,D=1,P=26,LV=1,szname="Vâ L©m MËt TÞch"	 ,nrate=0.0014	},		
						{G=6,D=1,P=22,LV=1,szname="TÈy Tñy Kinh"	 ,nrate=0.0013},	
						{G=6,D=1,P=4841,LV=1,szname="§å Phæ Tinh S­¬ng H¹ng Liªn",nrate=0.0024	},
					
						{G=6,D=1,P=4836,LV=1,szname="§å Phæ Tinh S­¬ng Kh«i",nrate=0.0096},
						{G=6,D=1,P=4843,LV=10,szname="§å Phæ Tinh S­¬ng Th­îng Giíi",nrate=0.0005},
						{G=6,D=1,P=4840,LV=10,szname="§å Phæ Tinh S­¬ng Hé UyÓn"	 ,nrate=0.007	},
						{G=6,D=1,P=4839,LV=10,szname="§å Phæ Tinh S­¬ng Yªu §¸i",nrate=0.006},
						{G=6,D=1,P=4837,LV=10,szname="§å Phæ Tinh S­¬ng Y"	 ,nrate=0.0002	},						
						{G=6,D=1,P=4845,LV=10,szname="§å Phæ Tinh S­¬ng KhU Giíi",nrate=0.001},
						{G=6,D=1,P=4838,LV=10,szname="§å Phæ Tinh S­¬ng Hµi",nrate=0.0007},
								
						{G=6,D=1,P=3008,LV=10,szname="Ngò Linh Quy Nguyªn Phï",nrate=0.06	},	
						{G=6,D=1,P=2125,LV=10,szname="Ngò Hµnh Kú Th¹ch",nrate=0.06	},				
						{G=6,D=1,P=4842,LV=10,szname="§å Phæ Tinh S­¬ng Ngäc Béi",nrate=0.006},		
						{G=6,D=1,P=4844,LV=10,szname="§å Phæ Tinh S­¬ng H¹ Giíi",nrate=0.0005},	
						{G=6,D=1,P=4858,LV=10,szname="NguyÖt KhuyOt Tinh Th¹ch",nrate=0.005},	
						{G=6,D=1,P=4859,LV=10,szname="NguyÖt KhuyOt Th¹ch",nrate=0.005},	
						{G=6,D=1,P=4847,LV=10,szname="Tinh S­¬ng Th¹ch",nrate=0.005},	
						{G=6,D=1,P=4846,LV=10,szname="HuyÒn ThiOt",nrate=0.005},	
						
				
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