import QtQuick
import Felgo
import QtQuick.Controls
Rectangle {

    property var question
    property bool answer : question["answer"]

    property var answerDisplay: answer? "√" : "×"
    //    title: "选择题"

    ButtonGroup {
        id: optionGroup
        buttons: [trueRadio,falseRadio]
    }

    Column {
        //        anchors.fill: parent
        id:questionCol
        //        width: parent.width
        anchors.fill: parent

        AppListItem {
            text: (index+1)+"." + question["question"]
        }
        AppListItem {
            id: itemA
            leftItem: AppRadio {
                id: trueRadio
//                icon: IconType
                value: true
                anchors.verticalCenter: parent.verticalCenter
            }
            text: "√.正确"
            onSelected: {
                if(!trueRadio.checked){
                    trueRadio.toggle()
                    if(trueRadio.value !== answer){
                        textColor = "red"
                        userLogic.addWQ(question.id,1)
                    }else {
                        userLogic.addRQ(question.id,1)
                        textColor = "green"
                    }
                }
            }
        }
        AppListItem {
            id: itemB
            leftItem: AppRadio {
                id: falseRadio
                //                checked: true
                value: false
                anchors.verticalCenter: parent.verticalCenter
            }
            text: "×.错误"
            onSelected: {
                if(!falseRadio.checked){
                    falseRadio.toggle()
                    if(falseRadio.value !== answer){
                        textColor = "red"
                       userLogic.addWQ(question.id,1)
                    }else {
                        textColor = "green"
                        userLogic.addRQ(question.id,1)
                    }
                }
            }
        }

        AppListItem {
            visible:optionGroup.checkState == Qt.PartiallyChecked
            text : "正确答案:"+ answerDisplay
            textColor: "green"
        }
    }

    Component.onCompleted:{
        //        console.log(answer)
        //        console.log(JSON.stringify(settings.wCQ))
        //        console.log(question.id)
    }
}
