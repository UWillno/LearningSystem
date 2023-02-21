import QtQuick
import Felgo
import QtQuick.Controls
import "template"
import "loader"


Rectangle{
//    id: root
    id:questionRect
//        color: "green"

    property var model
    property int type : 0
    property alias question: questionInput.text
    property alias option1: option1Input.text
    property alias option2: option2Input.text
    property alias option3: option3Input.text
    property alias option4: option4Input.text
    property alias answer: answerComboBox.currentText

    function clear(){
        questionInput.text=""
        option1Input.text=""
        option2Input.text=""
        option3Input.text=""
        option4Input.text=""
    }

    function isEmpty(){
        if(questionInput.text.trim() === "" || option1Input.text.trim() === "" || option2Input.text.trim() === "")
            return true
        return false
    }

    Column {
        id: column
        anchors.fill: parent
        anchors.leftMargin: dp(20)
        anchors.rightMargin: dp(20)
        anchors.topMargin: dp(10)
        spacing: dp(10)

        UWAppTextEdit {
            id:questionInput
            placeholderText: "题目"
        }

        AppTextInput {
            id: option1Input
            width: parent.width
            placeholderText: "选项A"
        }
        AppTextInput {
            id: option2Input
            width: parent.width
            placeholderText: "选项B"
        }
        AppTextInput {
            id: option3Input
            width: parent.width
            placeholderText: "选项C"
        }
        AppTextInput {
            id: option4Input
            width: parent.width
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
                height: apptext.height + dp(5)
            }
        }

        AppButton {
            id: btnSubmit
            text: "提交"
            anchors.horizontalCenter: parent.horizontalCenter
            //            anchors.bottom: parent.bottom
            onClicked: {
                console.log(isEmpty())

                if(!isEmpty()){
                    //                    rootStack.pop()
                    //                    qm.sendChoiceQuestion(questionInput.text.trim(),option1Input.text.trim(),option2Input.text.trim()
                    //                                          ,option3Input.text.trim(),option4Input.text.trim(),answerComboBox.currentText.trim())
                    loaderItem.show()
                    adminLogic.insertChoiceQuestion( questionInput.text.trim(),option1Input.text.trim(),option2Input.text.trim()
                                                    ,option3Input.text.trim(),option4Input.text.trim(),answerComboBox.currentText.trim())

                    clear()

                }else{
                    toastManager.show("数据异常！",1000)
                }

            }
        }
        ModifyButtons {
            id: gridModify
        }
    }

    Component.onCompleted: {

        if(model){
            questionInput.text = model.question
            option1Input.text = model.option1
            option2Input.text = model.option2
            option3Input.text = model.option3
            option4Input.text = model.option4
            if(model.answer === 'B')
                answerComboBox.model = ['B','A','C','D']
            else if(model.answer === 'C')
                answerComboBox.model = ['C','A','B','D']
            else if(model.answer === 'D')
                answerComboBox.model = ['D','A','B','C']

            btnSubmit.visible = false
            gridModify.visible = true
        }

    }
}

