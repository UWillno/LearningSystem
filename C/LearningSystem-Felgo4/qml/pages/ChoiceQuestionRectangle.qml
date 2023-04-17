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

    property string rightOption
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
            id:answerItem
            visible:optionGroup.checkState == Qt.PartiallyChecked
            text : "正确答案:"+answer
            textColor: "green"
        }

        AppListItem {
            id:analyzeItem
            visible:answerItem.visible && settings.key
            leftItem: Text {
                anchors.verticalCenter: parent.verticalCenter
                text: "<b>OpenAI</b>"

            }
            textColor: "blue"
            text: "题目解析"
            detailText: "by ChatGPT"
            //            MouseArea {
            //            anchors.fill: parent
            //            onClicked: console.log("abababab")
            //            }
            onSelected: {
                analyzeItem.visible = false
                toastManager.show("请求中……",4000)
                //                const rightOption =
                //                                console.log(question["question"] + rightOption)
                //                const qu = question["question"]

                const text = `为什么题目“${question["question"]}”的正确答案是“${rightOption}”？`
                console.log(text)
                con.enabled = true
                logic.toChatGPT(text)

                //            console.log("abababa")
            }
        }
    }

    Connections {
        id:con
        enabled:false
        target: logic
        onChatReply:function(text){
            toastManager.show("获取成功！",1000)
            Qt.createComponent("../items/QuestionAnalyzeItem.qml").createObject(questionCol,{analyze:text})
            enabled = false
        }
    }



    Component.onCompleted:{
        switch(answer){
        case "A":{
            rightOption = option1
            break
        }
        case "B":{
            rightOption = option2
            break
        }
        case "C":{
            rightOption = option3
            break
        }
        case "D":{
            rightOption = option4
            break
        }
        }

        //        console.log(answer)
        //        console.log(JSON.stringify(settings.wCQ))
        //        console.log(question.id)
    }



}
