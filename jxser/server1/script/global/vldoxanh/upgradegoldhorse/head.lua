UpgradeGoldHorse = {};
UpgradeGoldHorse.Patch = "script/UpgradeGoldHorse/gold.dat";

function UpgradeGoldHorse:GetFaction(szFaction)
	local tbFaction = {
		["0"] = "ThiÕu L©m",
		["1"] = "Thiªn V­¬ng",
		["2"] = "§­êng M«n",
		["3"] = "Ngò §éc",
		["4"] = "Nga Mi",
		["5"] = "Thóy Yªn",
		["6"] = "C¸i Bang",
		["7"] = "Thiªn NhÉn",
		["8"] = "Vâ §ang",
		["9"] = "C«n L«n",
	};
	local tbRoute = {
		["0"] = {
			["1"] = "ThÇn M·",
			["2"] = "La ThÇn",
			["3"] = "ThÇn Léc",
			["4"] = "ThÇn Hæ",
			["5"] = "Cùc PhÈm ThÇn Thó",
		},
		["1"] = {
			["1"] = "ThÇn M·",
			["2"] = "La ThÇn",
			["3"] = "ThÇn Léc",
			["4"] = "ThÇn Hæ",
			["5"] = "Cùc PhÈm ThÇn Thó",
		},
		["4"] = {
			["1"] = "ThÇn M·",
			["2"] = "La ThÇn",
			["3"] = "ThÇn Léc",
			["4"] = "ThÇn Hæ",
			["5"] = "Cùc PhÈm ThÇn Thó",
		},
		["5"] = {
			["1"] = "ThÇn M·",
			["2"] = "La ThÇn",
			["3"] = "ThÇn Léc",
			["4"] = "ThÇn Hæ",
			["5"] = "Cùc PhÈm ThÇn Thó",
		},
		["6"] = {
			["1"] = "ThÇn M·",
			["2"] = "La ThÇn",
			["3"] = "ThÇn Léc",
			["4"] = "ThÇn Hæ",
			["5"] = "Cùc PhÈm ThÇn Thó",
		},
		["7"] = {
			["1"] = "ThÇn M·",
			["2"] = "La ThÇn",
			["3"] = "ThÇn Léc",
			["4"] = "ThÇn Hæ",
			["5"] = "Cùc PhÈm ThÇn Thó",
		},
		["8"] = {
			["1"] = "ThÇn M·",
			["2"] = "La ThÇn",
			["3"] = "ThÇn Léc",
			["4"] = "ThÇn Hæ",
			["5"] = "Cùc PhÈm ThÇn Thó",
		},
		["9"] = {
			["1"] = "ThÇn M·",
			["2"] = "La ThÇn",
			["3"] = "ThÇn Léc",
			["4"] = "ThÇn Hæ",
			["5"] = "Cùc PhÈm ThÇn Thó",
		},
		
	};
	return tbFaction[szFaction];
end;

function UpgradeGoldHorse:InitMain()
	local file = openfile(self.Patch,"r");
	if (not file) then
		return
	end;
	
	read(file,"*l");
	while (1) do
		szTemp = read(file,"*l");
		if (szTemp) then
			local tbTemp = split(szTemp,"	");
			if (not self.DATA[format("%s,%s",tbTemp[2],tbTemp[3])]) then
				self.DATA[format("%s,%s",tbTemp[2],tbTemp[3])] = {};
			end;
			tinsert(self.DATA[format("%s,%s",tbTemp[2],tbTemp[3])],tbTemp);
		else
			break;
		end;
	end;
	
	closefile(file);
end;

UpgradeGoldHorse:InitMain();


UpgradeNormalHorse = {};
UpgradeNormalHorse.Patch = "script/UpgradeNormalHorse/gold.dat";

function UpgradeNormalHorse:GetFaction(szFaction)
	local tbFaction = {
		["0"] = "ThiÕu L©m",
		["1"] = "Thiªn V­¬ng",
		["2"] = "§­êng M«n",
		["3"] = "Ngò §éc",
		["4"] = "Nga Mi",
		["5"] = "Thóy Yªn",
		["6"] = "C¸i Bang",
		["7"] = "Thiªn NhÉn",
		["8"] = "Vâ §ang",
		["9"] = "C«n L«n",
	};
	local tbRoute = {
		["0"] = {
			["1"] = "Ngùa 80",
			["2"] = "Ngùa 100",
			["3"] = "Ngùa 120",
			["4"] = "Ngùa 150",
		},
		["1"] = {
			["1"] = "Ngùa 80",
			["2"] = "Ngùa 100",
			["3"] = "Ngùa 120",
			["4"] = "Ngùa 150",
		},
		["4"] = {
			["1"] = "Ngùa 80",
			["2"] = "Ngùa 100",
			["3"] = "Ngùa 120",
			["4"] = "Ngùa 150",
		},
		["5"] = {
			["1"] = "Ngùa 80",
			["2"] = "Ngùa 100",
			["3"] = "Ngùa 120",
			["4"] = "Ngùa 150",
		},
		["6"] = {
			["1"] = "Ngùa 80",
			["2"] = "Ngùa 100",
			["3"] = "Ngùa 120",
			["4"] = "Ngùa 150",
		},
		["7"] = {
			["1"] = "Ngùa 80",
			["2"] = "Ngùa 100",
			["3"] = "Ngùa 120",
			["4"] = "Ngùa 150",
		},
		["8"] = {
			["1"] = "Ngùa 80",
			["2"] = "Ngùa 100",
			["3"] = "Ngùa 120",
			["4"] = "Ngùa 150",
		},
		["9"] = {
			["1"] = "Ngùa 80",
			["2"] = "Ngùa 100",
			["3"] = "Ngùa 120",
			["4"] = "Ngùa 150",
		},
		
	};
	return tbFaction[szFaction];
end;

function UpgradeNormalHorse:InitMain()
	local file = openfile(self.Patch,"r");
	if (not file) then
		return
	end;
	
	read(file,"*l");
	while (1) do
		szTemp = read(file,"*l");
		if (szTemp) then
			local tbTemp = split(szTemp,"	");
			if (not self.DATA[format("%s,%s",tbTemp[2],tbTemp[3])]) then
				self.DATA[format("%s,%s",tbTemp[2],tbTemp[3])] = {};
			end;
			tinsert(self.DATA[format("%s,%s",tbTemp[2],tbTemp[3])],tbTemp);
		else
			break;
		end;
	end;
	
	closefile(file);
end;

UpgradeNormalHorse:InitMain();