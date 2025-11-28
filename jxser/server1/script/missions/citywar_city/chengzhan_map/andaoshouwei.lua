--°µµÀÊØÎÀ
function main()
	Say("§©y lµ mËt ®¹o dïng ®Ó bİ mËt ra khái thµnh tËp kİch qu©n ®Şch! B¹n muèn dïng mËt ®¹o nµy kh«ng?", 2, "Muèn /OnGo", "Kh«ng muèn /OnCancel");
end

function OnGo()
	local mapid = 221
	local i = random(0,1);
	
	if (i == 0) then
		NewWorld(mapid,1739,3513)
	else
		NewWorld(mapid,1836,3405)
	end
	
	SetFightState(1);
	AddStation(10)			-- ¼ÇÂ¼½ÇÉ«Ôø¾­µ½¹ı°ÍÁêÏØ
	SetProtectTime(18*5)
	AddSkillState(963, 1, 0, 18*5) 
end

function OnCancel()
end
