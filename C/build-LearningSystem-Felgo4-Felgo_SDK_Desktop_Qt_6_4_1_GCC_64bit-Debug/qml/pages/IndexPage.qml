import QtQuick
import Felgo
import "../items"


AppPage {

    id: indexPage
    title: "Learning System"

    Rectangle {
        id: rectangle
        anchors.fill: parent
        color: "#F5F5F5"
        Column {
            spacing: dp(20)
            anchors.fill: parent
            anchors.topMargin: dp(10)
            LoginItem {
                id:logitem
            }


            Rectangle {
                z:-1
                height: parent.height - logitem.height
                radius: dp(20)
                width: parent.width - dp(10)

                Column{
                    topPadding: dp(10)
                    anchors.fill: parent
                    AppText {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text:"asdas "
                    }

                    AppButton {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: "下载"
                    }
                }



                //                AppSwitch {

                //                    anchors.horizontalCenter: parent.horizontalCenter
                //                }


            }

        }
    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:2}D{i:2}
}
##^##*/
