import QtQuick
import Felgo
import QtQuick.Controls
import "../items"
AppPage {

    title: "模拟考试"
    property var questionsDB: settings.questionsDB
    property var cQArray : userLogic.getUniqueRandomNum(0, questionsDB["C"].length-1, 2)
    property var tQArray : userLogic.getUniqueRandomNum(0, questionsDB["T"].length-1, 2)
    property var fQArray : userLogic.getUniqueRandomNum(0, questionsDB["F"].length-1, 1)
    property var questionComponents: []
    SwipeView {
        id: questionSwipeView
        anchors.fill: parent
    }
    onWillPop: {
        NativeDialog.confirm("确认", "考试进度将丢失?", function(ok) {
            if(ok) {
                //                popped()
                event.accepted = true
            }else{
                event.accepted = false
            }
        })
    }

    onPopped: {
        navMode = 3
    }
    Component.onCompleted:{
        navMode = 4
        createChoiceComponents()
        createTrueComponents()
        createFillComponents()
        lastRect.createObject(questionSwipeView)

    }
    function createChoiceComponents(){
        cQArray.forEach(function(index){
            const q = Qt.createComponent("ExamCQRectangle.qml").createObject(questionSwipeView,{question:questionsDB["C"][index],index:questionComponents.length})
            questionComponents.push(q)
        })
        //        const q = Qt.createComponent("")
    }
    function createTrueComponents(){
        tQArray.forEach(function(index){
            const q = Qt.createComponent("ExamTQRectangle.qml").createObject(questionSwipeView,{question:questionsDB["T"][index],index:questionComponents.length})
            questionComponents.push(q)
        })

    }
    function createFillComponents(){
        fQArray.forEach(function(index){
            const q = Qt.createComponent("ExamFQRectangle.qml").createObject(questionSwipeView,{question:questionsDB["F"][index],index:questionComponents.length})
            questionComponents.push(q)
        })
    }

    Component {
        id:lastRect
        Rectangle {
            id:rect
            property int points
            Column {

                anchors.fill: parent

                AppButton {
                    text:"交卷"
                    anchors.horizontalCenter:  parent.horizontalCenter
                    onClicked: {
                        enabled = false
                        visible = false
                        var wrong = []
                        var right = []
                        questionComponents.forEach(function(obj,i){

                            obj.finished = true
                            if(obj.isRight){
                                rect.points+=(100/questionComponents.length)
                                right.push(i)
                                //                                userLogic.addRQ(obj.question.id,obj.type)
                            }else{
                                wrong.push(i)
                                //                                userLogic.addWQ(obj.question.id,obj.type)
                            }
                            //                            console.log(JSON.stringify(exam))
                            //                            console.log(obj.question.id)
                            //                            console.log(obj.type)
                            //                            console.log(i)
                        })
                        const exam = {
                            cQArray:cQArray,
                            tQArray:tQArray,
                            fQArray:fQArray,
                            wrong:wrong,
                            right:right,
                            point:rect.points,
                            date: logic.getDate()
                        }
                        settings.saveExams(exam)

                        //                        console.log(JSON.stringify(exam))
                        //                        console.log(JSON.stringify(settings.exams))
                        pointText.visible = true

                    }
                }

                AppText{
                    id:pointText
                    visible: false
                    //                    font.family: "Helvetica"
                    anchors.centerIn: parent
                    font.pointSize: 24
                    color: rect.points >= 60 ? "blue" : "red"

                    text: "得分:" + rect.points
                }
            }

        }
    }
}
