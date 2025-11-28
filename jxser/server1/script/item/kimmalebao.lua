Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\task\\task_addplayerexp.lua")
Include("\\script\\lib\\awardtemplet.lua")

id_KML = {4090,4091,4092,4093,4094,4095,4096}

function main(sel)
	dofile("script/item/kimmalebao.lua")
	dialog()
	return 1
end

function dialog()
	local str = ""..GetName().." muèn chän Kim M· LÖnh nµo?"
	local tb_KML = {
			"Kim M· LÖnh - 1./NhanKML",
			"Kim M· LÖnh - 2./NhanKML",
			"Kim M· LÖnh - 3./NhanKML",
			"Kim M· LÖnh - 4./NhanKML",
			"Kim M· LÖnh - 5./NhanKML",
			"Kim M· LÖnh - 6./NhanKML",
			"Kim M· LÖnh - 7./NhanKML",
			"Tho¸t./no",
		}
	Say(str,getn(tb_KML),tb_KML)
end

function NhanKML(sel)
	local nIndex = sel + 1
	local TAB_KML = {
		{szName="<color=pink>Kim M· LÖnh", tbProp={6,1,id_KML[nIndex]}, nCount = 1, nExpiredTime = 1440, nBindState = -2},
	}
	
	for i = 1,getn(TAB_KML) do
		tbAwardTemplet:GiveAwardByList(TAB_KML[i], "PhÇn th­ëng Kim M· LÖnh");
	end
	ConsumeEquiproomItem(1,6,1,4089,-1)
end

function no()
end