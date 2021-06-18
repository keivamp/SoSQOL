--[[
###########################################
Symphony of Souls Quality of Life: keivamp#
###########################################
]]--



local _G = _G
local CreateFrame = _G.CreateFrame

function ScreenShotOnEvent()

	ScreenShotFrame = CreateFrame("Frame")
	ScreenShotFrame.delay = 1
	ScreenShotFrame:Show()
end

function CreateAutoScreenShot()

		 ScreenShotFrame = CreateFrame("Frame")
		ScreenShotFrame.delay = 1
	ScreenShotFrame:Show()
		ScreenShotFrame:SetScript("OnUpdate", function(self, elapsed)
			self.delay = self.delay - elapsed
			if self.delay < 0 then
				Screenshot()
				self:Hide()
			end
		end)
			
end

local keivampLoginFrame=CreateFrame("Frame")

		keivampLoginFrame:RegisterEvent("PLAYER_LEVEL_UP",CreateAutoScreenShot)
		keivampLoginFrame:RegisterEvent("ACHIEVEMENT_EARNED",CreateAutoScreenShot)
		keivampLoginFrame:SetScript("OnEvent", function(self, event) 
		CreateAutoScreenShot()
												
		end)