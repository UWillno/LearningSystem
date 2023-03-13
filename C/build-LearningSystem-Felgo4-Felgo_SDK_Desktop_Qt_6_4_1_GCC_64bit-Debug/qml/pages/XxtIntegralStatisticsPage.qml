import QtQuick
import Felgo
import  QtQuick.Controls
import Qt.labs.qmlmodels

AppPage {

    title: "积分统计"
    property var body

    TableView {
        anchors.fill: parent
        id:tableView

        model:tableModel
        delegate: Rectangle {
            implicitWidth: 70
            implicitHeight: 20
            border.width: 1

            Text {
                text: display
                anchors.centerIn: parent
            }
        }
    }
    onPopped: {
        destroy()
    }
    TableModel {
        id:tableModel
        TableModelColumn { display: "name"  }
        TableModelColumn { display: "score" }
        TableModelColumn { display: "answerScore"  }
        TableModelColumn { display: "discussScore" }
        TableModelColumn { display: "pickScore"  }
        TableModelColumn { display: "quizScore" }
        TableModelColumn { display: "taskScore" }
        TableModelColumn { display: "pickScore"  }
        TableModelColumn { display: "teacherScore" }
        TableModelColumn { display: "voteScore"  }
        //        rows:
    }
    //    SortFilterProxyModel {
    //        sourceModel: tableModel
    //        sorters: [
    //            LocaleAwareSorter {
    //                id: quizScoreSorter
    //                roleName: "quizScore"
    //                numericMode:true
    //                sortOrder: Qt.DescendingOrder
    //            }]
    //        onSortFinished: {
    //            console.log(JSON.stringify(tableModel.rows))

    //        }
    //    }??????????????????? 没成功？？



    Component.onCompleted:{
        var header = {"addScore":"加分","aliasname":"学号","answerScore":"回答分数",
            "averageWork":"平均工作","discussScore":"讨论分数",
            "img":"头像","integral":"完整","isGroupLeader":false,
            "loginName":"登录名","name":"姓名","personId":"私人ID",
            "pickScore":"选人分数","pingfenScore":"评分分数","quizScore":"测验分数",
            "qvoteScore":"投票分数","role":4,"score":"总分","taskScore":"任务分数",
            "teacherScore":"老师分数","uid":"超星ID",
            "url":"","voteScore":"投票分数"}
        var list = body.data.list
//        console.log(JSON.stringify(list))

        list.sort((a, b) => b.score - a.score);
        list.unshift(header)
        tableModel.rows = list
//         console.log(JSON.stringify(list))
//        list.forEach(function(object){
//            tableModel.appendRow(object)
//        })


//        "https://stat2-ans.chaoxing.com/work-stastics/student-works?clazzid=51401436&courseid=222959481&page=1&pageSize=200"
    }

}
