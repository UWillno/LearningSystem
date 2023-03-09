import QtQuick
import Felgo
import QtQuick.Controls

AppPage {
    id: modifyPage

    title: "题目编辑"

    property var model
    property int type
    //    property var name: value


    //    onPopped: {
    //        destroy()
    //    }
    Rectangle {
        id:rectangle
        anchors.fill: parent
    }
    onPopped: {
        destroy()
    }

    Component.onCompleted: {
//        console.log("type:"+type)
        console.log("modifyPage"+model.id)
        //        console.log(model.question)
        //        console.log(JSON.stringify(model))
        var questionItem
        switch(type){
        case 0:
        {
            console.log("选择题")
            questionItem = Qt.createComponent("ChoiceQuestionItem.qml").createObject(rectangle,{"anchors.fill" : rectangle,model : modifyPage.model})
            //            questionItem.model = model
            break
        }
        case 1:
        {
            console.log("判断题")
            questionItem = Qt.createComponent("TrueOrFalseQuestionItem.qml").createObject(rectangle,{"anchors.fill" : rectangle,model : modifyPage.model})
            break;
        }
        case 2:
        {
            console.log("填空题")
            questionItem = Qt.createComponent("FillInTheBlanksQuestionItem.qml").createObject(rectangle,{"anchors.fill" : rectangle,model : modifyPage.model})
            break;
        }
        }
    }



}
