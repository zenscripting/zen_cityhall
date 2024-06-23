Config = {}

Config.StartLocation = {
    coords = vector3(91.77, -1604.23, 29.9)
}

Config.DeliveryVan = {
    model = "rumpo",
    spawnCoords = vector4(98.67, -1603.6, 29.59, 229.59)
}

Config.DeliveryLocations = {
    { coords = vector4(-1409.23, -636.29, 27.67, 211.09), name = 'Bahama Mamas', distance = '' },
    { coords = vector4(519.21, 169.05, 98.37, 247.8), name = 'Vinewood Hills', distance = '' }
}

Config.PayAmount = { min = 400, max = 600 }

Config.Marker = { type = 27, color = {r = 0, g = 255, b = 0}, size = { x = 2.0, y = 2.0, z = 2.0 } }

Config.FinishLocation = {
    coords = vector3(93.88, -1613.73, 28.52)
}

Config.Texts = {
    startDeliveryPrompt = "[~g~E~w~] Start Delivery",
    deliveryPrompt = "[~g~E~w~] Deliver the boxes",
    finishDeliveryPrompt = "[~g~E~w~] Finish Delivery",
    alreadyOnDelivery = "You are already on a delivery!",
    driveToDelivery = "Drive to the delivery location!",
    deliveringBoxes = "Delivering the boxes...",
    driveBackToFinish = "Drive back to the finish location to complete the delivery.",
    deliveryCancelled = "Delivery cancelled.",
    deliveryCompleted = "Delivery completed! You've been paid $",
    somethingWentWrong = "Something went wrong, try again later."
}