



function main(itemIdx)
	local mapid,_,_ = GetWorldPos()
	local _,_,detail = GetItemProp(itemIdx)
	
	if(detail == 4865) then --ÅÜËÙÍè
		AddSkillState(512,15,1,18*180)
		AddSkillState(513,20,1,18*180)
		AddSkillState(514,20,1,18*180)
		AddSkillState(515,20,1,18*180)
		AddSkillState(516,20,1,18*180)
		AddSkillState(517,20,1,18*180)
		AddSkillState(518,20,1,18*180)
		AddSkillState(519,20,1,18*180)
		AddSkillState(520,20,1,18*180)
		AddSkillState(521,20,1,18*180)
		AddSkillState(527,10,1,18*180)
		AddSkillState(528,10,1,18*180)
		return 0
	end
	
end

function GetDesc(itemIdx)

	if(detail == 4865) then --ÅÜËÙÍè
		return "<color=blue>Trong 3 phót:\n Tèc ®é di chuyÓn: T¨ng 30%<color>"
	end
	if(detail == 4865) then --ÆÕ·ÀÍè
		return "<color=blue>Trong 3 phót:\n Phßng vËt lı: T¨ng 40%<color>"
	end
	if(detail == 4865) then --¶¾·ÀÍè
		return "<color=blue>Trong 3 phót:\n Kh¸ng ®éc: T¨ng 40%<color>"
	end
	if(detail == 4865) then --±ù·ÀÍè
		return "<color=blue>Trong 3 phót:\n Kh¸ng b¨ng: T¨ng 40%<color>"
	end
	if(detail == 4865) then --»ğ·ÀÍè
		return "<color=blue>Trong 3 phót:\n Kh¸ng háa: T¨ng 40%<color>"
	end
	if(detail == 4865) then --À×·ÀÍè
		return "<color=blue>Trong 3 phót:\n Kh¸ng l«i: T¨ng 40%<color>"
	end
	if(detail == 4865) then --¼õÉËÍè
		return "<color=blue>Trong 3 phót:\n Thêi gian bŞ th­¬ng: Gi¶m 40%<color>"
	end
	if(detail == 4865) then --¼õÔÎÍè
		return "<color=blue>Trong 3 phót:\n Thêi gian cho¸ng: Gi¶m 40%<color>"
	end
	if(detail == 4865) then --¼õ¶¾Íè
		return "<color=blue>Trong 3 phót:\n Thêi gian tróng ®éc: Gi¶m 40%<color>"
	end
	if(detail == 4865) then --¼õ±ùÍè
		return "<color=blue>Trong 3 phót:\n Thêi gian lµm chËm: Gi¶m 40%<color>"
	end
	if(detail == 4865) then --³¤ÃüÍè
		return "<color=blue>Trong 3 phót:\n Sinh lùc lín nhÊt: T¨ng 1000 ®iÓm<color>"
	end
	if(detail == 4865) then --³¤ÄÚÍè
		return "<color=blue>Trong 3 phót:\n Néi lùc lín nhÊt: T¨ng 1000 ®iÓm<color>"
	end

end
