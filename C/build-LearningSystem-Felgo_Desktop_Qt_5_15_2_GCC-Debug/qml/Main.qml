import Felgo 3.0
import QtQuick 2.0
import "pages"
import "items/toast"
import "logic"
import "items/loader"
App {
    id:main
    dpScale: 1
    //    property int name: value
    //    property NavigationStack rootStack: rootStack
    // You get free licenseKeys from https://felgo.com/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the Felgo Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from https://felgo.com/licenseKey>"

    NavigationStack {
        id:rootStack
        anchors.fill: parent
        splitView: tablet && landscape

        IndexPage {
            id: indexPage
            //            anchors.horizontalCenter: parent.horizontalCenter
        }

    }



    ToastManager {
        id:toastManager
        //        x:0
    }

    AdminLogic {
        id: adminLogic

    }
    //    property LoaderItem loaderItem: loaderItem
    LoaderItem {
        id: loaderItem
        visible:false
        anchors.centerIn: rootStack

        function show(){
            visible = true
        }
        function close(){
            visible = false
        }
    }
    Connections {
        id: connection
        target: qm
        onSubmitSucceeded:{
            toastManager.show("插入成功！",1000)
            loaderItem.close()
        }
        onSubmitFailed:{
            toastManager.show("插入失败！",1000)
            loaderItem.close()
        }
        onSelectSuceeded:{
            selectSwipeView.update()
            toastManager.show("查看成功！",1000)
            loaderItem.close()
        }
        onSelectFailed:{
            toastManager.show("查看失败！",1000)
            loaderItem.close()
        }
        onDeleteSuceeded:{
            toastManager.show("删除成功！",1000)
            loaderItem.close()
            rootStack.pop()
        }
        onDeleteFailed:{
            toastManager.show("删除失败！",1000)
            loaderItem.close()
        }

    }
    //    Component.onCompleted: {
    //        adminLogic.insertChoiceQuestion.connect(qm.sendChoiceQuestion)
    //    }
}
