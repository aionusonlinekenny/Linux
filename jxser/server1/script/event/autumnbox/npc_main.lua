Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")



function main()
	dofile("script/event/autumnbox/npc_main.lua")
	local strTitle = "<npc>Trong thêi gian ho¹t ®éng, mäi ng­êi cã thÓ ®æi quµ ®Ó së h÷u nh÷ng vËt phÈm thËt gi¸ trÞ, <color=red>cÇn 2 B¸nh Trung Thu §Ëu Xanh<color> ®Ó ®æi 1 hép b¸nh trung thu"
	local tbOpt =
	{
		{"Ta muèn ®æi hép b¸nh trung thu",doibanhtrungthu},
		{"Tho¸t"},
	}
	CreateNewSayEx(strTitle, tbOpt)
end



function CountHop(nIndex)
	local nHop = CalcEquiproomItemCount(6,1,nIndex,-1)
	return floor(nHop/2)
end

function DelNguyenLieu(nIndex,count)
	ConsumeEquiproomItem(count,6,1,nIndex,-1)
end



function FindHop(nIndex)
	local nHop = CountHop(891)
	return min(nHop)
end



function doibanhtrungthu()
	local nHop = FindHop(891)
	AskClientForNumber("doibanh",0,nHop, "Mêi nhËp sè l­îng hép b¸nh: ")
end


function doibanh(n_key)
	local nHop = FindHop(891)
	if (n_key < 0 or n_key > nHop) then
		return
	end
	
	for i=1,n_key do
		local nIndex = AddItem(6,1,4861,0,0,0)
		DelNguyenLieu(891,2)		
	end
end
