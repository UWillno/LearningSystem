import QtQuick
import Felgo
import QtQuick.Controls
Rectangle {

    property var question
    property bool answer : question["answer"]
    property int type: 1
    property var answerDisplay: answer? "√" : "×"
    property var rightOption : answer? "正确的":"错误的"
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
            id:answerItem
            visible:optionGroup.checkState == Qt.PartiallyChecked
            text : "正确答案:"+ answerDisplay
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

                const text = `为什么判断题“${question["question"]}”的答案是“${rightOption}”？`
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
//        console.log(answer)

//        if(answer){}
        //        console.log(answer)
        //        console.log(JSON.stringify(settings.wCQ))
        //        console.log(question.id)
    }
}
