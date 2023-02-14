import QtQuick 2.0
import Felgo 3.0
import "../items"
import QtQuick 2.9
import "../items/loader"
import QtQuick.Controls 2.0 as QuickControls2

//promise
Page {
    id:qP
    title: "题目编辑"
    property QuickControls2.SwipeView currentSwipeView
    property int state

    AppTabBar{
        id:typeTabBar
        contentContainer: currentSwipeView

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
    Rectangle {
        id: swipeRect
        anchors.top: typeTabBar.bottom
        anchors.bottom: parent.bottom
        width: parent.width

    }

    //    InsertSwipeView {
    //        id:insertSwipeView
    //        anchors.top: typeTabBar.bottom
    //    }
    //    SelectSwipeView {
    //        id:selectSwipeView
    //        anchors.top: typeTabBar.bottom
    //    }

    Component.onCompleted: {
        var component
        console.log(state)
        switch(state){
        case 0: {
            component = Qt.createComponent("../items/InsertSwipeView.qml").createObject(swipeRect)
            break
        }
        case 1: {
            //            loaderItem.show()
            component = Qt.createComponent("../items/SelectSwipeView.qml").createObject(swipeRect)
//            qm.getQuestionsByTcp()
            break
        }
        default:
            break
        }
        currentSwipeView = component
    }

}
