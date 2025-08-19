local texts = HungryPetNotification.texts

HungryPetNotification.eventFrame = CreateFrame("Frame")
HungryPetNotification.eventFrame:RegisterEvent("PLAYER_LOGIN")
HungryPetNotification.eventFrame:RegisterEvent("UNIT_HAPPINESS")
HungryPetNotification.eventFrame:RegisterEvent("UNIT_PET")

HungryPetNotification.eventFrame:SetScript("OnEvent", function()
    if event == "PLAYER_LOGIN" then
        print(texts["HPN_INIT"])
        print(texts["HPN_HELP"])
    end
    HungryPetNotification.updateNotification()
end)
