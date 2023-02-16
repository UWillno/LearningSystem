import QtQuick 2.0
import Felgo 3.0
import "../items"
Page {
    id: adminPage
    title: "管理员操作"
    //    anchors.top:rootStack.navigationBar.bottom

    property var ops: [
        {
            text: "添加题目",
            detailText: "Add Question",
            //            icon: IconType.apple
        },

        {
            text: "查看题目",
            detailText: "Select & Update Questions",
        },
        {
            text: "题库更新",
            detailText: "Commit Questions to Users",
        }
    ]

    AppListView {
        id: adminlist
        model:ops
        delegate: SimpleRow {
            onSelected: {
                if(index === 0 || index === 1)
                    createQuestionPage(index)
                if(index === 2)
                    adminLogic.commitQuestions()
                //                switch(index){
                //                case 0:
                ////                    questionPage.qP.state=0
                ////                    rootStack.push(questionPage)

                //                    break;
                //                case 1:
                //                    break;
                //                }
            }
        }


    }
    function createQuestionPage(index){
        var component = Qt.createComponent("QuestionPage.qml");
        if(component.status === Component.Ready){
            var obj =  component.createObject(parent,{state: index})
        }
        rootStack.push(obj)

    }
    //    Connections {
    //        id: connection
    //        target: qm
    //        onSubmitSucceeded:{
    //            toastManager.show("插入成功！",1000)
    //            loaderItem.close()
    //        }
    //        onSubmitFailed:{
    //            toastManager.show("插入失败！",1000)
    //            loaderItem.close()
    //        }
    //        onSelectSuceeded:{
    //            selectSwipeView.update()
    //            toastManager.show("查看成功！",1000)
    //            loaderItem.close()
    //        }
    //        onSelectFailed:{
    //            toastManager.show("查看失败！",1000)
    //            loaderItem.close()
    //        }

    //    }
    //    Component {

    //        QuestionPage {
    //            id:questionPage
    //            state: 100
    //        }
    //    }
}
