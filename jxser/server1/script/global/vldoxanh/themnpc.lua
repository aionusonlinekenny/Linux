Include("\\script\\lib\\baseclass.lua")
Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\activitysys\\npctimer.lua")

function TestNPC()
g_AskClientStringEx("",1,5000,"NhËp Vµo NPC ID:",{TaoNPC})
end

local nNpcIndex = {}

function TaoNPC(idtNpc)
    local nCountx = 40
    local nCounty = 40
    local szICode = lib:Split(idtNpc, ",")
    local idtnc1 = tonumber(szICode[1])
    local idtnc2 = tonumber(szICode[2])
    local idAddedCount = 0
    local groupCount = 0

    for i = idtnc1, idtnc2 do
        local x, y, worldindex = GetPos()
        local nW, nX, nY = GetWorldPos()
        local currentX = x + nCountx
        local currentY = y + nCounty
        local nNpcIndex = AddNpc(i, 80, worldindex, currentX, currentY, "",""..i.."")
        SetNpcTimer(nNpcIndex, 20*1)
        Msg2Player("§· add thµnh c«ng "..i.." NPC")
        idAddedCount = idAddedCount + 1
        if idAddedCount == 15 then
            nCounty = nCounty + 100
            nCountx = 80
            idAddedCount = 0
        else
            nCountx = nCountx + 90
        end
    end
end
function ThemNPC(nNpcIndex)
    local nNam = tonumber(GetLocalDate("%Y")); 
    local nThang = tonumber(GetLocalDate("%m")); 
    local nNgay = tonumber(GetLocalDate("%d")); 
    local nGio = tonumber(GetLocalDate("%H")); 
    local nPhut = tonumber(GetLocalDate("%M")); 
    local nGiay = tonumber(GetLocalDate("%S")); 
    local nW, nX, nY = GetWorldPos() 
    local nIdPlay = PlayerIndex 
    local tbSay = {}
			tinsert(tbSay,"Thªm NPC./TestNPC")
			tinsert(tbSay,"Tho¸t/no")
			tinsert(tbSay,"Trë l¹i.")
		Say("Xin Chµo <color=red>"..GetName().."<color>!\nTäa ®é hiÖn t¹i: <color=green>"..nW.."<color> <color=blue>"..nX.."/"..nY.."<color> \n<color>Index:           <color=green>"..nIdPlay.."<color>\nSè SHXT: <color=green>        "..GetTask(T_SonHaXaTac).."<color> m¶nh.\nHiÖn §ang Cã:    <bclr=red><color=yellow>["..GetPlayerCount().."]<color><bclr> ng­êi ch¬i trong game.\n", getn(tbSay), tbSay)
end 

