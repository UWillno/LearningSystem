import QtQuick
import Felgo
import QtQuick.Controls
import "../items"
AppPage {

    title: "模拟考试"
    property var questionsDB: settings.questionsDB
    property int cCount : 2
    property int tCount : 2
    property int fCount : 1
    property var cQArray : userLogic.getUniqueRandomNum(0, questionsDB["C"].length-1, cCount)
    property var tQArray : userLogic.getUniqueRandomNum(0, questionsDB["T"].length-1, tCount)
    property var fQArray : userLogic.getUniqueRandomNum(0, questionsDB["F"].length-1, fCount)
    property var questionComponents: []
    property bool canPop: false
    SwipeView {
        id: questionSwipeView
        anchors.fill: parent
    }
    onWillPop: {
        event.accepted = canPop
        if(!canPop)
            NativeDialog.confirm("确认", "考试进度将不会保存?", function(ok) {
                if(ok) {
                   canPop = ok
                   popped()
                }
            })
    }

    onPopped: {
        navMode = 3
        destroy()
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
            property double points
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
                                rect.points+=(100.00/questionComponents.length)
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
                       rect.points = Math.ceil(rect.points)
                        const exam = {
                            cQArray:cQArray,
                            tQArray:tQArray,
                            fQArray:fQArray,
                            wrong:wrong,
                            right:right,
                            point:rect.points,
//                            point:point,
                            date: logic.getDate()
                        }
                        settings.saveExams(exam)

                        //                        console.log(JSON.stringify(exam))
                        //                        console.log(JSON.stringify(settings.exams))
                        pointText.visible = true
                        canPop = true

                    }
                }

                AppText{
                    id:pointText
                    visible: false
                    //                    font.family: "Helvetica"
                    anchors.centerIn: parent
                    fontSize: 44

                    color: rect.points >= 60 ? "blue" : "red"

                    text: "得分:" + rect.points

                }
            }

        }
    }
}
