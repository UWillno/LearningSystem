import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.5
//Item {
import QtQuick.Layouts 1.3
Rectangle{
    id: rectangle
    function clear(){
        questionInput.text=""
        optiton1Input.text=""
        optiton2Input.text=""
        optiton3Input.text=""
        optiton4Input.text=""
    }


    //    implicitWidth: parent.width
    //    implicitHeight: parent.contentHeight
    function isEmpty(){
        if(questionInput.text.trim() === "" || optiton1Input.text.trim() === "" || optiton2Input.text.trim() === "")
            return true
        return false
    }

    Column {
        id: column
        anchors.fill: parent
        anchors.leftMargin: dp(20)
        anchors.topMargin: dp(10)
        spacing: dp(10)

        //        AppTextInput {
        AppTextEdit {
            id:questionInput
            width: dp(200)

            wrapMode: AppTextEdit.WrapAnywhere
            placeholderText: "题目"
            //            RegExpValidator:
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

        AppTextInput {
            id: optiton1Input
            width: dp(200)
            placeholderText: "选项A"
        }
        AppTextInput {
            id: optiton2Input
            width: dp(200)
            placeholderText: "选项B"
        }
        AppTextInput {
            id: optiton3Input
            width: dp(200)
            placeholderText: "选项C"
        }
        AppTextInput {
            id: optiton4Input
            width: dp(200)
            placeholderText: "选项D"

        }

        Row{
            anchors.horizontalCenter: parent.horizontalCenter
            spacing: dp(20)
            AppText{
                id:apptext
                text: "正确答案:"
            }

            ComboBox {
                id:answerComboBox
                model:['A','B','C','D']
                height: apptext.height
            }
        }

        AppButton {
            id: btnsubmit
            text: "提交"
            anchors.horizontalCenter: parent.horizontalCenter
            //            anchors.bottom: parent.bottom
            onClicked: {
                console.log(isEmpty())
                if(!isEmpty()){
                    //                    rootStack.pop()
                    //                    qm.sendChoiceQuestion(questionInput.text.trim(),optiton1Input.text.trim(),optiton2Input.text.trim()
                    //                                          ,optiton3Input.text.trim(),optiton4Input.text.trim(),answerComboBox.currentText.trim())

                    adminLogic.insertChoiceQuestion( questionInput.text.trim(),optiton1Input.text.trim(),optiton2Input.text.trim()
                                                    ,optiton3Input.text.trim(),optiton4Input.text.trim(),answerComboBox.currentText.trim())

                    clear()
                }else{
                    toastManager.show("数据异常！",1000)
                }
            }
        }
    }


    //        state:
}


/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.66;height:480;width:640}D{i:1}
}
##^##*/
