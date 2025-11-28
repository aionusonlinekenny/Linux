IncludeLib("ITEM");
IncludeLib("FILESYS");
Include("\\script\\dailogsys\\dailogsay.lua");
Include("\\script\\item\\doxanh\\doxanh_head.lua");


function checkdoxanhitem()
    GiveItemUI("Check Item", "H·y ®Æt vËt phÈm vµo « bªn d­íi.", "doxanh_process", "onCancel", 1);
end

function doxanh_process(nItemIdx)
    	local nItemIdx = GetGiveItemUnit(nItemIdx);
	local nItemName = GetItemName(nItemIdx);
	local nGenre, nDetailType, nParticular, nLevel, nSeries, nLuck = GetItemProp(nItemIdx);
	Msg2Player("<color=yellow>"..nItemName)
	Msg2Player("<color=red>CÊp ®é: "..nLevel)
	local tbHe = %tb_MagicNameList[2]["tbHe"]
	for h = 1, getn(tbHe) do
	if nSeries == tonumber(tbHe[h][2]) then
	Msg2Player("<color=red>HÖ: <color="..tbHe[h][3]..">"..tbHe[h][1])
	break
	end
end
	Msg2Player("<color=red>May m¾n: "..nLuck)
	Msg2Player("<color=white>----------------------------\n");
    	local tb_MagicList = {}

	for i = 1, 6 do
    		tb_MagicList[getn(tb_MagicList) + 1] = pack(GetItemMagicAttrib(nItemIdx, i))
    		local szNameMG = tonumber(tb_MagicList[i][1])
    		local tbThuottinh = %tb_MagicNameList[1]["tbThuottinh"]
		local found = false

    		for j = 1, getn(tbThuottinh) do
        		if szNameMG == tonumber(tbThuottinh[j][2]) and found == false then
			Msg2Player("<color=blue>" .. tbThuottinh[j][1] .. "<color=green>+" .. tb_MagicList[i][2])
            		found = true
            		break
        		end
    		end

    -- NÕu sau khi duyÖt mµ kh«ng tim thÊy
    if not found then
        	Msg2Player("<color=­white>- Thuét tÝnh ID: <color=yellow>"..szNameMG)
    end
end
Msg2Player("<color=white>----------------------------\n");

end

function onCancel()
    Msg2Player("C¶m ¬n ®¹i hiÖp ghÐ qua.", 0);
end
