import QtQuick
import Felgo
//import QtQuick.Controls
import QtQuick.Controls as QuickControls2

QuickControls2.SwipeView {

    property alias selectSwipeView: selectSwipeView
    id: selectSwipeView
    anchors.fill: parent
    property string listData
    currentIndex: 0
    orientation: Qt.Horizontal
    property var selectQuestion
    property var selectType
    property var choiceModel : qm.tcpQuestions[0]
    property var trueOrFalseModel : qm.tcpQuestions[1]
    property var fillModel : qm.tcpQuestions[2]
    //    property var model1: qm.tcpQuestions[0]

    Rectangle {
        AppListView {

            showSearch : true

            onSearch: {
                model.filterRole = "1"
            }

            id:choiceView
            anchors.fill: parent
            //                        model: model1
            model:choiceModel
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
            model: trueOrFalseModel
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
            model: fillModel
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

    function update(){
        choiceModel = qm.tcpQuestions[0]
        trueOrFalseModel = qm.tcpQuestions[1]
        fillModel = qm.tcpQuestions[2]
    }

}
