import QtQuick
import Felgo

//AppListItem {
//    id:rightAnswerItem
//    text: "asdasdasd"
//    detailText: "aswrasdgasdf"
//}


Rectangle {
    property alias numberText: questionNumberText.text
    property alias answerText: answerText.text
    width: parent.width
    height:col.height
    Column {
        id:col
//        anchors.fill: parent
        width: parent.width
        height: questionNumberText.height + answerText.height
        AppText {
            anchors.horizontalCenter: parent.horizontalCenter
            color: Theme.secondaryTextColor
            id: questionNumberText
        }
        AppText {
            anchors.horizontalCenter: parent.horizontalCenter
            id: answerText
        }
    }
}
