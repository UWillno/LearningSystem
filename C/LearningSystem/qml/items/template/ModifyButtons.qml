import QtQuick 2.0
import Felgo 3.0

Grid {
    id: gridModify
    columns: 2
    rows: 1
    visible: false
    //            spacing:
    anchors.horizontalCenter: parent.horizontalCenter
    AppButton {
        id: btnSave
        text: "保存"
        //            anchors.horizontalCenter: parent.horizontalCenter
        //            anchors.bottom: parent.bottom
        //                visible: false

        onClicked: {
            console.log(isEmpty())
            qm.testModel(model)
        }
    }
    AppButton {
        id: btnDelete

        text: "删除"
        onClicked: {
            console.log(type)
            console.log(model.id)
            adminLogic.deleteQuestion(model.id,type);
        }

        //                visible: false
        //            anchors.horizontalCenter: parent.horizontalCenter
        //            anchors.bottom: parent.bottom
    }
}
