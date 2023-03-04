import QtQuick
import Felgo
import QtQuick.Controls
import "../items"
AppPage {

    title: "刷题"
    property var questionsDB: settings.questionsDB
    AppTabBar {
        id: appTabBar
        contentContainer: swipeView

        AppTabButton {
            text: "选择题"
        }
        AppTabButton {
            text: "判断题"
        }
        AppTabButton {
            text: "填空题"
        }
    }
    SwipeView {
        id: swipeView
        anchors.top: appTabBar.bottom
        anchors.bottom: parent.bottom
        width: parent.width
        clip: true

        //         Rectangle {
        //           color: "Red"
        //         }
        QGridView {
            modelData : questionsDB["C"]
        }

        QGridView {
            modelData : questionsDB["T"]
        }
        QGridView {
            modelData : questionsDB["F"]
        }

    }
    //    GridView {
    //        anchors.fill: parent

    //        model:JsonListModel{

    //            source: settings.questionsDB
    //        }
    ////        model:settings.questionsDB
    //        delegate:
    //            SimpleRow {}
    ////            Column {
    ////            Image { source: IconType.android; anchors.horizontalCenter: parent.horizontalCenter }
    ////            Text { text: id; anchors.horizontalCenter: parent.horizontalCenter }
    ////        }
    //    }

    Component.onCompleted:{
        //        console.log(settings.questionsDB)
        //        console.log(JSON.stringify(settings.questionsDB))
        console.log(questionsDB["F"])
    }


}
