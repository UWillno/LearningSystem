﻿import QtQuick 2.0
import Felgo 3.0

Page {
    //    id: modifyPage

    title: "题目编辑"

    property var model : selectSwipeView.selectQuestion
    property var type : selectSwipeView.selectType
    //    property var name: value


    //    onPopped: {
    //        destroy()
    //    }
    Rectangle {
        id:rectangle
        anchors.fill: parent
    }

    Component.onCompleted: {
        console.log(type)
        console.log(model.question)
        var questionItem
        switch(type){
        case 0:
        {
            console.log("选择题")
            questionItem = Qt.createComponent("ChoiceQuestionItem.qml").createObject(rectangle,{"anchors.fill" : rectangle,model : model})
//            questionItem.model = model
        }
        case 1:
        {
            break;
        }
        case 2:
        {
            break;
        }
        }
    }

}
