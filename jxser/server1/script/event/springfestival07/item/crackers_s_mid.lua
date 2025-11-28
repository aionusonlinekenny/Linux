Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\task\\system\\task_string.lua");
Include("\\script\\task\\task_addplayerexp.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
IncludeLib("ITEM")
Include([[\script\event\springfestival07\item\libcracker.lua]]);

GOODSNAME = "Phong ph∏o trung Æ∆c bi÷t";
FREECELLCOUNT = 1;
EXPVALUE = 120;
TAB_GOODS = {

};

function main()
if CalcFreeItemCellCount() < 6 then
			CreateTaskSay({"C«n ›t nh t 6 ´ trËng mÌi c„ th” nhÀn vÀt ph»m",  "ß” ta sæp x’p lπi./Cancel",});
				return 1;
			end
			local nGoldPoint = GetExtPoint(6);
			if nGoldPoint > 500 then 
				Talk(1, "", "Max 500 Phong Ph∏o Trung ß∆c Bi÷t, Xin h∑y Æi Reset Event Æ” nhÀn th≠Îng ti’p ")				
					return 1;
				end	
	PickUp_haohangx_2()
	AddExtPoint(6,1)
	CastSkill(763, 2);
	Msg2Player(str);
	AddOwnExp(1200000)
end;

tb_Mareial_haohang_khoa = 
{
	100000,
	{
						{G=6,D=1,P=2527,LV=1,nExpiredTime=43200,szname="HÂi Thi™n T∏i Tπo L‘ Bao ",nrate=0.095}, 
						{G=6,D=1,P=4822,LV=1,szname="Tˆ Tinh Kho∏ng Thπch",nrate=0.070},
						{G=6,D=1,P=2125,LV=1,szname="NgÚ Hµnh K˙ Thπch",nrate=0.068},  
						{G=6,D=1,P=71,nrate=0.010,szname="Ti™n Th∂o LÈ",nExpiredTime=43200,},	
						{G=6,D=1,P=2975,LV=1,nExpiredTime=43200,szname="TËc Hi÷u Bπch C©u Hoµn c p 150",nrate=0.025}, 				
	
						{G=6,D=1,P=4809,LV=1,szname="ßªng Long HÂn"	 ,nrate=0.0021	},
						{G=6,D=1,P=4810,LV=1,szname="ßªng Long HuyOt"	 ,nrate=0.0018	}, 
						{G=6,D=1,P=4811,LV=1,szname="ßªng Long Thπch ",nrate=0.0015}, 
						--{G=6,D=1,P=26,LV=1,szname="V‚ L©m MÀt Tﬁch"	 ,nrate=0.0014	},		
						--{G=6,D=1,P=22,LV=1,szname="T»y TÒy Kinh"	 ,nrate=0.0013},	
						--{G=6,D=1,P=4818,LV=1,szname="ßÂ PhÊ ßªng Long BÈi",nrate=0.0024	},
					
						--{G=6,D=1,P=4817,LV=1,szname="ßÂ PhÊ ßªng Long Hπng Li™n",nrate=0.0096},
						--{G=6,D=1,P=4812,LV=10,szname="ßÂ PhÊ ßªng Long Kh´i",nrate=0.015},
						--{G=6,D=1,P=4816,LV=10,szname="ßÂ PhÊ ßªng Long HÈ Uy”n"	 ,nrate=0.0007	},
						--{G=6,D=1,P=4815,LV=10,szname="ßÂ PhÊ ßªng Long Y™u ß∏i",nrate=0.0006},
						--{G=6,D=1,P=4814,LV=10,szname="ßÂ PhÊ ßªng Long Hµi"	 ,nrate=0.0009	},						
						--{G=6,D=1,P=4821,LV=10,szname="ßÂ PhÊ ßªng Long VÚ Kh›",nrate=0.0001},
						--{G=6,D=1,P=4820,LV=10,szname="ßªng Long ßÂ PhÊ Hπ GiÌi",nrate=0.002	},
								
						{G=6,D=1,P=3008,LV=10,szname="NgÚ Hµnh K˙ Thπch",nrate=0.006	},													
						--{G=6,D=1,P=4813,LV=10,szname="ßÂ PhÊ ßªng Long Y"	 ,nrate=0.0002	},
						--{G=6,D=1,P=4819,LV=10,szname="ßÂ PhÊ ßªng Long Th≠Óng GiÌi",nrate=0.0005},	
						{G=6,D=1,P=3008,LV=10,szname="NgÚ Linh Quy Nguy™n PhÔ ",nrate=0.0008	},						
						--{G=0,D=10,P=21,LV=10,szname="Ng˘a Phong V©n Th«n M∑ ",nrate=0.0003	},			
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
				Msg2Player(format("Bπn nhÀn Æ≠Óc 1 <color=yellow>%s<color>",szitemname))
				WriteLog(format("[zhongqiu2007]\t Date:%s\t Account:%s\t Name:%s\t GetItem:%s",GetLocalDate("%y-%m-%d %H:%M:%S"),GetAccount(),GetName(),szitemname));
				return 0
			end
		end
		return 0;
end