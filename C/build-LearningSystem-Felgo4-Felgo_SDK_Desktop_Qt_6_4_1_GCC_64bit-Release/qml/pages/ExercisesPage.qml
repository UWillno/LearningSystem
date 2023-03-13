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

        QGridView {
            id: qGridViewC
            modelData : questionsDB["C"]
            type: 0
        }

        QGridView {
            id: qGridViewT
            modelData : questionsDB["T"]
            type: 1
        }
        QGridView {
            id: qGridViewF
            modelData : questionsDB["F"]
            type: 2
        }

    }

    Component.onCompleted:{

    }
    Connections {
        target: practiceStack
        onPopped:{
            qGridViewC.refresh()
            qGridViewT.refresh()
            qGridViewF.refresh()
        }
    }

    onPopped: {
        destroy()
    }

}
