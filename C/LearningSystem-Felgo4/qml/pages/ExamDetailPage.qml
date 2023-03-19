import QtQuick
import Felgo
import QtQuick.Controls
import "../items"
AppPage {

    title: "浏览考试情况"
    property var model
    property var questionsDB: settings.questionsDB
//    property int cCount : 2
//    property int tCount : 2
//    property int fCount : 1
    property var cQArray : model.cQArray
    property var tQArray : model.tQArray
    property var fQArray : model.fQArray
    property var questionComponents: []
    property bool canPop: false
    SwipeView {
        id: questionSwipeView
        anchors.fill: parent
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

        model.right.forEach(function(i){
            questionComponents[i].isRight = true
        })
        model.wrong.forEach(function(i){
            questionComponents[i].isRight = false
        })


    }
    function createChoiceComponents(){
        cQArray.forEach(function(index){
            const q = Qt.createComponent("ExamCQRectangle.qml").createObject(questionSwipeView,{question:questionsDB["C"][index],index:questionComponents.length,state:"view",finished: true})
            questionComponents.push(q)
        })
        //        const q = Qt.createComponent("")
    }
    function createTrueComponents(){
        tQArray.forEach(function(index){
            const q = Qt.createComponent("ExamTQRectangle.qml").createObject(questionSwipeView,{question:questionsDB["T"][index],index:questionComponents.length,state:"view",finished: true})
            questionComponents.push(q)
        })

    }
    function createFillComponents(){
        fQArray.forEach(function(index){
            const q = Qt.createComponent("ExamFQRectangle.qml").createObject(questionSwipeView,{question:questionsDB["F"][index],index:questionComponents.length,state:"view",finished: true})
            questionComponents.push(q)
        })
    }


}
