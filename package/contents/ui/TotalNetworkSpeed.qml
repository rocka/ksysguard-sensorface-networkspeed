import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

import org.kde.ksysguard.sensors 1.0 as Sensors

import 'util.mjs' as Util

ColumnLayout {
    id: root

    property var sensorIds: []
    property int updateRateLimit
    property int labelWidth

    Instantiator {
        id: sensorsInstantiator
        model: root.sensorIds

        Sensors.Sensor {
            sensorId: modelData
            updateRateLimit: root.updateRateLimit
        }

    }

    RowLayout {
        Text {
            text: "↑↓"
        }
        Text {
            Layout.minimumWidth: root.labelWidth
            horizontalAlignment: Text.AlignRight
            text: Util.formatNetworkSpeed(sensorsInstantiator)
        }
    }
}
