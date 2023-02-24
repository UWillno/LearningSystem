import Felgo
import QtQuick
import "pages"
import "items/toast"
import "logic"
import "items/loader"
import QtQuick.Controls




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


    Navigation {

        id:navigation
        // enable both tabs and drawer for this demo
        // by default, tabs are shown on iOS and a drawer on Android
        navigationMode: navigationModeTabsAndDrawer

        NavigationItem {
            title: "主页"
            iconType: IconType.home

            NavigationStack {
                id:rootStack
                anchors.fill: parent
                splitView: tablet

                IndexPage {
                    id: indexPage
                    //            anchors.fill: parent
                    //            anchors.horizontalCenter: parent.horizontalCenter
                }
            }


        }

        NavigationItem {
            title: "学习"
            iconType: IconType.book

            NavigationStack {
                id:studyStatck
                anchors.fill: parent
                splitView: tablet

                StudyPage {

                }
            }

        }
        NavigationItem {
            title: "练习"
            iconType: IconType.pencil

            NavigationStack {
                id:practiceStatck
                anchors.fill: parent
                splitView: tablet

                PracticePage {

                }
            }

        }

        NavigationItem {
            title: "论坛"
            iconType: IconType.weixin

            NavigationStack {
                id:forumStatck
                anchors.fill: parent
                splitView: tablet

                ForumPage {

                }
            }

        }

    }

    ToastManager {
        id:toastManager
        //        x:0
    }

    AdminLogic {
        id: adminLogic

    }
    UserLogic {
        id: userLogic
    }
    Logic {
       id:logic
    }

    //    property LoaderItem loaderItem: loaderItem
    LoaderItem {
        id: loaderItem
        visible:false
        anchors.centerIn: navigation

        function show(){
            visible = true
        }
        function close(){
            visible = false
        }
    }
    //    Connections {
    //        id: connection
    //        target: qm
    //        onSubmitSucceeded:{
    //            toastManager.show("插入成功！",1000)
    //            loaderItem.close()
    //        }
    //        onSubmitFailed:{
    //            toastManager.show("插入失败！",1000)
    //            loaderItem.close()
    //        }
    //        onSelectSuceeded:{
    ////            selectSwipeView.update()
    //            toastManager.show("查看成功！",1000)
    //            loaderItem.close()
    //        }
    //        onSelectFailed:{
    //            toastManager.show("查看失败！",1000)
    //            loaderItem.close()
    //        }
    //        onDeleteSuceeded:{
    //            toastManager.show("删除成功！",1000)
    //            loaderItem.close()
    //            rootStack.pop()
    //        }
    //        onDeleteFailed:{
    //            toastManager.show("删除失败！",1000)
    //            loaderItem.close()
    //        }

    //    }
    //    Component.onCompleted: {
    //        adminLogic.insertChoiceQuestion.connect(qm.sendChoiceQuestion)
    //    }
}
