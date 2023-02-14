import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.0 as QuickControls2

QuickControls2.SwipeView {
    property alias selectSwipeView: selectSwipeView
    id: selectSwipeView
    anchors.fill: parent
    property string listData
    currentIndex: 0
    orientation: Qt.Horizontal
    property var selectQuestion
    property var selectType

    Rectangle {
        AppListView {
            id:choiceView
            anchors.fill: parent
            //            model: qm.tcpQuestions[0]
            //            model:qm.tcpQuestions[0]
            delegate: SimpleRow { text : index+1 + "." + modelData.question
                onSelected: {
                    console.log(modelData.id)
                    viewDetail(0,modelData)
                }
            }
        }
    }
    Rectangle {
        AppListView {
            id:trueOrfalseView
            anchors.fill: parent
            //            model: qm.tcpQuestions[1]
            delegate: SimpleRow { text : index+1 +"." + modelData.question
                onSelected: {
                    console.log(modelData.id)
                    viewDetail(1,modelData)
                }
            }
        }
    }
    Rectangle {
        AppListView {
            id:fillView
            anchors.fill: parent
            //            model: qm.tcpQuestions[2]
            delegate: SimpleRow { text : index+1 +"." + modelData.question
                onSelected: {
                    console.log(modelData)
                    viewDetail(2,modelData)
                }
            }
        }
    }
    function viewDetail(type,question){
        var component = Qt.createComponent("ModifyQuestionPage.qml")
        selectQuestion = question
        selectType= type
        rootStack.push(component)

    }

    Component.onCompleted: {
        qm.getQuestionsByTcp()
        if(qm.tcpQuestions){
            console.log("true")
            update()
//            choiceView.model = qm.tcpQuestions[0]
//            trueOrfalseView.model = qm.tcpQuestions[1]
//            fillView.model = qm.tcpQuestions[2]
        }
        //        console.log(qm.tcpQuestions)

        //        console.log(qm.tcpQuestions)
    }
    function update(){
        adminLogic.updateSelectQuestions(choiceView,trueOrfalseView,fillView)
    }

}
