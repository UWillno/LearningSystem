import QtQuick
import Felgo
import QtQuick.Controls

AppPage {
    id:questionSwipeViewPage
    property alias model: repeater.model
    property alias swipeIndex: questionSwipeView.currentIndex

    rightBarItem: IconButtonBarItem {
        visible: false
        iconType: IconType.recycle
        onClicked: {
            var id = questionSwipeView.currentItem.item.question.id
//            console.log(questionSwipeView.currentItem.item.question.id)
            const type =questionSwipeView.currentItem.item.type
            //            console.log(type)
            if(userLogic.removeW(id,type)){
                toastManager.show("已移出错题库",1000)
            }


        }
        Component.onCompleted:{
            var id = questionSwipeView.currentItem.item.question.id
            const type =questionSwipeView.currentItem.item.type
            if(userLogic.isWrong(id,type)){
                visible = true
            }
        }
    }

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
