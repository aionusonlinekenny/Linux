Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\task\\task_addplayerexp.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_event\\ngusackettinh\\head.lua")
Include("\\script\\vng_event\\ngusackettinh\\item\\star_head.lua")
IncludeLib("ITEM")

TSK_USED = 5229	

NDAILYTIME = 20

tbNSKT_star_happiness = {}

function main()

	if(tbNSKT_Item_Star:checkCondition() == 0)then
		Talk(1, "", "B¹n kh«ng ®ñ ®iÒu kiÖn sö dông vËt phÈm! Yªu cÇu cÊp ®é trªn 50 ")
		return 1
	end


	
	local szFailMsg = format("Mçi ngµy mçi nh©n vËt chØ cã thÓ sö dông nhiÒu nhÊt   %d socola lo¹i 1, ®îi ngµy mai h·y sö dông tiÕp",NDAILYTIME)	
	if PlayerFunLib:CheckTaskDaily(TSK_USED, NDAILYTIME, szFailMsg, "<") == 1 then
		PlayerFunLib:AddTaskDaily(TSK_USED, 1) 
		tbAwardTemplet:Give(tbAward, 1, {"ngusackettinh", "use_star_happiness"} )
			PickUp_haohangx_2()
			
	local tbAward = {
		{nExp_tl=1,nCount = 1200000,},
		}
		return 0
	end
	
	
	
	return 1
end




tb_Mareial_haohang_khoa = 
{
	100000,
	{
						{G=6,D=1,P=2527,LV=1,nExpiredTime=43200,szname="Håi Thiªn T¸i T¹o LÔ Bao ",nrate=0.085}, 
						{G=6,D=1,P=2975,LV=1,nExpiredTime=43200,szname="Tèc HiÖu B¹ch C©u Hoµn cÊp 150",nrate=0.045}, 
						{G=6,D=1,P=4822,LV=1,szname="Tö Tinh Kho¸ng Th¹ch",nrate=0.070},
						{G=0,D=11,P=647,LV=1,nExpiredTime=43200,szname="MÆt n¹ chi?n tr­êng V­¬ng Gi¶",nrate=0.0018},
						{G=0,D=11,P=806,LV=1,nExpiredTime=43200,szname="MÆt n¹ chi?n tr­êng Th¸nh Gi¶",nrate=0.0012},
						{G=0,D=11,P=828,LV=1,nExpiredTime=43200,szname="MÆt n¹ chi?n tr­êng B¸ Gi¶",nrate=0.0010},
						{G=0,D=11,P=817,LV=1,nExpiredTime=43200,szname="MÆt n¹ chi?n tr­êng Hoµng Gi¶",nrate=0.0001},
						{G=6,D=1,P=71,nrate=0.010,szname="Tiªn Th¶o Lé",nExpiredTime=43200,},					
	
						{G=6,D=1,P=4809,LV=1,szname="§»ng Long Hån"	 ,nrate=0.0021	},
						{G=6,D=1,P=4810,LV=1,szname="§»ng Long HuyOt"	 ,nrate=0.0018	}, 
						{G=6,D=1,P=4811,LV=1,szname="§»ng Long Th¹ch ",nrate=0.0015}, 
						{G=6,D=1,P=26,LV=1,szname="Vâ L©m MËt TÞch"	 ,nrate=0.0014	},		
						{G=6,D=1,P=22,LV=1,szname="TÈy Tñy Kinh"	 ,nrate=0.0013},	
						{G=6,D=1,P=4848,LV=1,szname="§å Phæ NguyÖt KhuyOt H¹ng Liªn",nrate=0.0024	},
					
						{G=6,D=1,P=4849,LV=1,szname="§å Phæ NguyÖt KhuyOt Kh«i",nrate=0.0096},
						{G=6,D=1,P=4850,LV=10,szname="§å Phæ NguyÖt KhuyOt Th­îng Giíi",nrate=0.0005},
						{G=6,D=1,P=4851,LV=10,szname="§å Phæ NguyÖt KhuyOt Hé UyÓn"	 ,nrate=0.007	},
						{G=6,D=1,P=4852,LV=10,szname="§å Phæ NguyÖt KhuyOt Yªu §¸i",nrate=0.006},
						{G=6,D=1,P=4853,LV=10,szname="§å Phæ NguyÖt KhuyOt Y"	 ,nrate=0.0002	},						
						{G=6,D=1,P=4854,LV=10,szname="§å Phæ NguyÖt KhuyOt Vò KhÝ",nrate=0.001},
						{G=6,D=1,P=4855,LV=10,szname="§å Phæ NguyÖt KhuyOt Hµi",nrate=0.0007},
						
								
						{G=6,D=1,P=3008,LV=10,szname="Ngò Linh Quy Nguyªn Phï",nrate=0.06	},	
						{G=6,D=1,P=2125,LV=10,szname="Ngò Hµnh Kú Th¹ch",nrate=0.06	},	
						{G=6,D=1,P=4856,LV=10,szname="§å Phæ NguyÖt KhuyOt Béi",nrate=0.006},		
						{G=6,D=1,P=4857,LV=10,szname="§å Phæ NguyÖt KhuyOt H¹ Giíi",nrate=0.0005},	
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
				AddOwnExp(5000000);
				Msg2Player(format("B¹n nhËn ®­îc 1 <color=yellow>%s<color>",szitemname))
				WriteLog(format("[zhongqiu2007]\t Date:%s\t Account:%s\t Name:%s\t GetItem:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szitemname));
				return 0
			end
		end
		return 0;
end