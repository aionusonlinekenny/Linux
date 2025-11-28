Include("\\script\\skill\\head.lua")

SKILLS={ --set hac than
	toukui_zuzhou={ --lam
		stun_p={{{1,35},{20,35}},{{1,35},{20,35}}},
		stuntimereduce_p={{{1,-40},{20,-40}},{{1,18*45},{20,18*45}}},
		freezetimereduce_p={{{1,-25},{20,-25}},{{1,18*45},{20,18*45}}},
	},
	toukui={ --khoi
		skill_desc=
			function(level)
				return format("Môc tiªu cã<color=orange>%d%%<color> tØ lÖ thi triÓn cÊp ®é t­¬ng øng cña <color=water>[Lµm cho¸ng]<color>\n sau mçi lÇn kÝch ho¹t trong <color=orange>%d gi©y <color> kh«ng thÓ kÝch ho¹t n÷a\n",floor(Link(level,SKILLS.toukui.autoattackskill[3]) - 30*18*256),floor((Link(level,SKILLS.toukui.autoattackskill[3]) / (18*256))))
			end,
		autoattackskill=
		{
			{{1,1250*256 + 1},{20,1250*256 + 20}},
			{{1,-1 },{20,-1 }},
			{{1,30*18*256 + 10},{20,30*18*256 + 10}}
		},
	},
	huwan_zuzhou={ --dien
		randmove={{{1,1},{20,1}},{{1,4*18},{15,4*18},{20,4*18},{21,4*18},{40,4*18}}},
		missle_missrate={{{1,40},{15,40},{20,40},{21,40},{40,40}}},
		missle_hitcount={{{1,2},{20,2}}},
		skill_desc=
			function(level)
				return "X¸c suÊt <color=orange>"..floor(100 -Link(level,SKILLS.huwan_zuzhou.missle_missrate[1])).."%<color> khiÕn cho tèi ®a "..
				floor(Link(level,SKILLS.huwan_zuzhou.missle_hitcount[1])).." môc tiªu gÇn bÞ ho¶ng lo¹n trong <color=orange>"..
				floor(Link(level,SKILLS.huwan_zuzhou.randmove[2]) / 18).." gi©y<color>\n"..
				"Trong lóc ho¶ng lo¹n kh«ng thÓ tÊn c«ng vµ di chuyÓn \n"
		end,
	},
	huwan={ --tu
		skill_desc=
			function(level)
				return format("Môc tiªu cã<color=orange>%d%%<color> tØ lÖ thi triÓn cÊp ®é t­¬ng øng cña <color=water>[§iªn lo¹n]<color>\n sau mçi lÇn kÝch ho¹t trong <color=orange>%d gi©y <color> kh«ng thÓ kÝch ho¹t n÷a\n",floor(Link(level,SKILLS.huwan.autoattackskill[3]) - 45*18*256),floor((Link(level,SKILLS.huwan.autoattackskill[3]) / (18*256))))
			end,
		autoattackskill=
		{
			{{1,1252*256 + 1},{20,1252*256 + 20}},
			{{1,-1 },{20,-1 }},
			{{1,45*18*256 + 10},{20,45*18*256 + 10}}
		},
	},
	daopao_fuzhu={ --tang
		allres_p={{{1,20},{20,20}},{{1,10*18},{20,10*18}}},
		allres_yan_p={{{1,20},{20,20}},{{1,10*18},{20,10*18}}},
	},
	daopao={ --gia
		skill_desc=
			function(level)
				return format("Dïng <color=water>[H¾c ThÇn]<color> t¨ng kh¸ng tÝnh khi b¶n th©n bÞ c«ng kÝch <color=orange>%d%%<color>, duy tr×<color=orange>%d gi©y <color>\n", floor(Link(level,SKILLS.daopao.allres_p[1])), floor(Link(level,SKILLS.daopao.allres_p[2]) / 18))
			end,
		autoreplyskill=
		{
			{{1,1254 * 256 + 1},{20,1254 * 256 + 20}},
			{{1,-1 },{20,-1 }},
			{{1,60*18*256 + 10},{19,60*18*256 + 10},{20,60*18*256 + 10}}
		},
		allres_p={{{1,20},{20,20}},{{1,10*18},{20,10*18}}},
		allres_yan_p={{{1,20},{20,20}},{{1,10*18},{20,10*18}}},
	},
	xiezi_fuzhu={ --tang
		fastwalkrun_p={{{1,30},{15,30},{20,30},{21,30}},{{1,10*18},{15,10*18},{20,10*18},{21,10*18}}},
	},
	xiezi={ --hai
		autorescueskill={{{1,1256*256 + 1},{20,1256*256 + 20},{21,1256*256 + 21}},{{1,-1},{20,-1}},{{1,20*18*256 + 65},{15,20*18*256 + 65},{20,20*18*256 + 65},{21,20*18*256 + 65}}},
		skill_desc=
			function(level)
				return "Khi sinh lùc thÊp h¬n 25% cã x¸c suÊt <color=orange>"..floor(Link(level,SKILLS.xiezi.autorescueskill[3]) - 20*18*256).."%<color> t¨ng tèc di chuyÓn \n"..
				floor(Link(level,SKILLS.xiezi_fuzhu.fastwalkrun_p[1])).."% tèc ®é di chuyÓn \n"..
				"Tèc ®é t¨ng cã thêi h¹n tøc thêi \n"
		end,
	},
	yaodai_fuzhu={ --an
		hide={{{1,1},{20,1}},{{1,5*18},{15,5*18},{20,5*18},{21,5*18}}},
		enhancehit_rate={{{1,9},{20,9}},{{1,5*18},{15,5*18},{20,5*18},{21,5*18}}},
	},
	yaodai={ --dai		
		autorescueskill={{{1,1258*256 + 1},{20,1258*256 + 20},{21,1258*256 + 21}},{{1,-1},{20,-1}},{{1,20*18*256 + 35},{15,20*18*256 + 35},{20,20*18*256 + 35},{21,20*18*256 + 35}}},		
		skill_desc=
			function(level)
				return "Khi sinh lùc thÊp h¬n 25% cã x¸c suÊt <color=orange>"..floor(Link(level,SKILLS.yaodai.autorescueskill[3]) - 20*18*256).."%<color> tr¹ng th¸i Èn th©n \n"..
				floor(Link(level,SKILLS.yaodai_fuzhu.enhancehit_rate[1])).."% träng kÝch t¹o thµnh trong <color=orange>"..floor(Link(level,SKILLS.yaodai_fuzhu.hide[2]) / 18).." gi©y<color>\n"..
				"Èn th©n t¹m thêi \n"
		end,
	},
}
