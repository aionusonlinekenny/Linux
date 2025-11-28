-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æÒ» 150¼¶´ó³ËÃØ¼®
-- ÓÒ¼üµã»÷Ê¹ÓÃ£¬¿ÉÌáÉı150¼¶ÊìÁ·¶È¼¼ÄÜµ½20¼¶¡£

-- Edited by ×Ó·Çô~
-- 2010/06/29 15:21

-- ======================================================


Include("\\script\\task\\system\\task_string.lua")

function main(nItemIdx)
	local n_fac = GetLastFactionNumber();
	if (n_fac < 0) then
		Talk(1, "", "§©y Lµ Cuèn S¸ch M« T¶ C¸c Gi¸o Ph¸i Kh¸c Nhau cña Vâ ThuËt Tiªn TiÕn, Sau Khi Sö Dông SÏ LÜnh Ngé §­îc Kü N¨ng Cao NhÊt");
		return 1;
	end
	
	local tb_90skill = {
		[0] = {1055, 1056, 1057},
		[1] = {1058, 1059, 1060},
		[2] = {1069, 1070, 1071},
		[3] = {1066, 1067},
		[4] = {1061, 1062, 1114},
		[5] = {1063, 1065},
		[6] = {1073, 1074},
		[7] = {1075, 1076},
		[8] = {1078, 1079},
		[9] = {1080, 1081},
		[10] = {1369, 1384},
	};
	
	local tb_Desc = {};
	for i = 1, getn(tb_90skill[n_fac]) do
		local skill = HaveMagic(tb_90skill[n_fac][i]);
		if (skill ~= -1 and skill ~= 24) then
			tinsert(tb_Desc, format("N©ng CÊp:".."%s/#upgrade_skilllevel(%d)", GetSkillName(tb_90skill[n_fac][i]), tb_90skill[n_fac][i]));
		end
	end
	
	if (getn(tb_Desc) == 0) then
		Talk(1, "", "Kü N¨ng §· §¹t §Õn Cao NhÊt Kh«ng ThÓ N©ng CÊp Thªm N÷a");
		return 1;
	end
	
	tinsert(tb_Desc, 1, "Lùa Chän Kü N¨ng §Ó N©ng CÊp");
	tinsert(tb_Desc, "KÕt Thóc §èi Tho¹i/OnCancel");
	CreateTaskSay(tb_Desc);
	return 1;
end

function upgrade_skilllevel(n_skillid)
	if (HaveMagic(n_skillid) == -1 or HaveMagic(n_skillid) >= 24) then
		return
	end
	
	if (ConsumeItem(3, 1, 6, 1, 4151, -1) == 1) then
		AddMagic(n_skillid, 24);
		WriteLog(format("[%s]\t%s\tAccount:%s\tName:%s\tUpGrade Skill:%d",
				"§¹i Thµnh Bİ Kİp 150",
				GetLocalDate("%Y-%m-%d %X"),
				GetAccount(),
				GetName(),
				n_skillid	));
	end
end


function OnCancel()
end
