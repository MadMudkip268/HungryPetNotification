if GetLocale() ~= "deDE" then return end

local texts = {}
texts["PET_FALLBACK_NAME"] = "Dein Begleiter"
texts["PET_HAPPINESS_1"] = "%s verhungert!"
texts["PET_HAPPINESS_2"] = "%s ist hungrig!"
texts["HPN_INIT"] = "HungryPetNotification initialisiert."
texts["HPN_HELP"] = "HungryPetNotification: /hpn lock | unlock | refresh | reset"
texts["FRAME_UNLOCKED"] = "HungryPetNotification entsperrt."
texts["FRAME_LOCKED"] = "HungryPetNotification gesperrt."
texts["FRAME_RESET"] = "HungryPetNotification zurückgesetzt."

HungryPetNotification = HungryPetNotification or {}
HungryPetNotification.texts = texts
