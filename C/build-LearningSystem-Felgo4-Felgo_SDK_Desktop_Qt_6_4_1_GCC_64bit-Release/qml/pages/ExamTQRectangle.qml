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
            rightItem: AppIcon {
                id:resultIconT
                height: parent.height
                visible: false
                iconType: isRight ? IconType.check : IconType.remove
                color: isRight ? "green" : "red"
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
            rightItem: AppIcon {
                id:resultIconF
                height: parent.height
                visible: false
                iconType: isRight ? IconType.check : IconType.remove
                color: isRight ? "green" : "red"
            }
        }

        AppListItem {
            visible:finished
            text : "正确答案:"+ answerDisplay
            textColor: "green"
        }
    }

    onFinishedChanged: {
            if(isRight){
                if(trueRadio.checked){
                    resultIconT.visible = true
                    itemA.textColor = "green"
                }else{
                    resultIconF.visible = true
                    itemB.textColor = "green"
                }
            }else{
                if(trueRadio.checked){
                    resultIconT.visible = true
                    itemA.textColor = "red"
                }else{
                    resultIconF.visible = true
                    itemB.textColor = "red"
                }
            }
    }

    Component.onCompleted:{

    }
}
