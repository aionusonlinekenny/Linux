Include( "\\script\\missions\\leaguematch\\head.lua" )

function main(sel)
	Say("<color=green>Xa phu:<color> Chµo mõng c¸c vÞ ®Õn tham gia “Vâ L©m Liªn §Êu”, ta lµ xa phu cña cuéc thi nµy, quý kh¸ch muèn ngåi xe, xin cø dÆn dß!", 8,
		"Ph­îng T­êng phñ/#wlls_want2go(1)",
		"Thµnh §« phñ/#wlls_want2go(11)",
		"§¹i Lý phñ/#wlls_want2go(162)",
		"BiÖn Kinh phñ/#wlls_want2go(37)",
		"T­¬ng D­¬ng phñ/#wlls_want2go(78)",
		"D­¬ng Ch©u phñ/#wlls_want2go(80)",
		"L©m An phñ/#wlls_want2go(176)",
	"§©u còng kh«ng muèn ®i!/OnCancel")
end;

tbCP_STATION = {
	[1] = { {1557, 3112}, {1537, 3237}, {1649, 3287}, {1656, 3167}, "Ph­îng T­êng phñ" },
	[11] = { {3193, 5192}, {3266, 5004}, {3011, 5101}, {3031, 4969}, "Thµnh §« phñ" },
	[37] = { {1598, 3000}, {1866, 2930}, {1701, 3224}, {1636, 3191}, "BiÖn Kinh phñ" },
	[78] = { {1592, 3377}, {1704, 3225}, {1508, 3147}, {1440, 3219}, "T­¬ng D­¬ng phñ" },
	[80] = { {1670, 2996}, {1598, 3201}, {1722, 3210}, {1834, 3063}, "D­¬ng Ch©u phñ" },
	[162] = { {1669, 3129}, {1696, 3280}, {1472, 3273}, "§¹i Lý phñ" },
	[176] = { {1603, 2917}, {1692, 3296}, {1375, 3337}, {1356, 3017}, "L©m An phñ" }
}

function wlls_want2go(stationname)
	local n_oldidx = SubWorld
	local SubWorld = SubWorldID2Idx(wlls_get_mapid(3))
	local n_camp = wlls_findfriend(WLLS_MSID_COMBAT, GetName())
	SubWorld = n_oldidx
	if (n_camp) then
		Say("<color=green>Xa phu:<color> Nhãm cña ng­¬i ®ang thi ®Êu? NÕu nh­ b©y giê rêi khái ®©y sÏ kh«ng nhËn ®­îc gi¶i th­ëng. Ng­¬i x¸c nhËn muèn rêi khái?",
			2, "§óng vËy!/#cp_station("..stationname..")", "Kh«ng cÇn!/OnCancel")
	else
		cp_station(stationname)
	end
end

function cp_station(stationname)
	if (tbCP_STATION[stationname] == nil) then
		print("chefu cann't find station")
		return
	end
	local count = getn(tbCP_STATION[stationname]) - 1
	local randnum = random(count)
	Msg2Player("Ngåi yªn ch­a? Chóng ta ®i "..tbCP_STATION[stationname][count+1])
	NewWorld(stationname, tbCP_STATION[stationname][randnum][1], tbCP_STATION[stationname][randnum][2])
end
