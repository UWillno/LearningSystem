﻿import QtQuick 2.0
import Felgo 3.0

//Component {
//    id: blankComponet
//    AppTextInput {
//        id:questionInput
//        anchors.fill: parent
//        width: dp(200)
//        placeholderText: "请输入"
//        //                width: parent.width
//    }
//}


Rectangle {
    id: compontRect
    //    color: Qt.rgba(0.8, 0.4, 0.4, 1.0)
//    implicitWidth: parent.width
//    implicitHeight: deleteBtn.height
    width: parent.width
    height: deleteBtn.height
    anchors.horizontalCenter: parent.horizontalCenter

    property var currentObject: ;
    property string text: blankInput.text

    signal deleteThis(var obj)


    //    Text {
    //        id: interText
    //        anchors.left: parent.left
    //        anchors.leftMargin: 10
    //        anchors.verticalCenter: parent.verticalCenter
    //        text: qsTr("text")
    //    }
    Row {
//        spacing: 10
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