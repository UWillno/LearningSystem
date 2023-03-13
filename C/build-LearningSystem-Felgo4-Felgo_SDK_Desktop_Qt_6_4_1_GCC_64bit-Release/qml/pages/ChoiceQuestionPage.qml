import QtQuick
import Felgo
import QtQuick.Controls
AppPage {



//    property var name: value
//    property var questions
    property var question
    property var option1 : question["option1"]
    property var option2 : question["option2"]
    property var option3 : question["option3"]
    property var option4 : question["option4"]
    property int type: 0
    title: "选择题"


    ButtonGroup {
        id: optionGroup
        buttons: [radio1,radio2,radio3,radio4]
    }


    //    AppFlickable {
    //        anchors.fill: parent
    //        flickableDirection:Flickable.HorizontalAndVerticalFlick

    Column {
        //        anchors.fill: parent
        id:questionCol
        //        width: parent.width
        anchors.fill: parent

        AppListItem {
            text: (index+1)+"." + question["question"]
        }


        AppListItem {
            leftItem: AppRadio {
                id: radio1
                //                checked: true
                value: "Option 1"
                anchors.verticalCenter: parent.verticalCenter
            }
            text: "A." + option1

            onSelected: {
                if(!radio1.checked) radio1.toggle()
            }
        }
        AppListItem {
            leftItem: AppRadio {
                id: radio2
                //                checked: true
                value: "Option 2"
                anchors.verticalCenter: parent.verticalCenter
            }
            text: "B." + option2
            onSelected: {
                if(!radio2.checked) radio2.toggle()
            }
        }
        AppListItem {
            leftItem: AppRadio {
                id: radio3
                //                checked: true
                value: "Option 3"
                anchors.verticalCenter: parent.verticalCenter
            }
            text: "C." + option3
            onSelected: {
                if(!radio3.checked) radio3.toggle()
            }
        }
        AppListItem {
            leftItem: AppRadio {
                id: radio4
                //                checked: true
                value: "Option 4"
                anchors.verticalCenter: parent.verticalCenter
            }
            text: "D." + option4
            onSelected: {
                if(!radio4.checked) radio4.toggle()
            }
        }

        AppButton {
            text:"++"
            onClicked: {
                index++
            }
        }
    }

    //        onContentXChanged: {
    //            console.log(contentX)
    //            if(contentX > parent.width/2){
    //                contentX = 0
    //                toastManager.show("next",1000)
    //            }
    //        }
    //    }

    Component.onCompleted: {
        console.log("question:"+index)
    }

}
