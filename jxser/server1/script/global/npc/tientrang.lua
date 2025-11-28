-- Author by AloneScript (Linh Em)

Include("\\script\\global\\mocnapthe\\head.lua");
Include("\\script\\global\\systemconfig.lua");
Include("\\script\\dailogsys\\dailogsay.lua");

if (SYSCFG_EXTPOINTID1_TYPEPAY == 0) then
	Include("\\script\\global\\payment\\coin.lua")
elseif (SYSCFG_EXTPOINTID1_TYPEPAY == 1) then
	Include("\\script\\global\\payment\\knb.lua")
end

function NPC_TienTrang()
	local tbOpt = {"Ng­¬i t×m ta cã viÖc g×?"};
	local pType = "";
		if (SYSCFG_EXTPOINTID1_TYPEPAY == 0) then
			pType = "Ng©n hµng tiÒn tÖ (tiÒn ®ång)/PaymentSystemCoin";
		elseif (SYSCFG_EXTPOINTID1_TYPEPAY == 1) then
			pType = "Ng©n hµng tiÒn tÖ (KNB)/PaymentSystemKNB";
		end
		tinsert(tbOpt, pType)
		tinsert(tbOpt, "KiÓm tra mèc n¹p thÎ hiÖn t¹i/PlayerCheckCard")
		tinsert(tbOpt, "PhÇn th­ëng ®¹t mèc n¹p thÎ/MenuPlayerCard")
		tinsert(tbOpt, "KÕt thóc ®èi tho¹i./no")
	CreateTaskSay(tbOpt)
end
