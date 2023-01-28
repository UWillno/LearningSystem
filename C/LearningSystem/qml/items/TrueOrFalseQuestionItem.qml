import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.5
//Item {

Rectangle {
    function isEmpty(){
        if(questionInput.text.trim() === "")
            return true
        return false
    }
    function clear(){
        questionInput.text=""
    }
    Column {
        id: column
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter

        //        AppTextInput {
        //            id:questionInput
        //            width: dp(200)
        //            placeholderText: "题目"
        //            //                width: parent.width
        //        }
        AppTextEdit {
            id:questionInput
            width: dp(200)
            wrapMode: AppTextEdit.WrapAnywhere
            placeholderText: "题目"
            onTextChanged: {
                //                console.log(fontSize)
                height = questionInput.contentHeight

            }
            onLineCountChanged: {
                if(lineCount < 5){
                    fontSize = 17
                }
                switch(lineCount){
                case 5:
                    fontSize =16
                    break
                case 10:
                    fontSize = 15
                    break
                case 15:
                    fontSize = 14
                    break
                default:
                    break
                }
                if(lineCount == 20){
                    text = ""
                }
            }
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
                    var answer = 0
                    if(btnTrue.checked) answer = 1
                    console.log(answer)
                    qm.sendTrueOrFalseQuestion(questionInput.text.trim(),answer)
                    toastManager.show("提交成功！",1000)
                    clear()
                }else{
                    toastManager.show("数据异常！",1000)
                }

            }
        }
    }

    //        state:
}

