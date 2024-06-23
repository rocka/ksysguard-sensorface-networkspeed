import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

import org.kde.ksysguard.sensors 1.0 as Sensors
import org.kde.kirigami 2.8 as Kirigami

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
            color: Kirigami.Theme.textColor
            text: "↑↓"
        }
        Text {
            Layout.minimumWidth: root.labelWidth
            // TODO: configurable margin
            // Layout.rightMargin:
            horizontalAlignment: Text.AlignRight
            color: Kirigami.Theme.textColor
            text: Util.formatNetworkSpeed(sensorsInstantiator)
        }
    }
}
