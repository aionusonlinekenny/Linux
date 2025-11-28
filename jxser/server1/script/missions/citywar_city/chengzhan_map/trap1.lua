--¹¥³ÇÕ½ ÖĞ×ªµØÍ¼to³ÇÕ½µØÍ¼£¨ÊØ³Ç·½£©
--Trap ID£º¹¥³ÇÕ½

function main()
	if (GetCurCamp() ~= 1) then 
		Msg2Player("Kh«ng thÓ ®i ®­îc, nÕu ®i sÏ ®Õn n¬i phôc kİch cña ®Şch qu©n. ");
	else
		SetCurCamp(GetCamp())
		SetFightState(0)
		SetLogoutRV(0)
		NewWorld(222, 1613, 3185)
		AddStation(10)			-- ¼ÇÂ¼½ÇÉ«Ôø¾­µ½¹ı°ÍÁêÏØ
		SetProtectTime(18*5)
		AddSkillState(963, 1, 0, 18*5) 
	end;
end;
