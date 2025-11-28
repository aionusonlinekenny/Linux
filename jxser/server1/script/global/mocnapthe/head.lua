-- Mèc n¹p thÎ by AloneScript

Include("\\script\\lib\\alonelib.lua");
Include("\\script\\dailogsys\\dailogsay.lua");
Include("\\script\\global\\systemconfig.lua");

if (SYSCFG_EXTPOINTID1_TYPEPAY == 0) then --§èi víi server sö dông tiÒn ®ång
	CARDPAYMENT_RATIO = 10; -- Tû lÖ mèc n¹p thÎ ®æi ra. du: VD: tØ lÖ víi 1.000 VN§ = 10 xu (gi¸ trÞ tÝnh theo ®¬n vÞ xu cho 1k VN§)
elseif (SYSCFG_EXTPOINTID1_TYPEPAY == 1) then --§èi víi server sö dông KNB
	CARDPAYMENT_RATIO = 10; -- Tû lÖ mèc n¹p thÎ: VD: tØ lÖ víi 10.000 VN§ = 1 KNB (gi¸ trÞ tÝnh theo ®¬n vÞ VN§ cho 1 viªn KNB)
end

function PlayerCheckCard()
	local nCard, nCount = GetCardPayment();
	local szVND = StringPayment(nCard)
	local szPay = "";
	if (SYSCFG_EXTPOINTID1_TYPEPAY == 0) then
		szPay = "tiÒn ®ång";
	elseif (SYSCFG_EXTPOINTID1_TYPEPAY == 1) then
		szPay = "KNB"
	end
	local szMsg = "";
	Say(format("HiÖn t¹i b¹n ®· n¹p ®­îc tæng céng <color=yellow>%d %s<color> t­¬ng ®­¬ng víi <color=yellow>"..szVND.." VN§<color>", nCount, szPay), 0)
end

function AddCardPayment(nCard)
	local Data1 = PLAYER_CHARGECARD;
	local Data2 = GetName();
	local Data3 = TASKMODULE_DATACARD;
	local nPay = GetTaskModule(Data1, Data2, Data3);
	SetTaskModule(Data1, Data2, Data3, nPay+nCard);
end

function GetCardPayment()
	local nCard = 0;
	local Data1 = PLAYER_CHARGECARD;
	local Data2 = GetName();
	local Data3 = TASKMODULE_DATACARD;
	local nRatio = CARDPAYMENT_RATIO;
	local nPay = GetTaskModule(Data1, Data2, Data3);
	local nGlobal = 0;
	if (nPay == 0) then 
		return 0, 0 ;
	end;
	local nCount = 0;
	if (SYSCFG_EXTPOINTID1_TYPEPAY == 0) then
		for i = 1, nPay do
			nCount = nCount + 1;
			if (nCount == nRatio) then
				nCard = nCard + 1;
				nCount = 0;
			end
		end
		nGlobal = (nCard+(nCount/10));
	elseif (SYSCFG_EXTPOINTID1_TYPEPAY == 1) then
		nGlobal = (nPay*nRatio);
	end
return nGlobal, nPay end

function StringPayment(n_pay)
	if (n_pay < 1) then
		local n_du = mod(n_pay, 1);
		local n_tram = floor(n_du*10);
		return n_tram.."00 ®ång";
	elseif (n_pay >= 1) and (n_pay < 1000) then
		local n_du = mod(n_pay, 1);
		local n_nghin = floor(n_pay);
		local n_tram = floor(n_du*10);
		return n_nghin.." ngh×n "..n_tram.."00 ®ång";
	elseif (n_pay >= 1000) and (n_pay < 1000000) then
		local n_du = mod(n_pay, 1);
		local n_tram = floor(n_du*10);
		local n_nghin = floor(mod(n_pay, 1000));
		local n_trieu = floor(floor(n_pay)/1000);
		return n_trieu.." triÖu "..n_nghin.." ngh×n "..n_tram.."00 ®ång";
	elseif (n_pay >= 1000000) then
		local n_du = mod(n_pay, 1);
		local n_tram = floor(n_du*10);
		local n_nghin = floor(mod(n_pay, 1000));
		local n_trieu = mod(floor(n_pay/1000),1000);
		local n_ty = floor((floor(n_pay)/1000)/1000);
		return n_ty.." tû "..n_trieu.." triÖu "..n_nghin.." ngh×n "..n_tram.."00 ®ång";
	end
end