import QtQuick
import Felgo
import QtQuick.Controls


Rectangle {

    property var question
    property string answer : question["answer"]
    property int count: JSON.parse(answer).length
    property var blanksItems : []
    property var answerJSON: JSON.parse(answer)
    property int type: 2

    Column {
        id:questionCol

        anchors.fill: parent

        AppListItem {
            text: (index+1)+"." + question["question"]
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
        for(var i =0 ; i<count;i++){
            var com = Qt.createComponent("../items/BlankItem.qml").createObject(questionCol,{answer:answerJSON[i]})
            blanksItems.push(com)
        }
        c1.createObject(questionCol)

    }

    Component {
        id:c1
        AppButton {
            id:submitBtn
            anchors.horizontalCenter: parent.horizontalCenter
            text: "确认"
            onClicked: {
                var allright = true
                for(var i =0 ; i<count;i++){
                    blanksItems[i].resultDisplay = true
                    blanksItems[i].enabled = false
                    if(!blanksItems[i].result)
                        allright = false
                }
                submitBtn.enabled = false
                //                answerItem.visible = true
                c2.createObject(questionCol)
                if(allright){
                    userLogic.addRQ(question.id,2)
                }else{
                    userLogic.addWQ(question.id,2)
                }
                c3.createObject(questionCol)
            }
        }

    }
    Component {
        id:c2
        AppListItem {
            id: answerItem
            //            visible:false
            text : "正确答案:" + answer
            textColor: "green"
        }
    }
    Component {
        id:c3
        AppListItem {
            id:analyzeItem
            visible: settings.key
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

                const text = `为什么题目“${question["question"]}”的正确答案是“${answer}”？`
                console.log(text)
                con.enabled = true
                logic.toChatGPT(text)

//                console.log("abababa")
            }

        }


    }

}
