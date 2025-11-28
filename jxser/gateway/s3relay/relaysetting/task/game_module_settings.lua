-- 定时向一组服务器的所有Gameserver发系统公告
Include("\\script\\gb_modulefuncs.lua")
tab_GameSetting = 
{
--"Hoat dong mua xuan 2006",--年兽
--"OpenShop",--商城
--"Thiep Chuc Mung Nam Moi",--Msg2SubWorld
"Trang Bi Hoang Kim",--AddLocalNews
"CTC Tam Tru", 
"Viem De",
"Van Luong",--AddLocalNews and AddGift
--"Nhim Beo Phi",
"Loan Chien Cuu Chau Coc",
"Boss Hang Ngay",
"Phu Quy Cam Hap",
}

function TaskShedule()
	TaskName("Thiet Ke He Thong");
	TaskInterval(1000000);
	TaskCountLimit(0);
	OutputMsg("=================KHOI DONG CAC TINH NANG=================");
end

function TaskContent()
	for i = 1, getn(tab_GameSetting) do 
		gb_AutoStartModule(tab_GameSetting[i])
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
