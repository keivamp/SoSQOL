--[[
###########################################
Symphony of Souls Quality of Life: keivamp#
###########################################
]]--
local E, L, V, P, G = unpack(ElvUI)


local addonName, addon = ...
addon[1] = {} -- Gloable
addon[2] = {} -- Function
addon[3] = {} -- Config
addon[4] = {} -- Locale

local G, F, C, L = unpack(select(2,...))

local locale = GetLocale()
local L = {
    enterCombat = { default = "KILL IT!"},
    leaveCombat = { default = "Chill out."},
}
local alertFrame = CreateFrame("Frame")
alertFrame:SetSize(400, 65)
alertFrame:SetPoint("CENTER", 0, 180)
alertFrame:SetScale(1.3)
alertFrame:Hide()

alertFrame.text = alertFrame:CreateFontString(nil, "ARTWORK", "GameFont_Gigantic")
alertFrame.text:SetPoint("CENTER")
alertFrame:SetScript("OnUpdate", function(self, elapsed)

    self.timer = self.timer + elapsed
    if (self.timer > self.totalTime) then self:Hide() end
    if (self.timer <= 0.5) then
        self:SetAlpha(self.timer * 2)
    elseif (self.timer > 2) then
        self:SetAlpha(1-self.timer/self.totalTime)
    end
end)
alertFrame:SetScript("OnShow", function(self)

    self.totalTime = 3.2
    self.timer = 0
end)
alertFrame:SetScript("OnEvent", function(self, event, ...)

    self:Hide()
    if (event == "PLAYER_REGEN_DISABLED") then
        self.text:SetText(L.enterCombat[locale] or L.enterCombat.default)
    elseif (event == "PLAYER_REGEN_ENABLED") then
        self.text:SetText(L.leaveCombat[locale] or L.leaveCombat.default)
    end
    self:Show()
end)
alertFrame:RegisterEvent("PLAYER_REGEN_ENABLED")
alertFrame:RegisterEvent("PLAYER_REGEN_DISABLED")
