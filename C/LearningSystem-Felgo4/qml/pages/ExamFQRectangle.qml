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
    property int index
    property bool finished: false
    property bool isRight: true

    Column {
        id:questionCol

        anchors.fill: parent

        AppListItem {
            text: (index+1)+"." + question["question"]
        }

    }

    Component.onCompleted:{

         console.log(JSON.stringify(question))
        for(var i =0 ; i<count;i++){
            var com = Qt.createComponent("../items/BlankItem.qml").createObject(questionCol,{answer:answerJSON[i]})
            blanksItems.push(com)
//            console.log(answerJSON[i])

        }

    }

    Component {
        id:c2
        AppListItem {
            id: answerItem
            visible: finished
            //            visible:false
            text : "正确答案:" + answer
            textColor: "green"
        }
    }
    onFinishedChanged: {
        for(var i =0 ; i<count;i++){
            blanksItems[i].resultDisplay = true
            blanksItems[i].enabled = false
            if(!blanksItems[i].result)
                isRight = false
        }
        c2.createObject(questionCol)
    }


}
