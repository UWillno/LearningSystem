﻿import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.0 as QuickControls2

QuickControls2.SwipeView {
    id: selectSwipeView
    anchors.fill: parent
    property string listData
    currentIndex: 0
    orientation: Qt.Horizontal

    Rectangle {
        AppListView {
            id:choiceView
            anchors.fill: parent

            //            model:qm.tcpQuestions[0]
            delegate: SimpleRow { text : index+1 + "." + modelData.question
                onSelected: {
                    console.log(modelData.id)
                }
            }
        }
    }
    Rectangle {
        AppListView {
            id:trueOrfalseView
            anchors.fill: parent
            delegate: SimpleRow { text : index+1 +"." + modelData.question
                onSelected: {
                    console.log(modelData.id)
                }
            }
        }
    }
    Rectangle {
        AppListView {
            id:fillView
            anchors.fill: parent

            //            model:qm.tcpQuestions[0]
            delegate: SimpleRow { text : index+1 +"." + modelData.question
                onSelected: {
                    console.log(modelData.id)
                }
            }
        }
    }

    Component.onCompleted: {
        qm.getQuestionsByTcp()
        console.log(qm.tcpQuestions)
        choiceView.model = qm.tcpQuestions[0]
        trueOrfalseView.model = qm.tcpQuestions[1]
        fillView.model = qm.tcpQuestions[2]
        //        console.log(qm.tcpQuestions)
    }
}
