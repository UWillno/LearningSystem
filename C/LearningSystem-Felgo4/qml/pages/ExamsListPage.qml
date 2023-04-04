import QtQuick
import Felgo
import QtQuick.Controls

ListPage {

    title: "历史考试信息"

    JsonListModel {
        id:examsModel
        source: settings.exams
    }




    model:examsModel

    delegate: SimpleRow {
        text:model.date  + "\t得分:" +  model.point
//        color:"red"
        detailText: "正确率："+(model.right.length / (model.wrong.length+model.right.length) *100).toFixed(4) +"%\t题目总数："+(model.wrong.length+model.right.length)


        onSelected: {
                const p  = Qt.createComponent("ExamDetailPage.qml").createObject(parent,{model:model});
                rootStack.push(p)
        }


    }



    Component.onCompleted:{
                console.log(JSON.stringify(settings.exams))
    }

}
