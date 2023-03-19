import QtQuick
import Felgo
import QtQuick.Controls

Rectangle {

    property var question
    property var option1 : question["option1"]
    property var option2 : question["option2"]
    property var option3 : question["option3"]
    property var option4 : question["option4"]
    property var answer : question["answer"]
    property int index
    property bool finished: false
    property int type: 0
    property bool isRight: (optionGroup.checkedButton.value === answer)
    //    title: "选择题"

    ButtonGroup {
        id: optionGroup
        buttons: [radio1,radio2,radio3,radio4]

    }

    Column {
        id:questionCol

        anchors.fill: parent

        AppListItem {
            id:quesitonItem
            text: (index+1)+"." + question["question"]
        }
        AppListItem {
            id: itemA
            leftItem: AppRadio {
                id: radio1
                //                checked: true
                value: "A"
                anchors.verticalCenter: parent.verticalCenter
            }
            text: "A." + option1
            onSelected: {
                if(!radio1.checked){
                    radio1.toggle()
                }
            }
            rightItem: AppIcon {
                id:resultIconA
                height: parent.height
                visible: false
                iconType: isRight ? IconType.check : IconType.remove
                color: isRight ? "green" : "red"
            }
        }
        AppListItem {
            id: itemB
            leftItem: AppRadio {
                id: radio2
                //                checked: true
                value: "B"
                anchors.verticalCenter: parent.verticalCenter
            }
            text: "B." + option2
            onSelected: {
                if(!radio2.checked){
                    radio2.toggle()
                }
            }
            rightItem: AppIcon {
                id:resultIconB
                height: parent.height
                visible: false
                iconType: isRight ? IconType.check : IconType.remove
                color: isRight ? "green" : "red"
            }
        }
        AppListItem {
            id: itemC
            leftItem: AppRadio {
                id: radio3
                //                checked: true
                value: "C"
                anchors.verticalCenter: parent.verticalCenter
            }
            text: "C." + option3
            onSelected: {
                if(!radio3.checked){
                    radio3.toggle()
                }
            }
            rightItem: AppIcon {
                id:resultIconC
                height: parent.height
                visible: false
                iconType: isRight ? IconType.check : IconType.remove
                color: isRight ? "green" : "red"
            }
        }
        AppListItem {
            id: itemD
            leftItem: AppRadio {
                id: radio4
                //                checked: true
                value: "D"
                anchors.verticalCenter: parent.verticalCenter
            }
            text: "D." + option4
            onSelected: {
                if(!radio4.checked){
                    radio4.toggle()
                }
            }
            rightItem: AppIcon {
                id:resultIconD
                height: parent.height
                visible: false
                iconType: isRight ? IconType.check : IconType.remove
                color: isRight ? "green" : "red"
            }
        }

        AppListItem {
            visible:finished
            text : "正确答案:"+answer
            textColor: "green"
        }
    }

    onFinishedChanged: {
        if(isRight){
            if(radio1.checked){
                resultIconA.visible = true
                itemA.textColor = "green"
            }
            if(radio2.checked){
                resultIconB.visible = true
                itemB.textColor = "green"
            }
            if(radio3.checked){
                resultIconC.visible = true
                itemC.textColor = "green"
            }
            if(radio4.checked){
                resultIconD.visible = true
                itemD.textColor = "green"
            }
        }else {
            if(radio1.checked){
                resultIconA.visible = true
                itemA.textColor = "red"
            }
            if(radio2.checked){
                resultIconB.visible = true
                itemB.textColor = "red"
            }
            if(radio3.checked){
                resultIconC.visible = true
                itemC.textColor = "red"
            }
            if(radio4.checked){
                resultIconD.visible = true
                itemD.textColor = "red"
            }
        }
    }

    states:  [
        State {
            name: "view"
            PropertyChanges {
                target: quesitonItem
                textColor : isRight ? "green" : "red"
            }
        }
    ]
}
