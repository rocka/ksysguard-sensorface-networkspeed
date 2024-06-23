import QtQuick.Controls 2.14 as Controls

import org.kde.kirigami 2.8 as Kirigami

import "config.mjs" as Config

Kirigami.FormLayout {
    property alias cfg_labelWidth: labelWidth.value
    property alias cfg_leftMargin: leftMargin.value
    property alias cfg_rightMargin: rightMargin.value
    property alias cfg_unitStyle: unitStyle.currentIndex
    property alias cfg_shortUnit: shortUnit.checked

    Controls.SpinBox {
        id: labelWidth
        Kirigami.FormData.label: "Label width"
        from: 16
        to: 256
        stepSize: 1
        editable: true
    }

    Controls.SpinBox {
        id: leftMargin
        Kirigami.FormData.label: "Left margin"
        from: 0
        to: 256
        stepSize: 1
        editable: true
    }

    Controls.SpinBox {
        id: rightMargin
        Kirigami.FormData.label: "Right margin"
        from: 0
        to: 256
        stepSize: 1
        editable: true
    }

    Controls.ComboBox {
        id: unitStyle
        Kirigami.FormData.label: "Unit style"
        model: Config.UnitStyle
        textRole: "text"
        valueRole: "value"
    }

    Controls.CheckBox {
        id: shortUnit
        Kirigami.FormData.label: "Short unit"
    }
}
