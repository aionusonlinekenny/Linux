-- by yfeng



function main(itemIdx)
	local mapid,_,_ = GetWorldPos()	
	local _,_,detail = GetItemProp(itemIdx)
	if(detail == 4864) then --¹¥ËÙÍè
		AddSkillState(511,15,1,18*180)
		AddSkillState(522,10,1,18*180)
		AddSkillState(523,10,1,18*180)
		AddSkillState(524,10,1,18*180)
		AddSkillState(525,10,1,18*180)
		AddSkillState(526,10,1,18*180)
		return 0
	end	

end

function GetDesc(itemIdx)
	local _,_,detail = GetItemProp(itemIdx)
	if(detail == 4864) then --¹¥ËÙÍè
		return "<color=blue>Trong 3 phót:\n Tèc ®é xuÊt chiªu ngo¹i c«ng: t¨ng 30%\n Tèc ®é xuÊt chiªunéi c«ng: T¨ng 30%<color>"
	end
	
	if(detail == 4864) then --ÆÕ¹¥Íè
		return "<color=blue>Trong 3 phót:\n S¸t th­¬ng vËt lı hÖ ngo¹i c«ng: T¨ng 200%\n S¸t th­¬ng vËt lı hÖ néi c«ng: T¨ng 100 ®iÓm<color>"
	end
	if(detail == 4864) then --¶¾¹¥Íè
		return "<color=blue>Trong 3 phót:\n §éc s¸t hÖ ngo¹i c«ng: T¨ng 10 ®iÓm/lÇn\n §éc s¸t hÖ néi c«ng: T¨ng 10 ®iÓm/lÇn<color>"
	end
	if(detail == 4864) then --±ù¹¥Íè
		return "<color=blue>Trong 3 phót:\n B¨ng s¸t hÖ ngo¹i c«ng: T¨ng 100 ®iÓm\n B¨ng s¸t hÖ néi c«ng: T¨ng 100 ®iÓm<color>"
	end
	if(detail == 4864) then --»ğ¹¥Íè
		return "<color=blue>Trong 3 phót:\n Háa s¸t hÖ ngo¹i c«ng: T¨ng 100 ®iÓm\n Háa s¸t hÖ néi c«ng: T¨ng 100 ®iÓm<color>"
	end
	if(detail == 4864) then --À×¹¥Íè
		return "<color=blue>Trong 3 phót:\n L«i s¸t ngo¹i c«ng: T¨ng 100 ®iÓm\n L«i s¸t néi c«ng: T¨ng 100 ®iÓm<color>"
	end

end
