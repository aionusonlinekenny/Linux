Include("\\script\\activitysys\\config\\44\\variables.lua") 
Include("\\script\\task\\task_addplayerexp.lua");
Include("\\script\\lib\\awardtemplet.lua");



local nTask_HuDie		= 1
local nTask_XinXin		= 2
local nTask_ZhuXin_YuanXin		= 3
local nTask_ChenDu		= 4
local nTask_DaLi		= 5
local nTask_FengXiang		= 6
local nTask_XiangYang		= 7
local nTask_BianJin		= 8
local nTask_LinAn		= 9
local nTask_YangZhou		= 10
local nTask_GiveCount		= 11
local nTask_Activi_Point		= 2794
local TaskVarIdx_YeSou		= 23
-------¾Ö²¿±äÁ¿¶¨Òå ½áÊø---
tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "NpcOnDeath",
	szName = "´ß¹Öµ«¢äÁ«Åº±ý",
	nStartDate = nil, 
        nEndDate = nil, 
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckNormalMonster",	{"90"} },
		{"NpcFunLib:CheckInMap",	{"322,321,144,124,93"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,1350,1,0,0},},1,"5"} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "NpcOnDeath",
	szName = "´ß¹Öµ«¢ä¢Ì¶¹±ý",
	nStartDate = nil, 
        nEndDate = nil, 
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckNormalMonster",	{"90"} },
		{"NpcFunLib:CheckInMap",	{"225,226,227,224,340,75"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,1350,1,0,0},},1,"5"} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "NpcOnDeath",
	szName = "´ß¹Öµ«¢äÓãÍ·",
	nStartDate = nil, 
        nEndDate = nil, 
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckNormalMonster",	{"10,20,30,40,50,60,70,80"} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,1350,1,0,0},},1,"1"} },
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "ClickNpc",
	szName = "Íæ¼Òµã»÷ÇÚÀÍÀÏÅ©",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"§¹i S­ L·o L·o"},
	tbCondition = 
	{
	},
	tbActition = 
	{
                {"SetDialogTitle",	{"<npc>Socola rÊt lµ ngon, ®¹i hiÖp cã thÓ tÆng cho c¸c ®¹i hiÖp n÷ §¹i hiÖp muèn Socola g× ®©y ?"} },
		{"AddDialogOpt",	{"Ta muèn ®æi Socola.",5} },
                --{"AddDialogOpt",	{"NhËn phÇn th­ëng sö dông socola.",10} },
                
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "CreateDialog",
	szName = "ºÏ³É»®·ÖµÈ¼¶",
	nStartDate = nil, 
        nEndDate = nil, 
	tbMessageParam = {"<npc>C¸c h¹ muèn hîp thµnh lo¹i socola nµo ?"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Hîp thµnh Socola lo¹i 4",6} },
		{"AddDialogOpt",	{"Hîp thµnh Socola lo¹i 3",7} },
		{"AddDialogOpt",	{"Hîp thµnh Socola lo¹i 2",8} },
		{"AddDialogOpt",	{"Hîp thµnh Socola lo¹i 1",9} },
	},
}
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "CreateCompose",
	szName = "Hîp thµnh SoCoLa lo¹i 4",
	nStartDate = nil, 
        nEndDate = nil, 
	tbMessageParam = {"Hîp thµnh SoCoLa lo¹i 4",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"SoCoLa lo¹i 5",{tbProp={6,1,3524,1,0,0},},2} },
                {"AddOneMaterial",	{"160000 l­îng",{nJxb=160000,},1} },
		{"PlayerFunLib:CheckTotalLevel",	{50,"CÊp 50 trë lªn míi tham gia ho¹t ®éng.",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3525,1,0,0},nExpiredTime=43200, nBindState=-2,},1,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
	},
}
tbConfig[7] = --Ò»¸öÏ¸½Ú
{
	nId = 7,
	szMessageType = "CreateCompose",
	szName = "Hîp thµnh SoCoLa lo¹i 3",
	nStartDate = 201408090000,
	nEndDate  = 201910110000,
	tbMessageParam = {"Hîp thµnh SoCoLa lo¹i 3",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"SoCoLa lo¹i 5",{tbProp={6,1,3524,1,0,0},},1} },
                {"AddOneMaterial",	{"SoCoLa lo¹i 4",{tbProp={6,1,3525,1,0,0},},1} },               
		{"PlayerFunLib:CheckTotalLevel",	{50,"CÊp 50 trë lªn míi tham gia ho¹t ®éng.",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3526,1,0,0},nExpiredTime=43200, nBindState=-2,},1,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
	},
}
tbConfig[8] = --Ò»¸öÏ¸½Ú
{
	nId = 8,
	szMessageType = "CreateCompose",
	szName = "Hîp thµnh SoCoLa lo¹i 2",
	nnStartDate = nil, 
        nEndDate = nil, 
	tbMessageParam = {"Hîp thµnh SoCoLa lo¹i 2",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"SoCoLa lo¹i 5",{tbProp={6,1,3524,1,0,0},},1} },
                {"AddOneMaterial",	{"SoCoLa lo¹i 3",{tbProp={6,1,3526,1,0,0},},1} },                
		{"PlayerFunLib:CheckTotalLevel",	{50,"CÊp 50 trë lªn míi tham gia ho¹t ®éng.",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3527,1,0,0},nExpiredTime=43200, nBindState=-2,},1,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
	},
}
tbConfig[9] = --Ò»¸öÏ¸½Ú
{
	nId = 9,
	szMessageType = "CreateCompose",
	szName = "Hîp thµnh SoCoLa lo¹i 1",
	nStartDate = nil, 
        nEndDate = nil, 
	tbMessageParam = {"Hîp thµnh SoCoLa lo¹i 1",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"SoCoLa lo¹i 5",{tbProp={6,1,3524,1,0,0},},1} },
                {"AddOneMaterial",	{"SoCoLa lo¹i 2",{tbProp={6,1,3527,1,0,0},},1} },                
		{"PlayerFunLib:CheckTotalLevel",	{50,"CÊp 50 trë lªn míi tham gia ho¹t ®éng.",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3528,1,0,0},nExpiredTime=43200, nBindState=-2,},1,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
	},
}
tbConfig[10] = --Ò»¸öÏ¸½Ú
{
	nId = 10,
	szMessageType = "CreateDialog",
	szName = "NhËn th­ëng SoCoLa",
	nStartDate = nil, 
        nEndDate = nil, 
	tbMessageParam = {"<npc>C¸c h¹ muèn nhËn phÇn th­ëng sö dông socola nµo ?"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{50,"",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"NhËn phÇn th­ëng 100 c¸i Socola lo¹i 1",12} },
		{"AddDialogOpt",	{"NhËn phÇn th­ëng 200 c¸i Socola lo¹i 1",13} },
		{"AddDialogOpt",	{"NhËn phÇn th­ëng 400 c¸i Socola lo¹i 1",14} },
		{"AddDialogOpt",	{"NhËn phÇn th­ëng 600 c¸i Socola lo¹i 1",15} },
                {"AddDialogOpt",	{"NhËn phÇn th­ëng 800 c¸i Socola lo¹i 1",16} },
		{"AddDialogOpt",	{"NhËn phÇn th­ëng 1000 c¸i Socola lo¹i 1",17} },
	},
}
tbConfig[11] = --Ò»¸öÏ¸½Ú
{
	nId = 11,
	szMessageType = "ItemScript",
	szName = "Sö dông SoCoLa lo¹i 1",
	nStartDate = nil, 
        nEndDate = nil, 
	tbMessageParam = {{tbProp={6,1,3528,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{50,"CÊp 50 trë lªn míi c? thÓ sö dông",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"[TÝnh n¨ng socola][Sö dông Socola lo¹i 1]"} },
		{"ThisActivity:AddTask",	{nTask_HuDie,1} },
	},
}
tbConfig[12] = --Ò»¸öÏ¸½Ú
{
	nId = 12, 
        szMessageType = "nil", 
        szName = "NhËn phÇn th­ëng 100 c¸i Socola lo¹i 1", 
        nStartDate = nil, 
        nEndDate = nil, 
        tbMessageParam = {nil}, 
        tbCondition = 
        { 
                 {"PlayerFunLib:CheckTotalLevel", {80,"default",">="} }, 
                 {"ThisActivity:CheckTask", {nTask_HuDie,2,"§¹i hiÖp kh«ng ®ñ sö dông 100 chiÕc Socola lo¹i 1, kh«ng thÓ nhËn th­ëng",">="} }, 
                 {"ThisActivity:CheckTask", {TaskVarIdx_IsGet100Award,0,"Ng­¬i ®· nhËn th­ëng.","=="} }, 
        }, 
        tbActition = 
        { 
                 {"PlayerFunLib:AddExp", {Get300Award,1,"Sö dông 100 chiÕc Socola lo¹i 1 nhËn th­ëng."} }, 
                  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4825,1,0,0},},1,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4826,1,0,0},},1,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4827,1,0,0},},1,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4828,1,0,0},},1,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4829,1,0,0},},1,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4830,1,0,0},},1,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4831,1,0,0},},1,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4832,1,0,0},},1,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4833,1,0,0},},1,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4834,1,0,0},},1,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,30226,1,0,0},},1,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
                 {"ThisActivity:AddTask", {TaskVarIdx_IsGet100Award,1} }, 
        }, 
}
tbConfig[13] = --Ò»¸öÏ¸½Ú
{
	nId = 13,
	szMessageType = "nil", 
        szName = "NhËn phÇn th­ëng 200 c¸i Socola lo¹i 1", 
        nStartDate = nil, 
        nEndDate = nil, 
        tbMessageParam = {nil}, 
        tbCondition = 
        { 
                 {"PlayerFunLib:CheckTotalLevel", {80,"default",">="} }, 
                 {"ThisActivity:CheckTask", {nTask_HuDie,200,"§¹i hiÖp kh«ng ®ñ sö dông 200 chiÕc Socola lo¹i 1, kh«ng thÓ nhËn th­ëng",">="} }, 
                 {"ThisActivity:CheckTask", {TaskVarIdx_IsGet200Award,0,"Ng­¬i ®· nhËn th­ëng.","=="} }, 
        }, 
        tbActition = 
        { 
                 {"PlayerFunLib:AddExp", {Get300Award,1,"Sö dông 200 chiÕc Socola lo¹i 1 nhËn th­ëng."} }, 
                   {"PlayerFunLib:GetItem",	{{tbProp={6,1,4825,1,0,0},},2,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4826,1,0,0},},2,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4827,1,0,0},},2,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4828,1,0,0},},2,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4829,1,0,0},},2,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4830,1,0,0},},2,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4831,1,0,0},},2,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4832,1,0,0},},2,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4833,1,0,0},},2,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4834,1,0,0},},2,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,30226,1,0,0},},2,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
                 {"ThisActivity:AddTask", {TaskVarIdx_IsGet200Award,1} }, 
        }, 
}
tbConfig[14] = --Ò»¸öÏ¸½Ú
{
	nId = 14,
	szMessageType = "nil", 
        szName = "NhËn phÇn th­ëng 400 c¸i Socola lo¹i 1", 
        nStartDate = nil, 
        nEndDate = nil, 
        tbMessageParam = {nil}, 
        tbCondition = 
        { 
                 {"PlayerFunLib:CheckTotalLevel", {80,"default",">="} }, 
                 {"ThisActivity:CheckTask", {nTask_HuDie,400,"§¹i hiÖp kh«ng ®ñ sö dông 400 chiÕc Socola lo¹i 1, kh«ng thÓ nhËn th­ëng",">="} }, 
                 {"ThisActivity:CheckTask", {TaskVarIdx_IsGet300Award,0,"Ng­¬i ®· nhËn th­ëng.","=="} }, 
        }, 
        tbActition = 
        { 
                 {"PlayerFunLib:AddExp", {Get300Award,1,"Sö dông 400 chiÕc Socola lo¹i 1 nhËn th­ëng."} },
                  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4825,1,0,0},},2,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4826,1,0,0},},3,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4827,1,0,0},},3,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4828,1,0,0},},3,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4829,1,0,0},},3,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4830,1,0,0},},3,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4831,1,0,0},},3,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4832,1,0,0},},3,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4833,1,0,0},},3,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4834,1,0,0},},3,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,30226,1,0,0},},3,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
 
                 {"ThisActivity:AddTask", {TaskVarIdx_IsGet300Award,1} }, 
        }, 
}
tbConfig[15] = --Ò»¸öÏ¸½Ú
{
	nId = 15,
	szMessageType = "nil", 
        szName = "NhËn phÇn th­ëng 600 c¸i Socola lo¹i 1", 
        nStartDate = nil, 
        nEndDate = nil, 
        tbMessageParam = {nil}, 
        tbCondition = 
        { 
                 {"PlayerFunLib:CheckTotalLevel", {80,"default",">="} }, 
                 {"ThisActivity:CheckTask", {nTask_HuDie,600,"§¹i hiÖp kh«ng ®ñ sö dông 600 chiÕc Socola lo¹i 1, kh«ng thÓ nhËn th­ëng",">="} }, 
                 {"ThisActivity:CheckTask", {TaskVarIdx_IsGet400Award,0,"Ng­¬i ®· nhËn th­ëng.","=="} }, 
        }, 
        tbActition = 
        { 
                 {"PlayerFunLib:AddExp", {Get300Award,1,"Sö dông 600 chiÕc Socola lo¹i 1 nhËn th­ëng."} },
                   {"PlayerFunLib:GetItem",	{{tbProp={6,1,4825,1,0,0},},4,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4826,1,0,0},},4,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4827,1,0,0},},4,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4828,1,0,0},},4,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4829,1,0,0},},4,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4830,1,0,0},},4,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4831,1,0,0},},4,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4832,1,0,0},},4,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4833,1,0,0},},4,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4834,1,0,0},},4,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,30226,1,0,0},},4,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} }, 
                 {"ThisActivity:AddTask", {TaskVarIdx_IsGet400Award,1} }, 
        }, 
}
tbConfig[16] = --Ò»¸öÏ¸½Ú
{
	nId = 16,
	szMessageType = "nil", 
        szName = "NhËn phÇn th­ëng 800 c¸i Socola lo¹i 1", 
        nStartDate = nil, 
        nEndDate = nil, 
        tbMessageParam = {nil}, 
        tbCondition = 
        { 
                 {"PlayerFunLib:CheckTotalLevel", {80,"default",">="} }, 
                 {"ThisActivity:CheckTask", {nTask_HuDie,800,"§¹i hiÖp kh«ng ®ñ sö dông 800 chiÕc Socola lo¹i 1, kh«ng thÓ nhËn th­ëng",">="} }, 
                 {"ThisActivity:CheckTask", {TaskVarIdx_IsGet500Award,0,"Ng­¬i ®· nhËn th­ëng.","=="} }, 
        }, 
        tbActition = 
        { 
                 {"PlayerFunLib:AddExp", {Get300Award,1,"Sö dông 800 chiÕc Socola lo¹i 1 nhËn th­ëng."} }, 
                   {"PlayerFunLib:GetItem",	{{tbProp={6,1,4825,1,0,0},},5,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4826,1,0,0},},5,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4827,1,0,0},},5,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4828,1,0,0},},5,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4829,1,0,0},},5,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4830,1,0,0},},5,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4831,1,0,0},},5,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4832,1,0,0},},5,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4833,1,0,0},},5,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4834,1,0,0},},5,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,30226,1,0,0},},5,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
                 {"ThisActivity:AddTask", {TaskVarIdx_IsGet500Award,1} }, 
        }, 
}
tbConfig[17] = --Ò»¸öÏ¸½Ú
{
	nId = 17,
	szMessageType = "nil", 
        szName = "NhËn phÇn th­ëng 1000 c¸i Socola lo¹i 1", 
        nStartDate = nil, 
        nEndDate = nil, 
        tbMessageParam = {nil}, 
        tbCondition = 
        { 
                 {"PlayerFunLib:CheckTotalLevel", {80,"default",">="} }, 
                 {"ThisActivity:CheckTask", {nTask_HuDie,1000,"§¹i hiÖp kh«ng ®ñ sö dông 1000 chiÕc Socola lo¹i 1, kh«ng th?nhËn th­ëng",">="} }, 
                 {"ThisActivity:CheckTask", {TaskVarIdx_IsGet600Award,0,"Ng­¬i ®· nhËn th­ëng.","=="} }, 
        }, 
        tbActition = 
        { 
                 {"PlayerFunLib:AddExp", {Get300Award,1,"S?dông 1000 chiÕc S?c?la lo¹i 1 nhËn th­ëng."} }, 
                   {"PlayerFunLib:GetItem",	{{tbProp={6,1,4825,1,0,0},},20,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4826,1,0,0},},20,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4827,1,0,0},},20,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4828,1,0,0},},20,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4829,1,0,0},},20,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4830,1,0,0},},20,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4831,1,0,0},},20,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4832,1,0,0},},20,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4833,1,0,0},},20,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,4834,1,0,0},},20,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
				  {"PlayerFunLib:GetItem",	{{tbProp={6,1,30226,1,0,0},},20,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
                 {"ThisActivity:AddTask", {TaskVarIdx_IsGet600Award,1} }, 
        }, 
}
tbConfig[18] = --Ò»¸öÏ¸½Ú
{
	nId = 18,
	szMessageType = "ItemScript",
	szName = "Sö dông Socola lo¹i 1",
	nStartDate = nil, 
        nEndDate = nil, 
	tbMessageParam = {{tbProp={6,1,3527,1,0,0},}},

	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{50,"CÊp 50 trë lªn míi c? thÓ sö dông",">="} },
	},
	tbActition = 
	{

		{"PlayerFunLib:AddExp",	{50000000,0,"[TÝnh n¨ng socola][Sö dông Socola lo¹i 2]"} },				
		{"ThisActivity:AddTask",	{nTask_HuDie,1} },
	},
}
tbConfig[19] = --Ò»¸öÏ¸½Ú
{
	nId = 18,
	szMessageType = "ItemScript",
	szName = "Sö dông Socola lo¹i 1",
	nStartDate = nil, 
        nEndDate = nil, 
	tbMessageParam = {{tbProp={6,1,3526,1,0,0},}},

	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{50,"CÊp 50 trë lªn míi c? thÓ sö dông",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{10000000,0,"[TÝnh n¨ng socola][Sö dông Socola lo¹i 3]"} },		
		{"ThisActivity:AddTask",	{nTask_HuDie,1} },
	},
}
tbConfig[20] = --Ò»¸öÏ¸½Ú
{
	nId = 18,
	szMessageType = "ItemScript",
	szName = "Sö dông Socola lo¹i 1",
	nStartDate = nil, 
        nEndDate = nil, 
	tbMessageParam = {{tbProp={6,1,3525,1,0,0},}},

	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{50,"CÊp 50 trë lªn míi c? thÓ sö dông",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{1500000,0,"[TÝnh n¨ng socola][Sö dông Socola lo¹i 4]"} },			
		{"ThisActivity:AddTask",	{nTask_HuDie,1} },
	},
}
tbConfig[21] = --ËÎ½ð1000µã
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "¸ß¼¶ËÎ½ð1000µã",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{500,">="} },
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,"<"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3524,1,0,0},nExpiredTime=43200, nBindState=-2,},30,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,4094,1,0,0},nExpiredTime=1440, nBindState=-2,},1,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },		
		{"tbVngTransLog:Write", {strTranLogFolder, nPromotionID, "ËÎ½ð1000", "20 ¶äºìÃµ¹å", 1}},
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3198,1,0,0},},20,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
		
	},
}
tbConfig[22] = --É±ÊÖboss
{
	nId = 6,
	szMessageType = "NpcOnDeath",
	szName = "90¼¶É±ÊÖÈÎÎñ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3524,1,0,0},nExpiredTime=43200, nBindState=-2,},20,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,4822,1,0,0},},2,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3198,1,0,0},},20,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
	},
}
tbConfig[23] =
{
	nId = 23,
	szMessageType = "FinishYesou",
	szName = "Ò»ÌìÄÚÒÑÍê³É10¸öÒ°ÛÅÈÎÎñ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {1},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_YeSou,0,"","=="} },
		{"PlayerFunLib:CheckTaskDaily",	{TaskVarIdx_XinXiaLinMax,25,"","<"} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3524,1,0,0},nExpiredTime=20501101, nBindState=-2,},2,"Ò»ÌìÄÚÒÑÍê³ÉÊ®¸öÒ°ÛÅÈÎÎñ"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,4822,1,0,0},},2,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
	},
}
tbConfig[24] = --ËÎ½ð1000µã
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "Tèng kim cao cÊp 3000 ®iÓm",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3524,1,0,0},nExpiredTime=20501101, nBindState=-2,},20,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,4822,1,0,0},},10,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3198,1,0,0},},20,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
	},
}
tbConfig[25] = --ËÎ½ð1000µã
{
	nId = 3,
	szMessageType = "FinishFengLingDu",
	szName = "Hoµn thµnh Phong L¨ng §é",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3524,1,0,0},nExpiredTime=43200, nBindState=-2,},20,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,4093,1,0,0},nExpiredTime=1440, nBindState=-2,},1,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },			
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,4822,1,0,0},},10,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3198,1,0,0},},20,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
	},
}

tbConfig[26] = --Boss thÕ giíi
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "Tiªu diÖt boss thÕ giíi",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckWorldBoss",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3524,1,0,0},nExpiredTime=43200, nBindState=-2,},20,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3198,1,0,0},},20,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
	},
}

tbConfig[27] = --Viªm ®Õ
{
	nId = 9,
	szMessageType = "YDBZguoguan",
	szName = "V­ît qua ¶i Viªm §Õ thø 10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3524,1,0,0},nExpiredTime=43200, nBindState=-2,},20,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3198,1,0,0},},20,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
	},
}

tbConfig[28] = --thuû tÆc ®¹i ®Çu lÜnh
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "Tiªu diÖt thuû tÆc ®¹i ®Çu lÜnh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
		{"NpcFunLib:CheckInMap",	{"337,338,339"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3524,1,0,0},nExpiredTime=43200, nBindState=-2,},20,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3198,1,0,0},},20,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
	},
}
tbConfig[29] = --Thñy tÆc ®Çu lÜnh
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "GiÕt chÕt 1 thñy tÆc ®Çu lÜnh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckBoatBoss",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3524,1,0,0},nExpiredTime=43200, nBindState=-2,},20,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3198,1,0,0},},20,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
	},
}

tbConfig[30] =
{
	nId = 6,
	szMessageType = "Chuanguan",
	szName = "V­ît qua ¶i 28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
{"PlayerFunLib:GetItem",	{{tbProp={6,1,3524,1,0,0},nExpiredTime=43200, nBindState=-2,},20,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3198,1,0,0},},20,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
	},
}

tbConfig[31] =
{
	nId = 5,
	szMessageType = "Chuanguan",
	szName = "V­ît qua ¶i 17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3524,1,0,0},nExpiredTime=43200, nBindState=-2,},20,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3198,1,0,0},},20,"[TÝnh n¨ng socola] [Hîp thµnh socola]"} },
	},
}