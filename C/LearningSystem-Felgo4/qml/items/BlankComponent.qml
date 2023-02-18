import QtQuick
import QtQuick.Controls
import Felgo



Rectangle {
    id: compontRect
    width: parent.width
    height: deleteBtn.height
    anchors.horizontalCenter: parent.horizontalCenter

    property var currentObject: ;
    property alias text: blankInput.text

    signal deleteThis(var obj)

    Row {
        AppTextInput {
            id:blankInput
            width: dp(150)

            placeholderText: "请输入"
        }
        AppButton {
            id:deleteBtn
            text: "删除"
            flat: false
            height: blankInput.height

            onClicked: {
                compontRect.deleteThis(compontRect)
            }
        }
    }

    Component.onCompleted: {
        compontRect.currentObject = parent
    }
}
