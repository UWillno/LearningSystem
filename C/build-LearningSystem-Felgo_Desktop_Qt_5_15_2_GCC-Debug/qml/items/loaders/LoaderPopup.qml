import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.15


Popup {
    id: popup
    anchors.centerIn: parent
    width: parent.width / 2
    height: popup.width
    modal: true
    opacity: 0.1
    Rectangle {
        anchors.fill: parent
        color:"#F5F5F5"
            ClockSpinner {
                anchors.fill: parent
            }

    }

//    background:


}

//Popup {

//    id: item

//}
