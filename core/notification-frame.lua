-- Hauptframe erstellen
HungryPetNotification.notificationFrame = HungryPetNotification.notificationFrame or {    
    frameObject = nil,
    textObject = nil
}

local texts = HungryPetNotification.texts

HungryPetNotification.notificationFrame.frameObject = CreateFrame("Frame", "notificationFrame", UIParent)
local notificationFrame = HungryPetNotification.notificationFrame.frameObject
notificationFrame:SetWidth(200)
notificationFrame:SetHeight(60)
notificationFrame:SetPoint("CENTER", UIParent, "CENTER", HungryPetNotificationDB.notification.position.x, HungryPetNotificationDB.notification.position.y)
notificationFrame:SetFrameStrata("DIALOG")
-- Lock-Status initial
notificationFrame.isLocked = HungryPetNotificationDB.notification.isLocked

-- Frame beweglich machen
notificationFrame:SetMovable(true)
notificationFrame:EnableMouse(true)
notificationFrame:RegisterForDrag("LeftButton")


-- Backdrop (Classic 1.12 hat die Backdrop-API)
notificationFrame:SetBackdrop({
    bgFile = "Interface\\DialogFrame\\UI-DialogBox-Background",
    edgeFile = "Interface\\DialogFrame\\UI-DialogBox-Border",
    tile = true,
    tileSize = 32,
    edgeSize = 32,
    insets = { left = 11, right = 12, top = 12, bottom = 11 }
})

-- Text
HungryPetNotification.notificationFrame.textObject = notificationFrame:CreateFontString(nil, "ARTWORK", "GameFontHighlightLarge")
local text = HungryPetNotification.notificationFrame.textObject
text:SetPoint("CENTER", notificationFrame, "CENTER", 0, 0)
local petName = UnitName("pet") or texts["PET_FALLBACK_NAME"]
text:SetText(string.format(texts["PET_HAPPINESS_2"], petName))

-- Standard: versteckt, bis Event sagt "zeigen"
notificationFrame:Hide()

notificationFrame:SetScript("OnDragStart", function(self)
    self = self or notificationFrame
    if self.isLocked then return end
    -- Sicherstellen, dass der Frame beweglich ist
    if not self:IsShown() then return end
    if self:IsMovable() then
        self:StartMoving()
    end
end)

notificationFrame:SetScript("OnDragStop", function(self)
    self = self or notificationFrame
    if not self:IsShown() then return end
    self:StopMovingOrSizing()
    local x, y = self:GetCenter()
    local ux, uy = UIParent:GetCenter()
    HungryPetNotificationDB.notification.position.x = x - ux
    HungryPetNotificationDB.notification.position.y = y - uy
end)
