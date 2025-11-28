Include("\\script\\task\\task_addplayerexp.lua");
Include("\\script\\lib\\awardtemplet.lua");
IncludeLib("ITEM")

function main()
tbAwardTemplet:GiveAwardByList({tbProp = {6,1,3524,1,0,0}, nExpiredTime=43200,nCount = 200}, "test", 1);
end;
