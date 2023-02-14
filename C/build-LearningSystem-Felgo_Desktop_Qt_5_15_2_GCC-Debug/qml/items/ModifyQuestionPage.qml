import QtQuick 2.0
import Felgo 3.0

Page {
    id: modifyPage

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
            break
        }
        case 1:
        {
            console.log("判断题")
            questionItem = Qt.createComponent("TrueOrFalseQuestionItem.qml").createObject(rectangle,{"anchors.fill" : rectangle,model : model})
            break;
        }
        case 2:
        {
            console.log("填空题")
            questionItem = Qt.createComponent("FillInTheBlanksQuestionItem.qml").createObject(rectangle,{"anchors.fill" : rectangle,model : model})
            break;
        }
        }
    }

}
