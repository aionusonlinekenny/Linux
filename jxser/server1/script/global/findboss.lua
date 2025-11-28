IncludeLib("SETTING") 
Include("\\script\\dailogsys\\dailogsay.lua") 
Include("\\script\\activitysys\\functionlib.lua") 

tbMapGoldBoss = { 
{"Cæ B¸ch","Phï Dung ®éng",202,"S¬n B¶o ®éng",76,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176}, 
{"HuyÒn Gi¸c §¹i S­","Nh¹n Th¹ch ®éng",10,"Thanh khª ®éng",198,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176}, 
{"§­êng Phi YÕn", "Phong L¨ng ®é",336,"Kho¶ Lang ®éng",75,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176}, 
{"Lam Y Y","Vò L¨ng ®éng",199,"Phi Thiªn ®éng",204,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176}, 
{"Hµ Linh Phiªu", "Tr­êng B¹ch s¬n B¾c",322,"V« Danh ®éng",203,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176}, 
{"Yªn HiÓu Tr¸i", "Sa M¹c s¬n  ®éng 1",225,"Sa M¹c s¬n  ®éng 3",227,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176}, 
{"M¹nh Th­¬ng L­¬ng","Sa m¹c ®Þa biÓu",224,"Sa M¹c s¬n  ®éng 2",226,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176}, 
{"Gia LuËt TÞ Ly", "L­ìng Thñy ®éng",181,"D­¬ng Trung ®éng",205,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176}, 
{"§¹o Thanh Ch©n Nh©n","Tr­êng B¹ch s¬n Nam",321,"M¹c Cao QuËt",340,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176}, 
{"TuyÒn C¬ Tö", "T©y S¬n ®¶o",342,"Phi Thiªn ®éng",204,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176}, 
{"V­¬ng T¸","Vò L¨ng ®éng",199,"Phï Dung ®éng",202,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176}, 
{"HuyÒn Nan §¹i S­","Phong L¨ng ®é",336,"Kho¶ Lang ®éng",75,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176}, 
{"§­êng BÊt NhiÔm", "Tr­êng B¹ch s¬n Nam",321,"Kho¶ Lang ®éng",75,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176}, 
{"B¹ch Doanh Doanh", "Thanh khª ®éng",198,"Sa m¹c ®Þa biÓu",224,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176}, 
{"Thanh TuyÖt S­ Th¸i", "T©y S¬n ®¶o",342,"D­¬ng Trung ®éng",205,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176}, 
{"Chung Linh Tó", "Phi Thiªn ®éng",204,"V« Danh ®éng",203,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176}, 
{"Hµ Nh©n Ng·", "Nh¹n Th¹ch ®éng",10,"L­ìng Thñy ®éng",181,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176}, 
{"§oan Méc DuÖ", "Phong L¨ng ®é",336,"S¬n B¶o ®éng",76,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176}, 
{"Tõ §¹i Nh¹c", "M¹c B¾c Th¶o Nguyªn",341,"Vò L¨ng ®éng",199,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176}, 
{"Thanh Liªn Tö","Tr­êng B¹ch s¬n B¾c",322,"Sa M¹c s¬n  ®éng 3",227,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176}, 
{"Thanh TuyÖt S­ Th¸i","Sa M¹c s¬n  ®éng 1",225,"Sa M¹c s¬n  ®éng 3",227,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176}, 
{"Hµn Ngu Dèt","Phong L¨ng ®é",336,"Kho¶ Lang ®éng",75,"T­¬ng D­¬ng",78,"Ph­îng T­êng",1,"Thµnh §«",11,"D­¬ng Ch©u",80,"BiÖn Kinh",37,"§¹i Lý",162,"L©m An",176}, 
} 

function findgoldboss(f_bossx,f_bossy) 
    if (not f_bossx) then 
        f_bossx1 = 1; 
        f_bossy1 = 22; 
    else 
        f_bossx1 = f_bossx; 
        f_bossy1 = f_bossy; 
    end 
     
    if (f_bossy1 - f_bossx1 > 11) then 
        f_bossy1 = f_bossx1 + 11; 
    end 
     
    local n_count = getn(tbMapGoldBoss); 
    local tab_Content = {} 
    for i = f_bossx1, f_bossy1 do 
        tinsert(tab_Content, {tbMapGoldBoss[i][1], findgoldboss_Step2, {i}}); 
    end 
    tinsert(tab_Content, {"Tho¸t./OnCancel"}); 
    CreateNewSayEx("T×m kiÕm Boss §¹i Hoµng Kim", tab_Content); 
--    Say(NpcName, getn(tab_Content), tab_Content); 
end 
function findgoldboss_Step2(nId) 
    local tb = {}; 
    for i=2,getn(tbMapGoldBoss[nId]),2 do 
        local npcidxtab = GetMapNpcWithName(tbMapGoldBoss[nId][i+1], tbMapGoldBoss[nId][1]); 
        if npcidxtab == nil then 
                nNPCCount = 0; 
        else 
            nNPCCount = getn(npcidxtab); 
        end; 
        for j = 1, nNPCCount do  
            x, y, subworld = GetNpcPos(npcidxtab[j]);  
            m,n,k = floor(x/32),floor(y/32),SubWorldIdx2ID(subworld); 
            tinsert(tb,{tbMapGoldBoss[nId][1].."-"..tbMapGoldBoss[nId][i].."["..m.."-"..n.."]",findgoldboss_Step3,{m.."-"..n.."-"..k}}); 
        end; 
    end; 
    strTittle = "T×m thÊy cao thñ vâ l©m "..tbMapGoldBoss[nId][1].." t¹i c¸c vÞ trÝ sau ®©y:"; 
    tinsert(tb,{"Quay l¹i.",findgoldboss}); 
    tinsert(tb,{"Tho¸t./OnCancel"}); 
    CreateNewSayEx(strTittle, tb); 
--    Say(strTittle,getn(tb),tb) 
end 
function findgoldboss_Step3(nStr) 
    local szICode = lib:Split(nStr, "-"); 
--    Msg2Player(szICode[3].."-"..floor(szICode[1]/8) .."-"..floor(szICode[2]/16)) 
    local Map = szICode[3] 
    local xPos = tonumber(floor(szICode[1])) 
    local yPos = tonumber(floor(szICode[2])) 
    NewWorld(Map,xPos,yPos)  
--    SetFightState(1) 
end 

function OnCancel() 
end  