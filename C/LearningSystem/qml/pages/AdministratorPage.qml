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
            detailText: "A delicious question with round shape",
//            icon: IconType.apple
        },

        {
            text: "修改题目",
            detailText: "A delicous question",
        }
    ]

    AppListView {
        id: adminlist
        model:ops
        delegate: SimpleRow {
            onSelected: {
                switch(index){
                case 0:
                    rootStack.push(insertChoiceQuestionPage)
                    break;
                }
            }
        }


    }

    Component {
        id:insertChoiceQuestionPage
        QuestionPage {}
    }
}
