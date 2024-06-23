import org.kde.ksysguard.faces 1.0

SensorFace {
    id: root

    contentItem: TotalNetworkSpeed {
        sensorIds: root.controller.highPrioritySensorIds
        updateRateLimit: root.controller.updateRateLimit
        config: root.controller.faceConfiguration
    }
}
