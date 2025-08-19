local texts = HungryPetNotification.texts

HungryPetNotification.updateNotification = function()
    local nf = HungryPetNotification.notificationFrame
    if not HungryPetNotificationDB.notification.isLocked then return end

    if not UnitExists("pet") then
        nf.frameObject:Hide()
        return
    end

    local happiness = GetPetHappiness and GetPetHappiness() or 3
    if happiness and happiness < 3 then
        local petName = UnitName("pet") or texts["PET_FALLBACK_NAME"]
        nf.textObject:SetText(string.format(texts["PET_HAPPINESS_1"], petName))        
        nf.frameObject:Show()
    else
        nf.frameObject:Hide()
    end
end

HungryPetNotification.reset = function()
    HungryPetNotificationDB.notification.isLocked = true
    HungryPetNotificationDB.notification.position.x = 0
    HungryPetNotificationDB.notification.position.y = 0

    local notificationFrame = HungryPetNotification.notificationFrame.frameObject
    notificationFrame:ClearAllPoints()
    notificationFrame:SetPoint("CENTER", UIParent, "CENTER", HungryPetNotificationDB.notification.position.x,
        HungryPetNotificationDB.notification.position.y)
    notificationFrame.isLocked = HungryPetNotificationDB.notification.isLocked
    HungryPetNotification.updateNotification()
end
