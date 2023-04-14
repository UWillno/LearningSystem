import Felgo
import QtQuick
import "pages"
import "items/toast"
import "logic"
import "items/loader"
import QtQuick.Controls

import Qt.labs.settings


App {

    id:app
    dpScale: 1

    onInitTheme: {

//        Theme.colors.tintColor = "#1DA1F2"
        Theme.colors.tintColor = "#23d1ae"
        Theme.colors.backgroundColor = "#eee"
        Theme.navigationBar.backgroundColor = Theme.tintColor
        Theme.navigationBar.titleColor = "white"
        Theme.navigationBar.itemColor = "white"
        Theme.colors.statusBarStyle = Theme.colors.statusBarStyleWhite

    }

    property alias navMode: navigation.navigationMode

    property alias settings: settings
    //    property alias  wCQ: settings.wCQ
    //    property alias  wTQ: settings.wTQ
    //    property alias  wFQ: settings.wFQ
    //    property alias  rCQ: settings.rCQ
    //    property alias  rTQ: settings.rTQ
    //    property alias  rFQ: settings.rFQ
    //    property int name: value
    //    property NavigationStack rootStack: rootStack
    // You get free licenseKeys from https://felgo.com/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the Felgo Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from https://felgo.com/licenseKey>"

    Settings {
        id: settings

        //        signal loadquestionsDBFinished()
        property var questionsDB
        //        property var wrongCQ: JSON.parse(JSON.stringify(ss.wrongCQ))
        //        //        property var exams
        //        property var wrongTQ: JSON.parse(JSON.stringify(ss.wrongTQ))
        //        property var wrongFQ: JSON.parse(JSON.stringify(ss.wrongFQ))
        //        property var rightCQ: JSON.parse(JSON.stringify(ss.rightCQ))
        //        //        property var exams
        //        property var rightTQ: JSON.parse(JSON.stringify(ss.rightTQ))
        //        property var rightFQ: JSON.parse(JSON.stringify(ss.rightFQ))

        property var questions
        property var exams
        property bool autoSync
        property string syncTime
        property string key
        property string model


        function saveQuestions(){

            questions = {
                wrongCQ:ss.wrongCQ,
                wrongTQ:ss.wrongTQ,
                wrongFQ:ss.wrongFQ,
                rightCQ:ss.rightCQ,
                rightTQ:ss.rightTQ,
                rightFQ:ss.rightFQ
            }


            console.log(questions)
            console.log(JSON.stringify(questions))

        }

        function saveExams(exam){
            if(typeof(exams)==="undefined"){
                var arr = []
                arr.push(exam)
                exams = arr
            }else{
                var a = exams
                a.push(exam)
                exams = a
            }
        }
        function clear(){
            questions = []
            exams = []
        }
        Component.onCompleted:{
            //            saveQuestions()
            console.log(JSON.stringify(questions))
            console.log(JSON.stringify(exams))
        }



        onAutoSyncChanged: {
            console.log(autoSync)
        }

        onQuestionsDBChanged:  {
            //            loadquestionsDBFinished()
        }
        onExamsChanged: {
            console.log(settings.exams.length)
        }
    }

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
                id:studyStack
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
                id:practiceStack
                anchors.fill: parent
                splitView: tablet
                onPopped: {
                    if(settings.autoSync){
                        settings.saveQuestions()
                        userLogic.uploadUserData()
                    }
                }
                PracticePage {

                }
            }

        }

        NavigationItem {
            title: "论坛"
            iconType: IconType.weixin

            NavigationStack {
                id:forumStack
                anchors.fill: parent
                splitView: tablet

                ForumPage {

                }
            }

        }

        headerView: AppIcon {
            width: parent.width
            iconType: "android"
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
