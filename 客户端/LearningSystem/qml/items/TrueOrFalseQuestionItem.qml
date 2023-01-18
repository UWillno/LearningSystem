import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.5
Item {

    function isEmpty(){
        if(questionInput.text.trim() === "")
            return true
        return false
    }
    Column {
        id: column
        anchors.horizontalCenter: parent.horizontalCenter

        AppTextInput {
            id:questionInput
            width: dp(200)
            placeholderText: "题目"
            //                width: parent.width
        }
        ButtonGroup {
            id:btnGroup
            buttons:[btnTrue,btnFalse]
        }
        Row{
            AppRadio {
                id: btnTrue
                text: "正确"
                checked: true
            }
            spacing: dp(20)

            AppRadio {
                id: btnFalse
                text: "错误"
            }


        }
        AppButton {
            text: "提交"
            anchors.horizontalCenter:parent.horizontalCenter
            onClicked: {
                console.log(isEmpty())
                if(!isEmpty()){
                    rootStack.pop()
                }
            }
        }
    }

    //        state:
}

