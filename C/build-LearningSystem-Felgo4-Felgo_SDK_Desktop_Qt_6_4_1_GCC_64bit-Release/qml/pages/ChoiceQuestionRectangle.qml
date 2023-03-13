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
    //    title: "选择题"

    ButtonGroup {
        id: optionGroup
        buttons: [radio1,radio2,radio3,radio4]

        onCheckStateChanged: {
            itemA.enabled = false
            itemB.enabled = false
            itemC.enabled = false
            itemD.enabled = false
        }
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
                id: radio1
                //                checked: true
                value: "A"
                anchors.verticalCenter: parent.verticalCenter
            }
            text: "A." + option1

            onSelected: {
                if(!radio1.checked){
                    radio1.toggle()
                    if(radio1.value !== answer){
                        textColor = "red"
                        userLogic.addWQ(question.id,0)
                    }else {
                        userLogic.addRQ(question.id,0)
                        textColor = "green"
                    }
                }
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
                    if(radio2.value !== answer){
                        textColor = "red"
                       userLogic.addWQ(question.id,0)
                    }else {
                        textColor = "green"
                        userLogic.addRQ(question.id,0)
                    }
                }
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
                    if(radio3.value !== answer){
                        userLogic.addWQ(question.id,0)
                        textColor = "red"
                    }else {
                        userLogic.addRQ(question.id,0)
                        textColor = "green"
                    }
                }
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
                    if(radio4.value !== answer){
                        userLogic.addWQ(question.id,0)
                        textColor = "red"
                    }else {
                        userLogic.addRQ(question.id,0)
                        textColor = "green"
                    }
                }
            }
        }

        AppListItem {
            visible:optionGroup.checkState == Qt.PartiallyChecked
            text : "正确答案:"+answer
            textColor: "green"
        }
    }

    Component.onCompleted:{
        //        console.log(answer)
        //        console.log(JSON.stringify(settings.wCQ))
        //        console.log(question.id)
    }
}
