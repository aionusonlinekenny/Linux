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

TSK_USED = 5232	

NDAILYTIME = 100

tbNSKT_star_happiness = {}

function main()

	if(tbNSKT_Item_Star:checkCondition() == 0)then
		Talk(1, "", "B¹n kh«ng ®ñ ®iÒu kiÖn sö dông vËt phÈm! Yªu cÇu cÊp ®é trªn 50 ")
		return 1
	end


	
	local szFailMsg = format("Mçi ngµy mçi nh©n vËt chØ cã thÓ sö dông nhiÒu nhÊt   %d socola lo¹i 4, ®îi ngµy mai h·y sö dông tiÕp",NDAILYTIME)	
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
						{G=6,D=1,P=4822,LV=1,szname="Tö Tinh Kho¸ng Th¹ch",nrate=0.070},
						--{G=6,D=1,P=2125,LV=1,szname="Ngò Hµnh Kú Th¹ch",nrate=0.0098},  
						{G=6,D=1,P=71,nrate=0.010,szname="Tiªn Th¶o Lé",nExpiredTime=43200,},					
	
						{G=6,D=1,P=4809,LV=1,szname="§»ng Long Hån"	 ,nrate=0.0021	},
						{G=6,D=1,P=4810,LV=1,szname="§»ng Long HuyOt"	 ,nrate=0.0018	}, 
						{G=6,D=1,P=4811,LV=1,szname="§»ng Long Th¹ch ",nrate=0.0015}, 
						--{G=6,D=1,P=26,LV=1,szname="Vâ L©m MËt TÞch"	 ,nrate=0.0014	},		
						--{G=6,D=1,P=22,LV=1,szname="TÈy Tñy Kinh"	 ,nrate=0.0013},	
						--{G=6,D=1,P=4818,LV=1,szname="§å Phæ §»ng Long Béi",nrate=0.0024	},
					
						--{G=6,D=1,P=4817,LV=1,nExpiredTime=43200,szname="§å Phæ §»ng Long H¹ng Liªn",nrate=0.0096},
						--{G=6,D=1,P=4812,LV=10,szname="§å Phæ §»ng Long Kh«i",nrate=0.015},
						--{G=6,D=1,P=4816,LV=10,szname="§å Phæ §»ng Long Hé UyÓn"	 ,nrate=0.0007	},
						--{G=6,D=1,P=4815,LV=10,szname="§å Phæ §»ng Long Yªu §¸i",nrate=0.0006},
						--{G=6,D=1,P=4814,LV=10,szname="§å Phæ §»ng Long Hµi"	 ,nrate=0.0009	},						
						--{G=6,D=1,P=4821,LV=10,szname="§å Phæ §»ng Long Vò KhÝ",nrate=0.0001},
						--{G=6,D=1,P=4820,LV=10,szname="§»ng Long §å Phæ H¹ Giíi",nrate=0.002	},
								
						{G=6,D=1,P=3008,LV=10,szname="Ngò Linh Quy Nguyªn Phï",nrate=0.06	},	
						{G=6,D=1,P=2125,LV=10,szname="Ngò Hµnh Kú Th¹ch",nrate=0.06	},													
						{G=6,D=1,P=3528,LV=10,nExpiredTime=43200,szname="Socola Lo¹i 1"	 ,nrate=0.002	},
						--{G=6,D=1,P=4819,LV=10,szname="§å Phæ §»ng Long Th­îng Giíi",nrate=0.0005},	
						{G=6,D=1,P=3526,LV=10,nExpiredTime=43200,szname="Socola Lo¹i 3",nrate=0.008	},						
						{G=6,D=1,P=3527,LV=10,nExpiredTime=43200,szname="Socola Lo¹i 2",nrate=0.003	},	
				
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
				AddOwnExp(1500000);
				Msg2Player(format("B¹n nhËn ®­îc 1 <color=yellow>%s<color>",szitemname))
				WriteLog(format("[zhongqiu2007]\t Date:%s\t Account:%s\t Name:%s\t GetItem:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szitemname));
				return 0
			end
		end
		return 0;
end