local texts = HungryPetNotification.texts

SLASH_HPN1 = "/hungrypetnotification"
SLASH_HPN2 = "/hpn"

SlashCmdList["HPN"] = function(msg)
    msg = msg or ""
    msg = string.lower(msg)
    msg = string.gsub(msg, "^%s*(.-)%s*$", "%1")

    local frame = HungryPetNotification.notificationFrame.frameObject
    local text = HungryPetNotification.notificationFrame.textObject

    if msg == "lock" then
        print(texts["FRAME_LOCKED"])
        HungryPetNotificationDB.notification.isLocked = true
        frame.isLocked = HungryPetNotificationDB.notification.isLocked
        HungryPetNotification.updateNotification()
    elseif msg == "unlock" then
        print(texts["FRAME_UNLOCKED"])
        HungryPetNotificationDB.notification.isLocked = false
        frame.isLocked = HungryPetNotificationDB.notification.isLocked
        frame:Show()
        local petName = UnitName("pet") or texts["PET_FALLBACK_NAME"]
        text:SetText(string.format(texts["PET_HAPPINESS_2"], petName))
    elseif msg == "refresh" then
        HungryPetNotification.updateNotification()
    elseif msg == "reset" then
        print(texts["FRAME_RESET"])
        HungryPetNotification.reset()
    else
        print("HungryPetNotification: /hpn lock | unlock | refresh | reset")
    end
end
