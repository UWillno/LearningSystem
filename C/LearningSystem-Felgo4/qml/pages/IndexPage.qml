import QtQuick
import Felgo
import "../items"


AppPage {

    id: indexPage
    title: "Learning System"

    property var userops: [
        {
            text: "课程学习",
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
    Rectangle {
        id: rectangle
        anchors.fill: parent
        color: "#F5F5F5"
        Column {
            anchors.fill: parent
            anchors.topMargin: dp(10)
            LoginItem {
                id:logitem
            }

            AppListView {
                model:userops
                z: -1
                delegate: SimpleRow{

                    onSelected: {
                        var xxtpage =Qt.createComponent("XxtWebPage.qml").createObject()
                        rootStack.push(xxtpage)
                    }

                }
            }

        }
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:2}D{i:2}
}
##^##*/
