import QtQuick.Controls 2.14 as Controls

import org.kde.kirigami 2.8 as Kirigami

Kirigami.FormLayout {
    property alias cfg_labelWidth: labelWidth.value

    Controls.SpinBox {
        id: labelWidth
        Kirigami.FormData.label: "Label width"
        from: 16
        to: 256
        stepSize: 1
        editable: true
    }
}
