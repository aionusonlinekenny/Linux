-- Include("\\script\\global\\vcf4i3n\\vcf4i3n_inc.lua")
IncludeLib("ITEM")
IncludeLib("FILESYS")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\remoteexc.lua")

G_iNumber = {}
G_iItem = {}

if not (_VCF_INC) then
	_VCF_INC = 1
	
vcf = {
	iNumber = function(_1, _2, _3, _4)
		if not(G_iNumber[PlayerIndex]) then
			G_iNumber[PlayerIndex] = {}
		end
		G_iNumber[PlayerIndex] = _4
		return AskClientForNumber("CallFunc_iNumber", _1, _2, _3)
	end,
	
	iItem = function(Title, Desc, Array)
		if not(G_iItem[PlayerIndex]) then
			G_iItem[PlayerIndex] = {}
		end
		G_iItem[PlayerIndex] = Array
		return GiveItemUI(Title, Desc, "CallFunc_iItem", "OnCancel", 1)
	end,

	Time = {
		SetExpired = function(nTime, nTask)
			if not(nTask) or vcf.False(nTask) then
				return Msg2Player("Time.SetExpired: Null Task!")
			end
			SetTask(nTask, (nTime or 0) + ((GetTask(nTask) ~= 0) and GetTask(nTask) or GetCurServerTime()))
		end,
		
		GetExpired = function(Task)
			return vcf.False(GetTask(Task)) and nil or (((GetTask(Task) - GetCurServerTime()) > 0) and (GetTask(Task) - GetCurServerTime()) or nil)
		end,
	},

	False = function(vcfVal)
		if (not(vcfVal) or vcfVal == nil or vcfVal == 0 or vcfVal == "") then return 1 
		else return nil end
	end,
	
	True = function(vcf_In_1)
		if vcf.False(vcf_In_1) then return nil
		else return 1 end
	end,
	
	Str2Byte = function(string, b_Count)
		local len, vcfByteRet = strlen(string), ""
		for i = 1, len do vcfByteRet = vcfByteRet..strbyte(string, i) end
		if (b_Count == 1) then
			return vcfByteRet, vcf.Math.Count(vcfByteRet)
		else
			return vcfByteRet
		end
	end,
	
	Math = {
		Count = function(nListNumber)
			local a_s = tostring(nListNumber)
			local a = strlen(a_s)
			local b, b_n = 0, 0
			if vcf.False(a) then return 0 end
			for i = 1, a do
				b_n = 0
				b_n = tonumber(strsub(a_s, i, i))
				b = b + ((type(b_n) == "number") and b_n or 0)
			end
			return b
		end,
	},
	
	C = function(CodeColor, vcfStr)
		local vcfColorTb = {yel = "yellow",gre = "green",ora = "Orange",blu = "blue",red = "red",woo = "wood",fir = "fire",}
		-- 										1				2			  3		 4				5			6			 7			 8				9					10				11
		local vcfColorTbNum = {"yellow","green","red","Orange","blue","wood","fire", "white", "0x92ff8f", "0xa9ffe0", "0x00ffff"}
		if type(CodeColor) == "number" then return "<color="..vcfColorTbNum[CodeColor]..">"..vcfStr.."<color>" end
		return "<color="..vcfColorTb[CodeColor]..">"..vcfStr.."<color>"
	end,
	
	InitRandMemTb = function(vcf_1)
		local vcf_tb, vcf_2, vcf_3 = {}, 0, 0
		for i = 1, vcf_1 do tinsert(vcf_tb, i) end
		for i2 = 1, vcf_1 do
			vcf_2 = random(1, vcf_1)
			vcf_3 = vcf_tb[i2]
			vcf_tb[i2] = vcf_tb[vcf_2]
			vcf_tb[vcf_2] = vcf_3
		end
		return vcf_tb
	end,
	
	TaskDate = function(vcf_1, vcf_2, vcf_3)
		local vcf_4 = tonumber(date("%y%m%d"))
		if GetTask(vcf_1) ~= vcf_4 then
			SetTask(vcf_1, vcf_4)
			SetTask(vcf_3, vcf_2)
			return 0
		else
			return GetTask(vcf_3)
		end
	end,
	
	Pack = function(...)
		return arg
	end,
	
	Talk = function(_s)
		return Talk(1,"", _s)
	end,
	
	UpLevel = function(n_1)
		if GetLevel() >= n_1 then return end
		while GetLevel() < n_1 do
			AddOwnExp(999999999)
		end
	end,
	
	Say = function(vcf_In_1, vcf_In_2, vcf_In_3, vcf_In_4)
		local vcf_1, vcf_2, vcf_3, vcf_4, vcf_6, vcf_7 = vcf_In_1, nil, {}, 1, nil, {cc = {}}
		if not(vcf_In_1) then return end
		if getn(vcf_In_1) > 1 then
			vcf_4 = getn(vcf_In_1)
		end
		for vcf_l_1 = 1, vcf_4 do
			if vcf_In_1[vcf_l_1] then
				vcf_1 = vcf_In_1[vcf_l_1].P
				vcf_2 = vcf_In_1[vcf_l_1].M or nil
				vcf_6 = vcf_In_1[vcf_l_1].H or nil
			elseif vcf_1.P then
				return vcf.Talk(vcf.C(3, "Input Param is Incorect"))
			end
			if not(vcf_In_1[vcf_l_1]) or not(vcf_In_1[vcf_l_1].P) or vcf_In_3 then
				if vcf_1.cc and getn(vcf_1.cc) > 0 then
					for vcf_l_2 = 1, getn(vcf_1.cc) do
						local vcf_5
						if getn(vcf_1.cc[vcf_l_2][3]) > 0 then
							vcf_5 = call(vcf_1.cc[vcf_l_2][1], vcf_1.cc[vcf_l_2][3])
						else
							vcf_5 = vcf_1.cc[vcf_l_2][1]()
						end
							-- [2] 0: =, 1 >, -1 <, 2 ~=, 3 >= - [4]: value
						if vcf_1.cc[vcf_l_2][2] == 1 then
							if vcf_5 > vcf_1.cc[vcf_l_2][4] then 
								if vcf_In_4 then return nil end
								return vcf.Talk(vcf_1.cc[vcf_l_2][5]) 
							end
						elseif vcf_1.cc[vcf_l_2][2] == 0 then
							if vcf_5 == vcf_1.cc[vcf_l_2][4] then 
								if vcf_In_4 then return nil end
								return vcf.Talk(vcf_1.cc[vcf_l_2][5]) 
							end
						elseif vcf_1.cc[vcf_l_2][2] == -1 then
							if vcf_5 < vcf_1.cc[vcf_l_2][4] then 
								if vcf_In_4 then return nil end
								return vcf.Talk(vcf_1.cc[vcf_l_2][5]) 
							end
						elseif vcf_1.cc[vcf_l_2][2] == 2 then
							if vcf_5 ~= vcf_1.cc[vcf_l_2][4] then 
								if vcf_In_4 then return nil end
								return vcf.Talk(vcf_1.cc[vcf_l_2][5]) 
							end
						elseif vcf_1.cc[vcf_l_2][2] == 3 then
							if vcf_5 >= vcf_1.cc[vcf_l_2][4] then 
								if vcf_In_4 then return nil end
								return vcf.Talk(vcf_1.cc[vcf_l_2][5]) 
							end
						else
							return vcf.Talk(vcf.C(3, "Condition: "..(vcf_1.cc[vcf_l_2][2] or  "NIL").." is Unknow"))
						end
					end
					if vcf_In_4 then return 1 end
				end
			else
				if vcf_2 then
					if vcf_6 then
						vcf_7.cc = vcf_6
						if vcf.Say(vcf_7, nil, 1, 1) then
							tinsert(vcf_3, {vcf_2, vcf.Say, {vcf_1, nil, 1}})
						end
					else
						tinsert(vcf_3, {vcf_2, vcf.Say, {vcf_1, nil, 1}})
					end
				end
			end
		end
		if getn(vcf_3) > 0 or vcf_6 then
			tinsert(vcf_3, {"KÕt thóc ®èi tho¹i", OnCancel})
			if not(vcf_In_2) then 
				vcf_In_2 = "<< Xin lùa chän c¸c tïy chän liÖt kª bªn d­íi >>"
			end
			return CreateNewSayEx(vcf_In_2, vcf_3)
		end
		return Say_Step2(vcf_1)
	end,
	
	SplitTime = function(_1)
		local r, b, c = {0, 0, 0, 0, 0, 0}, {"n¨m", "th¸ng", "ngµy", "giê", "phót", "gi©y"}, ""
		local a = {{31536000},{2592000},{86400},{3600},{60}}
		local _1 = _1 or 0
		
		for _i = 1, getn(a) do
			if _1 >= a[_i][1] then
				r[_i] = floor(_1/a[_i][1])
				_1 = _1 - (a[_i][1]*r[_i])
			end
		end
		
		local d = getn(r)
		r[d] = _1
		
		for _i = 1, d do
			c = c..((r[_i] ~= 0) and ("<color=yellow>"..r[_i].." "..b[_i].."<color> ") or "")
		end
		
		return r, ((c ~= "") and c or "0 gi©y")
	end,
	
	JoinTime = function(_1, _2, _3)
		local a, b = {{31536000},{2592000},{86400},{3600},{60}}, 0
		
		for _i = 1, getn(a) do
			if vcf.True(_1[_i]) then
				b = b + (_1[_i]*a[_i][1])
			end
		end
		
		b = vcf.True(_1[getn(_1)]) and (_1[getn(_1)] + b) or b
		
		-- return vcf.True(_2) and SetTask(_2, (GetTask(_2) + b)) or b
		return vcf.True(_2) and SetTask(_2, ((_3 and GetTask(_2) or 0) + b)) or b
	end,
	
	IniFile = {
		_In_a = "",
	
		Load = function(_1)
			_In_a = "\\script\\global\\vldoxanh_log\\".._1
			if (IniFile_Load(_In_a, _In_a) == 0) then 
				File_Create(_In_a)
				IniFile_Load(_In_a, _In_a)
			end
		end,
		
		Get = function(Sect, Key)
			local a = IniFile_GetData(_In_a, Sect, Key)
			return vcf.False(a) and nil or a
		end,
		
		Set = function(Sect,Key,Value)
			IniFile_SetData(_In_a, Sect, Key, Value)
			IniFile_Save(_In_a,_In_a)
		end,
		
		Release = function()
			IniFile_UnLoad(_In_a,_In_a)
		end,
	},
	
	Msg2AllWorld = function(_1)
		RemoteExc("\\script\\global\\vldoxanh\\msg2allworld.lua", "vcfMsg2AllWorld:Send2All", {_1})
	end,
	
	OnCancel = function() return end,
}

function Say_Step2(vcf_In_1)
	local vcf_1, vcf_3
	if vcf_In_1.i and getn(vcf_In_1.i) > 0 then
		for vcf_l_1 = 1, getn(vcf_In_1.i) do
			for vcf_l_2 = 1, vcf_In_1.i[vcf_l_1].n do
				vcf_1 = AddItemNoStack(unpack(vcf_In_1.i[vcf_l_1].v))
				if vcf_In_1.i[vcf_l_1].e ~= 0 then
					ITEM_SetExpiredTime(vcf_1, FormatTime2Date(vcf_In_1.i[vcf_l_1].e + GetCurServerTime()))
					SyncItem(vcf_1)
				end
				if vcf_In_1.i[vcf_l_1].b ~= 0 then
					SetItemBindState(vcf_1, vcf_In_1.i[vcf_l_1].b)
				end
				if vcf_In_1.i[vcf_l_1].p and getn(vcf_In_1.i[vcf_l_1].p) > 0 then
					for _i = 1, getn(vcf_In_1.i[vcf_l_1].p) do
						SetSpecItemParam(vcf_1, _i, vcf_In_1.i[vcf_l_1].p[_i])
						SyncItem(vcf_1)
					end
				end
				if vcf_In_1.i[vcf_l_1].l and type(vcf_In_1.i[vcf_l_1].l) == "string" then
					vcf_3 = openfile("script/global/vldoxanh_log/"..(vcf_In_1.i[vcf_l_1].l)..".log", "a")
						write(vcf_3, GetLocalDate("[%d-%m-%y %H:%M:%S]").."\tAcc: "..GetAccount().."\tName: "..GetName().."\tGiveItem: ["..vcf_In_1.i[vcf_l_1].v[1]..", "..vcf_In_1.i[vcf_l_1].v[2]..", "..vcf_In_1.i[vcf_l_1].v[3]..", "..vcf_In_1.i[vcf_l_1].v[4].."] "..vcf_In_1.i[vcf_l_1].ne.."\tCount: "..vcf_In_1.i[vcf_l_1].n.."\tBindState: "..vcf_In_1.i[vcf_l_1].b.."\tExpired: "..vcf_In_1.i[vcf_l_1].e.."\n")
					closefile(vcf_3)
				end
			end
		end
	end
	if vcf_In_1.ig and getn(vcf_In_1.ig) > 0 then
		for vcf_l_3 = 1, getn(vcf_In_1.ig) do
			for vcf_l_4 = 1, vcf_In_1.ig[vcf_l_3].n do
				vcf_1 = AddGoldItem(0, (vcf_In_1.ig[vcf_l_3].v[1] - 1))
				if vcf_In_1.ig[vcf_l_3].e ~= 0 then
					ITEM_SetExpiredTime(vcf_1, FormatTime2Date(vcf_In_1.ig[vcf_l_3].e + GetCurServerTime()))
					SyncItem(vcf_1)
				end
				if vcf_In_1.ig[vcf_l_3].b ~= 0 then
					SetItemBindState(vcf_1, vcf_In_1.ig[vcf_l_3].b)
				end
				if vcf_In_1.i[vcf_l_1].l and type(vcf_In_1.i[vcf_l_1].l) == "string" then
					vcf_3 = openfile("script/global/vldoxanh_log/"..(vcf_In_1.i[vcf_l_1].l)..".log", "a")
						write(vcf_3, GetLocalDate("[%d-%m-%y %H:%M:%S]").."\tAcc: "..GetAccount().."\tName: "..GetName().."\tGiveItemGold: ["..(vcf_In_1.ig[vcf_l_3].v[1] - 1).."] "..vcf_In_1.i[vcf_l_1].ne.."\tCount: "..vcf_In_1.i[vcf_l_1].n.."\tBindState: "..vcf_In_1.i[vcf_l_1].b.."\tExpired: "..vcf_In_1.i[vcf_l_1].e.."\n")
					closefile(vcf_3)
				end
			end
		end
	end
	if vcf_In_1.c and getn(vcf_In_1.c) > 0 then
		local vcf_2 = 1
		for vcf_l_5 = 1, getn(vcf_In_1.c) do
			if vcf_In_1.c[vcf_l_5][3] and vcf_In_1.c[vcf_l_5][3] > 0 then
				vcf_2 = vcf_In_1.c[vcf_l_5][3]
			end
			for vcf_l_6 = 1, vcf_2 do
				if vcf_In_1.c[vcf_l_5][2] and getn(vcf_In_1.c[vcf_l_5][2]) > 0 then
					call(vcf_In_1.c[vcf_l_5][1], vcf_In_1.c[vcf_l_5][2])
				else
					vcf_In_1.c[vcf_l_5][1]()
				end
			end
			vcf_2 = 1
		end
	end
end

function CallFunc_iNumber(_1)
	if not(G_iNumber[PlayerIndex]) then
		return Msg2Player("CallBack iNumber NULL!")
	end
	
	local a = G_iNumber[PlayerIndex]
	G_iNumber[PlayerIndex] = nil
	
	tinsert(a[2], _1)
	
	return call(a[1], a[2])
end

function CallFunc_iItem(_1)
	if not(G_iItem[PlayerIndex]) then
		return Msg2Player("CallBack iItem NULL!")
	end
	
	local a = G_iItem[PlayerIndex]
	G_iItem[PlayerIndex] = nil
	
	tinsert(a[2], _1)
	
	return call(a[1], a[2])
end

end

-- local a = {
	-- {
		-- M = "test",
		-- H = {{GetLevel, 1, {}, 30}},
		-- P = {
			-- c = {{Msg2Player, {"complete!!"}},{Msg2Player, {"B¹n ®­îc n©ng lªn ®¼ng cÊp 199"}},},
			-- cc = {{GetLevel, 1, {}, 30, "§¼ng cÊp ®· lín h¬n 30!"},},
			-- i = {
				-- {v = {6,1,71,1,0,0,0}, n = 1, b = -2, e = 0, ne = "Tiªn th¶o lé"},},
			-- ig = {
				-- {v = {186}, n = 1, b = -2, e = 0, ne = "Kim Phong §ång T­íc Xu©n Th©m"},
			-- },
		-- }
	-- },
-- }

-- vcf.Say(a, "aaa")















