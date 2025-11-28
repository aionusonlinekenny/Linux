--¹¥³ÇÕ½ ÖĞ×ªµØÍ¼to³ÇÕ½µØÍ¼£¨ÊØ³Ç·½£©
--Trap ID£º¹¥³ÇÕ½

Include("\\script\\missions\\citywar_city\\head.lua")

function main()
	Msg2Player("ctrap1b.lua");
	ft = GetFightState();
	if (ft == 0) then 
		SetPos(1540,3280)
		SetFightState(1)
		bt_RankEffect(BT_GetData(PL_CURRANK))
	else
		if (GetCurCamp() ~= 1) then 
			Msg2Player("Kh«ng thÓ ®i ®­îc, nÕu ®i sÏ ®Õn n¬i phôc kİch cña ®Şch qu©n. ");
			SetPos(1540,3280)
		else
			SetPos(1536,3269)
			SetFightState(0)
			AddStation(10)			-- ¼ÇÂ¼½ÇÉ«Ôø¾­µ½¹ı°ÍÁêÏØ
			SetProtectTime(18*5)
			AddSkillState(963, 1, 0, 18*5) 
		end;
	end;
end;
