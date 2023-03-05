import QtQuick
import Felgo
import QtQuick.Controls

AppPage {
    property alias model: repeater.model
    property alias swipeIndex: questionSwipeView.currentIndex
    title: "New Page"
    SwipeView {
        id: questionSwipeView
        anchors.fill: parent

        Repeater {
            id:repeater
            Loader {
                active: SwipeView.isCurrentItem || SwipeView.isNextItem || SwipeView.isPreviousItem
                sourceComponent:getComponent()

                Component{
                    id:tCom
                    //       property var modelData
                    TrueOrFalseQuestionRectangle {
                        question: modelData
                    }
                }
                Component{
                    id:cCom
                    //       property var modelData
                    ChoiceQuestionRectangle { question: modelData }
                }
                Component{
                    id:fCom
                    //       property var modelData
                    FillInTheBlanksQuestionRectangle {
                        question: modelData
                    }
                }
                function getComponent() {
                    if(modelData.option1){
                        return cCom
                    }else{
                        if(typeof modelData.answer === typeof true)
                            return tCom
                        else{
                            return fCom
                        }
                    }
                    //                    return

                }


            }
        }
    }


    Component.onCompleted:{
        //        console.log(JSON.stringify(model))
    }

}
