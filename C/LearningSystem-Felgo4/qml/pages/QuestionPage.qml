import QtQuick
import Felgo
import "../items"
import "../items/loader"
import QtQuick.Controls as QuickControls2


AppPage {
    id:qP
    title: "题目编辑"
    property QuickControls2.SwipeView currentSwipeView
    //    property alias QuickControls2.SwipeView currentSwipeView
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


    Component.onCompleted: {
        var component
        console.log(state==0)
        //        var component = Qt.createComponent("../items/InsertSwipeView.qml").createObject(swipeRect,{})

        switch(state){
        case 0: {
//            console.log("hererererer")
            component = Qt.createComponent("../items/InsertSwipeView.qml").createObject(swipeRect)
//           console.debug(component.errorString())
            break
        }
        case 1: {
            component = Qt.createComponent("../items/SelectSwipeView.qml").createObject(swipeRect)

            break
        }
        default:
            break
        }
        currentSwipeView = component

    }

    Connections {
        id:con
        target: qm

        onDeleteSuceeded:{
//            toastManager.show("删除成功！",1000)
            loaderItem.close()
            rootStack.pop()
        }

        onUpdateSucceeded:{
//            toastManager.show("保存成功！",1000)
            rootStack.pop()
        }

    }

    onPopped:  {
        destroy()
    }

}
