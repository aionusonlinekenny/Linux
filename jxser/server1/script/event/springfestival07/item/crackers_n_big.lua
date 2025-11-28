Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\task\\task_addplayerexp.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
IncludeLib("ITEM")
Include([[\script\event\springfestival07\item\libcracker.lua]]);

GOODSNAME = "Phong ph¸o ®¹i th­êng";
FREECELLCOUNT = 0;
EXPVALUE = 800;
TAB_GOODS = {};

function main()
	if CalcFreeItemCellCount() < 6 then
			CreateTaskSay({"CÇn Ýt nhÊt 6 « trèng míi cã thÓ nhËn vËt phÈm",  "§Ó ta s¾p xÕp l¹i./Cancel",});
				return 1;
			end
			local nGoldPoint = GetExtPoint(7);
			if nGoldPoint > 700 then 
				Talk(1, "", "Max 700 Phong Ph¸o §¹i Th­êng, Xin h·y ®i Reset Event ®Ó nhËn th­ëng tiÕp ")				
					return 1;
				end			
	PickUp_haohangx_2()
	AddExtPoint(7,1)
	CastSkill(763, 2);
	Msg2Player(str);
	AddOwnExp(5000000)
end;

tb_Mareial_haohang_khoa = 
{
	100000,
	{
						{G=6,D=1,P=2527,LV=1,nExpiredTime=43200,szname="Håi Thiªn T¸i T¹o LÔ Bao ",nrate=0.00035}, 
						{G=6,D=1,P=4822,LV=1,szname="Tö Tinh Kho¸ng Th¹ch",nrate=0.070},
						--{G=6,D=1,P=2125,LV=1,szname="Ngò Hµnh Kú Th¹ch",nrate=0.0098},  
						{G=6,D=1,P=71,nrate=0.010,szname="Tiªn Th¶o Lé",nExpiredTime=43200,},					
	
						--{G=6,D=1,P=4809,LV=1,szname="§»ng Long Hån"	 ,nrate=0.0021	},
						--{G=6,D=1,P=4810,LV=1,szname="§»ng Long HuyOt"	 ,nrate=0.0018	}, 
						--{G=6,D=1,P=4811,LV=1,szname="§»ng Long Th¹ch ",nrate=0.0015}, 
						{G=6,D=1,P=26,LV=1,szname="Vâ L©m MËt TÞch"	 ,nrate=0.0014	},		
						{G=6,D=1,P=22,LV=1,szname="TÈy Tñy Kinh"	 ,nrate=0.0013},	
						--{G=6,D=1,P=4818,LV=1,szname="§å Phæ §»ng Long Béi",nrate=0.0024	},
					
						--{G=6,D=1,P=4817,LV=1,szname="§å Phæ §»ng Long H¹ng Liªn",nrate=0.0096},
						--{G=6,D=1,P=4812,LV=10,szname="§å Phæ §»ng Long Kh«i",nrate=0.015},
						--{G=6,D=1,P=4816,LV=10,szname="§å Phæ §»ng Long Hé UyÓn"	 ,nrate=0.0007	},
						--{G=6,D=1,P=4815,LV=10,szname="§å Phæ §»ng Long Yªu §¸i",nrate=0.0006},
						--{G=6,D=1,P=4814,LV=10,szname="§å Phæ §»ng Long Hµi"	 ,nrate=0.0009	},						
						--{G=6,D=1,P=4821,LV=10,szname="§å Phæ §»ng Long Vò KhÝ",nrate=0.0001},
						--{G=6,D=1,P=4820,LV=10,szname="§»ng Long §å Phæ H¹ Giíi",nrate=0.002	},
								
						{G=6,D=1,P=3008,LV=10,szname="Ngò Hµnh Kú Th¹ch",nrate=0.006	},													
						--{G=6,D=1,P=4813,LV=10,szname="§å Phæ §»ng Long Y"	 ,nrate=0.0002	},
						--{G=6,D=1,P=4819,LV=10,szname="§å Phæ §»ng Long Th­îng Giíi",nrate=0.0005},	
						--{G=6,D=1,P=3008,LV=10,szname="Ngò Linh Quy Nguyªn Phï ",nrate=0.0008	},						
						--{G=0,D=10,P=21,LV=10,szname="Ngùa Phong V©n ThÇn M· ",nrate=0.0003	},			
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
				local nidx = tbAwardTemplet:GiveAwardByList({tbProp = {g,d,p,1,0,0},}, "test", 1)
				local szitemname = nitem["szname"]
				Msg2Player(format("B¹n nhËn ®­îc 1 <color=yellow>%s<color>",szitemname))
				WriteLog(format("[zhongqiu2007]\t Date:%s\t Account:%s\t Name:%s\t GetItem:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szitemname));
				return 0
			end
		end
		return 0;
end