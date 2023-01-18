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
        Row{
            anchors.horizontalCenter:parent.horizontalCenter
            AppButton {
                text: "+"

            }

            AppButton {
                text: "提交"
                onClicked: {
                    console.log(isEmpty())
                    if(!isEmpty()){
                        rootStack.pop()
                    }
                }
            }
        }
    }

    //        state:
}

