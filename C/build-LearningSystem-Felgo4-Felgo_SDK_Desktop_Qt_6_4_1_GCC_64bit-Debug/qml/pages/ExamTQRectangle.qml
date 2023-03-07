import QtQuick
import Felgo
import QtQuick.Controls
Rectangle {

    property var question
    property bool answer : question["answer"]
    property int type: 1
    property var answerDisplay: answer? "√" : "×"
    property int index
    property bool finished: false
    property bool isRight: (optionGroup.checkedButton.value === answer)

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
                }
            }
        }

        AppListItem {
            visible:finished
            text : "正确答案:"+ answerDisplay
            textColor: "green"
        }
    }

    Component.onCompleted:{

    }
}
