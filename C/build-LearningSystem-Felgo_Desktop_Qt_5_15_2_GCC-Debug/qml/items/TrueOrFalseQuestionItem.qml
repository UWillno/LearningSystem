import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.5
//Item {
import "template"
import "loader"
Rectangle {
    id: questionRect
    property var model
    property int type : 1
    property alias question: questionInput.text
    property alias answer: btnTrue.checked
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
        anchors.fill: parent
        anchors.leftMargin: dp(20)
        anchors.topMargin: dp(10)
        anchors.rightMargin: dp(20)
        spacing: dp(10)
        UWAppTextEdit {
            id:questionInput
            placeholderText: "题目"

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
            id:btnSubmit
            text: "提交"
            anchors.horizontalCenter:parent.horizontalCenter
            onClicked: {
                console.log(isEmpty())
                if(!isEmpty()){
                    loaderItem.show()
                    var answer = 0
                    if(btnTrue.checked) answer = 1
                    console.log(answer)
                    qm.sendTrueOrFalseQuestion(questionInput.text.trim(),answer)
                    //                    toastManager.show("提交成功！",1000)
                    clear()
                }else{
                    toastManager.show("数据异常！",1000)
                }

            }
        }
        ModifyButtons{
            id:gridModify
        }
    }


    Component.onCompleted: {
        if(model){
            questionInput.text = model.question
            //            console.log("答案"+ (model.answer))
            if(!model.answer) {
                btnFalse.toggle()
            }

            btnSubmit.visible = false
            gridModify.visible = true
        }
    }
}

