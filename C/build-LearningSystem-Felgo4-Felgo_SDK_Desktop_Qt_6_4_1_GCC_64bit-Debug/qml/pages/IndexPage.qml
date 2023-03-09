import QtQuick
import Felgo
import "../items"
import QtQuick.Layouts
import QtQuick.Controls
import QtCharts
AppPage {

    id: indexPage
    title: "Learning System"
    property string version : settings.questionsDB['version']
//    property alias autoSyncSwitch: autoSyncSwitch.checked

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

            SwipeView {
                id:indexSwipeView
                height: parent.height - logitem.height
                width: parent.width - dp(10)
                z:-1
                Rectangle {
                    ChartView {
                        id:examsChart
                        title: "<b>考试情况</b>"
                        titleColor: "blue"
                        anchors.fill: parent
                        antialiasing: true
                        LineSeries {
                            id:pointLineSeries
                            name: "成绩变化"
                            axisX:ValuesAxis {
                                id:vaxisx
                                min:1
                                labelFormat: "%d"
                                tickType:ValueAxis.TicksDynamic
                            }
                            axisY:ValuesAxis {
                                id:vaxisy
                                min:0
                                //                                tickCount: 10
                                max:100
                                labelFormat: "%d"
                                tickType: ValueAxis.TicksFixed
                            }
                        }

                        function reload(){
                            pointLineSeries.clear()
                            const times = settings.exams.length
                            vaxisx.max = times
                            vaxisx.tickCount = times
                            settings.exams.forEach(function(e,i){
                                console.log("x"+i+"y"+e.point);
                                pointLineSeries.append(i,e.point)
                            })
                        }

                        Connections {
                            target: settings
                            onExamsChanged:{
                                console.log(settings.exams.length)
                                console.log(settings.exams)
                                examsChart.reload()
                            }
                        }

                        Component.onCompleted:{
                            //                            console.log(settings.exams.length)
                        }
                    }
                }
                Rectangle {
                    id:re

                    ChartView {
                        id:questionsChart
                        title: "<b>刷题进度</b>"
                        titleColor: "green"

                        anchors.fill: parent
                        legend.alignment: Qt.AlignBottom
                        animationOptions:ChartView.AllAnimations
                        theme: ChartView.ChartThemeQt
                        //                        legend.font:
                        //                        theme: ChartView.ChartThemeBrownSand
                        antialiasing: true
                        PieSeries {
                            onClicked: questionsChart.reload()
                            id:pieSeries
                            //                           verticalPosition: true
                        }

                        function reload(){
                            const all = settings.questionsDB["C"].length + settings.questionsDB["F"].length + settings.questionsDB["T"].length
                            const right = ss.rightCQ.length + ss.rightTQ.length +ss.rightFQ.length
                            const rest =right/all*100
                            pieSeries.clear()
                            pieSeries.append("剩余:"+(all - right),rest)
                            pieSeries.append("做对:"+right,100-rest)
                        }
                        Connections{
                            target: settings
                            onQuestionsDBChanged:{
                                questionsChart.reload()
                            }
                        }
                        //                    Connections{
                        //                        target: ss
                        //                        onRightCQChanged:{
                        //                            chart.reload()
                        //                        }
                        //                        onRightFQChanged:{
                        //                            chart.reload()
                        //                        }
                        //                        onRightTQChanged:{
                        //                            chart.reload()
                        //                        }
                        //                    }


                        //                        Component.onCompleted:{
                        //                            reload()
                        //                        }

                    }
                }



                Rectangle {

                    //                    height: parent.height
                    radius: dp(20)
                    //                    width: parent.width - dp(10)

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
                            visible: ss.cxid ? true : false
                            anchors.horizontalCenter: parent.horizontalCenter
                            text:"上次同步时间:" + settings.syncTime
                        }
                        AppText {
                            visible: ss.cxid ? true : false
                            anchors.horizontalCenter: parent.horizontalCenter
                            text:"自动同步状态:" + autoSyncSwitch.checked
                        }
                        AppSwitch {
                            id: autoSyncSwitch
                            visible: ss.cxid ? true : false
                            anchors.horizontalCenter: parent.horizontalCenter
                            checked: settings.autoSync
                            onCheckedChanged: {
                                settings.autoSync = autoSyncSwitch.checked
                            }
//                            Component.onCompleted:{
//                                autoSyncSwitch.checked = settings.autoSync
//                            }

                            //                        text:"下载"

                        }
                        AppText {
                            visible: ss.cxid ? true : false
                            anchors.horizontalCenter: parent.horizontalCenter
                            text:"手动同步:"
                        }
                        Row {
                            visible: ss.cxid ? true : false
                            //                        anchors.verticalCenter: parent.verticalCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            spacing:dp(10)
                            AppButton {
                                text: "上传"
                                iconType: IconType.upload
                                onClicked: {
                                    NativeDialog.confirm("确认", "线上记录将会被覆盖，若有过记录建议先进行下载操作", function(ok) {
                                        if(ok){
                                            settings.saveQuestions()
                                            userLogic.uploadUserData()
                                        }
                                    })
                                    //                                NativeDialog


                                    //                                NativeUtils.displayFilePicker("asdasd");
                                }
                            }
                            AppButton {
                                visible: ss.cxid ? true : false
                                iconType: IconType.download
                                text: "下载"
                                onClicked: {
                                    NativeDialog.confirm("确认", "本地记录将会覆盖，若之前使用游客模式学习，建议先进行上传操作", function(ok) {
                                        if(ok){
                                            userLogic.downloadUserData()
                                            //                                        settings.saveQuestions()
                                            //                                        userLogic.uploadUserData()
                                        }
                                    })

                                }
                            }
                        }
                        AppButton {
                            visible: ss.cxid ? true : false
                            anchors.horizontalCenter: parent.horizontalCenter
                            //                         iconType: IconType
                            text: "登出"

                            onClicked: {
                                userLogic.logout()
                                settings.autoSync = false
                                //                            console.log(logic.getDate())
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
