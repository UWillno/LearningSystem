import QtQuick
import Felgo
import QtQuick.Controls
import Qt.labs.qmlmodels

AppPage {

    title: "作业统计"
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

    TableModel {
        id:tableModel
        TableModelColumn { display: "userName"  }
        TableModelColumn { display: "avg" }
        TableModelColumn { display: "workMarked"  }
        TableModelColumn { display: "completeNum" }
        TableModelColumn { display: "max"  }
        TableModelColumn { display: "min" }
        TableModelColumn { display: "workSubmited" }
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
        var header = {"completeNum":"完成数",
            "aliasName":"学号",
            "avg":"平均分",
            "min":"最低分",
            "max":"最高分",
            "personId":"私人ID",
            "workSubmited":"提交数",
            "workMarked":"批阅数",
            "userName":"姓名"}

        var data = body.data
        data.sort((function(a,b){
            if(a.workMarked > b.workMarked){
                return -1
            }else if(a.workMarked < b.workMarked){
                return 1
            }else{
                if (a.avg > b.avg) {
                    return -1; // a在b前面
                } else if (a.avg < b.avg) {
                    return 1; // a在b后面
                } else {
                    return 0; // 相等，不改变顺序
                }
            }
        }))




        //        var list = body.data.list
        //        //        console.log(JSON.stringify(list))

        //        list.sort((a, b) => b.score - a.score);
        data.unshift(header)
        tableModel.rows = data
        //         console.log(JSON.stringify(list))
        //        list.forEach(function(object){
        //            tableModel.appendRow(object)
        //        })


        //        "https://stat2-ans.chaoxing.com/work-stastics/student-works?clazzid=51401436&courseid=222959481&page=1&pageSize=200"
    }
    onPopped: {
        destroy()
    }
}
