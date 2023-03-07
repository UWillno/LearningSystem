import QtQuick
import Felgo
import "../items"
import QtQuick.Layouts

AppPage {

    id: indexPage
    title: "Learning System"
    property string version : settings.questionsDB['version']
    Rectangle {
        id: rectangle
        anchors.fill: parent
        color: "#F5F5F5"
        Column {
            spacing: dp(20)
            anchors.fill: parent
            anchors.topMargin: dp(10)
            LoginItem {
                id:logitem
            }


            Rectangle {
                z:-1
                height: parent.height - logitem.height
                radius: dp(20)
                width: parent.width - dp(10)

                Column{
                    //                    topPadding: dp(10)
                    spacing: dp(10)

                    anchors.topMargin: dp(10)
                    anchors.fill: parent
                    AppText {

                        anchors.horizontalCenter: parent.horizontalCenter
                        text:"当前题库版本:" + version
                    }
                    AppButton {
//                        icon: IconType.upload
                        iconType: IconType.refresh
                        anchors.horizontalCenter: parent.horizontalCenter
                        text:"下载/更新"
                        onClicked: {
                            //                            questionResource.download()
                            userLogic.getQuestionsDB()
                        }
                    }
                    AppText {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text:"自动同步状态:"
                    }
                    AppSwitch {
                        anchors.horizontalCenter: parent.horizontalCenter
                        //                        text:"下载"
                    }
                    AppText {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text:"手动同步:"
                    }
                    Row {
                        //                        anchors.verticalCenter: parent.verticalCenter
                        anchors.horizontalCenter: parent.horizontalCenter
                        spacing:dp(10)
                        AppButton {
                            text: "上传"
                            iconType: IconType.upload
                            onClicked: {
                                settings.saveQuestions()
                                //                                NativeUtils.displayFilePicker("asdasd");
                            }
                        }
                        AppButton {
                             iconType: IconType.download
                            text: "下载"
                            onClicked: {
                                console.log(logic.getDate())
                            }
                        }
                    }

                }


            }

        }
    }

    Connections{
        target: userLogic
        onGetQuestionsDBSucceed: questionsDB =>{
                                     if(settings.questionsDB["version"] === questionsDB["version"] )
                                     {
                                        toastManager.show("题库已是最新版！",1000)
                                     }
                                     else{
                                         settings.questionsDB = questionsDB
                                         toastManager.show("下载/更新成功！",1000)
                                     }
                                     //            console.log(questionsDB)
                                 }
    }

    //    Connections {
    //        target: NativeUtils
    //        onFilePickerFinished:(accepted,files)=>{
    //                                 if(accepted)
    ////                                 console.log(files[0])
    //                                 qm.upload(files[0])
    //                             }




    //    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:2}D{i:2}
}
##^##*/
