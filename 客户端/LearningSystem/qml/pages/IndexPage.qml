import QtQuick 2.0
import Felgo 3.0
import "../items"
Page {

    id: indexPage
    title: "Index"
    Column {

//        anchors.top: parent.top

//        anchors.topMargin: dp(20)

        LoginItem {
            id:logitem
//            anchors.centerIn: parent
        }

    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:2}
}
##^##*/
