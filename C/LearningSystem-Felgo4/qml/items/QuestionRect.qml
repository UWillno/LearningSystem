import QtQuick
import Felgo

Rectangle {
    id:questionRect
    radius: dp(10)
    border.color: "green"
    Text {
        anchors.centerIn: parent
        text: index+1
    }

   states: [
       State {
           name: "nodo"
           PropertyChanges {
               target: questionRect
               color:"while"
           }
       },
       State {
           name: "right"
           PropertyChanges {
               target: questionRect
               color:"green"
           }
       },
       State {
           name: "wrong"
           PropertyChanges {
               target: questionRect
               color:"red"
           }
       }
   ]
}
