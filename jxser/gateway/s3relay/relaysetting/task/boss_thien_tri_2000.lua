--增加天池密境boss四层在20h - Created by DinhHQ - 20120404

function TaskShedule()
	TaskName("Boss Thien Tri -20h")
	TaskInterval(24 * 60)
	TaskTime(20, 00)
	TaskCountLimit(0)
	OutputMsg("=================BOSS THIEN TRI XUAT HIEN LUC 20H TANG 4=================")
end

function TaskContent()	
	RemoteExecute("\\script\\missions\\tianchimijing\\floor4\\bosstimer.lua",	"GameFloor4:CallBoss", 0)
	OutputMsg("=================BOSS THIEN TRI DA XUAT HIEN=================")
end
