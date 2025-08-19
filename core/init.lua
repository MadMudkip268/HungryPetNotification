-- SavedVariables initialisieren
HungryPetNotificationDB = HungryPetNotificationDB or {
    notification = { position = { x = 0, y = 0 }, isLocked = true }
}

-- Haupttable
HungryPetNotification = HungryPetNotification or {}
HungryPetNotification.notificationFrame = HungryPetNotification.notificationFrame or {
    frameObject = nil,
    textObject = nil,
}
