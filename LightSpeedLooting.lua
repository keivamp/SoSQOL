--[[
###########################################
Symphony of Souls Quality of Life: keivamp#
###########################################
]]--
local E, L, V, P, G = unpack(ElvUI)

local addon = CreateFrame("Frame")
local epoch = 0

local LOOT_DELAY = 0.3

addon:RegisterEvent("LOOT_READY")

addon:SetScript("OnEvent", function ()

	if GetCVarBool("autoLootDefault") ~= IsModifiedClick("AUTOLOOTTOGGLE") then
		if (GetTime() - epoch) >= LOOT_DELAY then
			for i = GetNumLootItems(), 1, -1 do
				LootSlot(i)
			end
			epoch = GetTime()
		end
	end
end)
