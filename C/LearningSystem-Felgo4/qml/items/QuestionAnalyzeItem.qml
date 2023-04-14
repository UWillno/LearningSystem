import QtQuick
import Felgo

Flickable {

//    property alias text: analyzeText
    property string analyze : ""

    clip: true
    anchors.horizontalCenter: parent.horizontalCenter
    height: parent.height -  y
    width: parent.width - 40
    contentHeight: analyzeText.height

    AppText {
        id:analyzeText
        width: parent.width
        text: analyze
        wrapMode: AppText.WrapAnywhere

    }
}




