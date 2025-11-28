IL("TIMER")
IncludeLib("RELAYLADDER")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\script_protocol\\protocol_def_gs.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\global\\vldoxanh\\verify_client_inc.lua")

vcfVerifyClient = {
	vcf_sCodeVerify = "VerifyClient_HARY_hs94haegr",
}

function vcfVerifyClient:CallFuncMain(vcf_In_1, vcf_In_2)
	if vcfAllowVerifyClient == 0 then return end
	if SearchPlayer(vcf_In_1) <= 0 then
		return print("Khong lay duoc PlayerIndex: "..vcf_In_1)
	end
	if vcf_In_2 == self.vcf_sCodeVerify then
		-- Ghi mã xác minh vào log khi xác minh thành công
		self:WriteVerifyCodeLog(self.vcf_sCodeVerify)
		
		SetTaskTemp(255, 255255255)
		return TM_StopTimer(116)
	end
	return self:Notify(vcf_In_1)
end

function vcfVerifyClient:SendRequest2Client()
	if vcfAllowVerifyClient == 0 then return end
	SetTaskTemp(255, GetTaskTemp(255) + 1)
	local vcf_nHandle = OB_Create()
	ObjBuffer:PushByType(vcf_nHandle, OBJTYPE_STRING, "NONE")
	ObjBuffer:PushByType(vcf_nHandle, OBJTYPE_STRING, "NONE")
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_VERIFY_CLIENT", vcf_nHandle)
	OB_Release(vcf_nHandle)
	TM_SetTimer( 3 * 18,116,1,0);
end

function vcfVerifyClient:Notify(vcf_In_1, vcf_In_2)
	if vcfAllowVerifyClient == 0 then return end
	if vcf_In_2 then
		local vcf_1, vcf_2 = SearchPlayer(vcf_In_1), PlayerIndex
		if vcf_1 <= 0 then return end
		print("")
		PlayerIndex = vcf_1
		local vcf_3 = {GetAccount(), vcf_In_1, "0.0.0.0"} 
		print(">> [[VERIFY-CLIENT]] Account: "..vcf_3[1].." Nhan vat: << "..vcf_3[2].." >> IP: "..vcf_3[3])
		self:WriteLogsAdmin(vcf_3)
		OfflineLive(PlayerIndex)
		KickOutSelf()
		-- print("")
		-- PlayerIndex = vcf_2
	else
		TM_SetTimer( 3 * 18,116,1,0);
		return CreateNewSayEx("<link=image:\\spr\\skill\\ÉÙÁÖ\\sl_06_Ê¨×Óºð.spr><link><color><color=orange>Verify Client: <color>HÖ thèng x¸c nhËn patch game ®· ph¸t hiÖn <color=yellow>b¹n ®ang sö dông phiªn b¶n cò<color>, b¹n vui lßng khëi ch¹y game Autoupdate hoÆc t¶i patch míi tõ trang chñ ®Ó tham gia trß ch¬i!<enter><enter>HÖ thèng sÏ tù ®éng ®Èy b¹n ra khái trß ch¬i!", {{"T¹i h¹ biÕt råi!", self.Notify, {self, vcf_In_1, 2}}})
	end
end

function vcfVerifyClient:WriteLogsAdmin(vcf_In_1)
	if vcfAllowVerifyClient == 0 then return end
	local vcf_1, vcf_2, vcf_3, vcf_4 = {10490, 10499, 0}, {"", 0, 10490, 0}, tonumber(date("%m%d%H%M")), nil
	for vcf_l_1 = vcf_1[1], vcf_1[2] do
		if vcf_1[3] > 0 then break end
		for vcf_l_2 = 1, 10 do
			vcf_2[1], vcf_2[2] = Ladder_GetLadderInfo(vcf_l_1, vcf_l_2)
			if vcf.False(vcf_2[1]) or vcf.False(vcf_2[2]) then
				vcf_1[3] = vcf_1[3] + 1
				vcf_2[3] = vcf_l_1
				break
			elseif vcf_2[1] == vcf_In_1[1] then
				vcf_2[3] = vcf_l_1
				vcf_2[4] = vcf_2[2]
				vcf_1[3] = vcf_1[3] + 1
				break
			elseif vcf_l_1 == vcf_1[2] and vcf_l_2 == 10 then
				vcf_1[3] = vcf_1[3] + 1
				vcf_2[3] = vcf_1[1]
			end
		end
	end
	if vcf.False(vcf_2[4]) or strlen(vcf_2[4]) ~= 9 then
		vcf_4 = 1
	else
		vcf_4 = tonumber(strsub(vcf_2[4], 9, strlen(vcf_2[4]))) + 1
	end
	Ladder_NewLadder(vcf_2[3], vcf_In_1[1], tonumber(vcf_3..vcf_4), 1)
	
	-- M? file log và ghi c? thông tin mã xác minh (CodeVerify)
	local vcf_Logs_2 = openfile("script/global/vldoxanh/Verify_Client.log", "a")
	write(vcf_Logs_2, date("%H:%M:%S %d-%m-%y").."\tAccount: "..vcf_In_1[1].."\tPlayerName: "..vcf_In_1[2].."\tIP: "..vcf_In_1[3].."\tCodeVerify: "..self.vcf_sCodeVerify.."\n")
	closefile(vcf_Logs_2)
end

-- Thêm hàm m?i d? ghi mã xác minh cu?i cùng vào log
function vcfVerifyClient:WriteVerifyCodeLog(verifyCode)
	-- M? file log ? ch? d? ghi thêm (append mode)
	local logFile = openfile("script/global/vldoxanh/Verify_Code.log", "a")
	if logFile then
		-- Ghi mã xác minh cùng v?i th?i gian hi?n t?i vào file
		write(logFile, date("%H:%M:%S %d-%m-%y").."\tLast Verify Code: "..verifyCode.."\n")
		closefile(logFile)
	else
		print("Khong mo duoc file log!")
	end
end

function OnTimer()
	if vcfAllowVerifyClient == 0 then return end
	if GetTaskTemp(255) <= 1 then
		Msg2Player(vcf.C(4, "VerifyClient: ")..vcf.C(8, "M¸y chñ ch­a nhËn ®­îc ph¶n håi, tiÕn hµnh kiÓm tra l¹i..."))
		return vcfVerifyClient:SendRequest2Client()
	elseif GetTaskTemp(255) == 3 then
		return vcfVerifyClient:Notify(GetName(), 2)
	elseif GetTaskTemp(255) == 255255255 then
		return TM_StopTimer(116)
	end
	SetTaskTemp(255, GetTaskTemp(255) + 1)
	return vcfVerifyClient:Notify(GetName())
end