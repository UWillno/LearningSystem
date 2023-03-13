import QtQuick
import Felgo
import QtQuick.Controls
Rectangle {
    id:gridViewRect
    property alias modelData: jsonlistModel.source
    property alias cellHeight: gridView.cellHeight
    property alias cellWidth: gridView.cellWidth
    property int type
    GridView {
        id:gridView
        anchors.fill: parent
        leftMargin: dp(40)
        topMargin: dp(10)
        bottomMargin: dp(10)
        cellHeight: dp(70)
        cellWidth: dp(100)

        model: JsonListModel {
            id:jsonlistModel
        }
        delegate: QuestionRect {
            width: cellWidth - 8
            height: cellHeight - 8

            MouseArea {
                anchors.fill: parent
                onClicked:  {
                    //                    if(gridViewRect.type === 0){
                    var p = Qt.createComponent("../pages/QuestionSwipeViewPage.qml").createObject(parent,{model:modelData,swipeIndex:index})
                    practiceStack.push(p)
                    //                    }

                }
            }

            Component.onCompleted:{
                if(userLogic.isWrong(model.id,gridViewRect.type)){
                    state = "wrong"
                }
                if(userLogic.isRight(model.id,gridViewRect.type)){
                    state = "right"
                }
            }
        }

    }
    function refresh(){
        var m = modelData
        gridView.model.clear()
        modelData = m
    }
    function refreshH(myModel){
        gridView.model.clear()
        modelData = myModel
    }

}
