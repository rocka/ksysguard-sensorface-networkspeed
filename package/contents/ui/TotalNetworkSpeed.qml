import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

import org.kde.ksysguard.sensors 1.0 as Sensors
import org.kde.kirigami 2.8 as Kirigami

import "util.mjs" as Util

ColumnLayout {
    id: root

    property var sensorIds: []
    property int updateRateLimit
    property var config

    property var sensors: []

    Instantiator {
        id: sensorsInstantiator
        model: root.sensorIds

        Sensors.Sensor {
            sensorId: modelData
            updateRateLimit: root.updateRateLimit
        }

        // https://invent.kde.org/plasma/libksysguard/-/blob/Plasma/6.1/faces/facepackages/textonly/contents/ui/GroupedText.qml#L127
        onObjectAdded: function (idx, obj) {
            root.sensors.push(obj)
            root.sensors = root.sensors
        }
        onObjectRemoved: function (idx, obj) {
            root.sensors.splice(root.sensors.indexOf(obj), 1)
            root.sensors = root.sensors
        }
    }

    RowLayout {
        Text {
            color: Kirigami.Theme.textColor
            text: "↑↓"
        }
        Text {
            Layout.minimumWidth: config.labelWidth
            Layout.leftMargin: config.leftMargin
            Layout.rightMargin: config.rightMargin
            horizontalAlignment: Text.AlignRight
            color: Kirigami.Theme.textColor
            text: Util.formatNetworkSpeed(root.sensors, config.unitStyle, config.shortUnit)
        }
    }
}
