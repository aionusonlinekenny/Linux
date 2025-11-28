Include("\\script\\global\\systemconfig.lua") -- œµÕ≥≈‰÷√
Include("\\script\\global\\npc\\tientrang.lua")

function OnExtPointChange(nExtPointIndex, nChangeValue)
	return ExtPointChange(nExtPointIndex, nChangeValue);
end
