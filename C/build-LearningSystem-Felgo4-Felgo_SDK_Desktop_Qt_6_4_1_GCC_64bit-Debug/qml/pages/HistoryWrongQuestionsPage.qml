import QtQuick
import Felgo
import QtQuick.Controls
import "../items"

AppPage {
    title: "历史错题"
    property var questionsDB: settings.questionsDB
    property var choiceModel : []
    property var trueModel : []
    property var fillModel : []

    AppTabBar {
        id: appTabBar
        contentContainer: swipeView

        AppTabButton {
            text: "选择题"
        }
        AppTabButton {
            text: "判断题"
        }
        AppTabButton {
            text: "填空题"
        }
    }
    SwipeView {
        id: swipeView
        anchors.top: appTabBar.bottom
        anchors.bottom: parent.bottom
        width: parent.width
        clip: true

        QGridView {
            id: qGridViewC
            type: 0
        }

        QGridView {
            id: qGridViewT
            type: 1
        }
        QGridView {
            id: qGridViewF
            type: 2
        }

    }

    onPopped: {
        destroy()
    }
    Component.onCompleted:{

        refreshWrongCQ()
        qGridViewC.modelData = choiceModel
        qGridViewT.modelData = trueModel
        qGridViewF.modelData = fillModel

    }
    function refreshWrongCQ(){
        choiceModel = []
        trueModel = []
        fillModel = []

        for(var i=0;i<questionsDB["C"].length;i++){
            //            if(questionsDB["C"][i].id)
            if(userLogic.isWrong(questionsDB["C"][i].id,0)){
                console.log(questionsDB["C"][i].id)
                choiceModel.push(questionsDB["C"][i])
            }
        }

        for(i=0;i<questionsDB["T"].length;i++){
            //            if(questionsDB["C"][i].id)
            if(userLogic.isWrong(questionsDB["T"][i].id,1))
                trueModel.push(questionsDB["T"][i])
        }

        for(i=0;i<questionsDB["F"].length;i++){
            //            if(questionsDB["C"][i].id)
            if(userLogic.isWrong(questionsDB["F"][i].id,2))
                fillModel.push(questionsDB["F"][i])
        }

    }

    Connections {
        target: practiceStack
        onPopped:{
            refreshWrongCQ()
            qGridViewC.refreshH(choiceModel)
            qGridViewT.refreshH(trueModel)
            qGridViewF.refreshH(fillModel)
        }
    }
}
