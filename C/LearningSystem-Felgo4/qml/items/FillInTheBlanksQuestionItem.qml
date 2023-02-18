import QtQuick
import Felgo
import QtQuick.Controls
import "template"
import "loader"
//Item {
Rectangle {
    id: questionRect

    property int blankcount: 0
    property var model
    property int type : 2
    property var blanks : new Array
    property alias question: questionInput.text
    property bool ismodify: true

    function clear(){
        questionInput.text=""
        for(var i=0;i < blankcount;i++){
            blanks[i].destroy()
        }
        blanks = []
        blankcount = 0
    }
    function isEmpty(){
        if(questionInput.text.trim() !== "" && blankcount!=0 )
        {
            for(var i=0;i < blankcount;i++){
                console.log(blanks[i].text)
                if(!blanks[i].text) return true
            }
            return false
        }

        return true
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
            appTextEdit.cursorPosition: text.length
            placeholderText: "题目"

        }
        Row{
            anchors.horizontalCenter:parent.horizontalCenter
            AppButton {
                id: btnAdd
                text: "+"
                onClicked: {
                    if(blankcount != 5){
                        blankcount++;
                        createblank();
                        if(ismodify)
                            questionInput.text += "____"
                    }else{
                        toastManager.show("填空题至多5个空",1000);
                    }
                }
            }

            AppButton {
                id:btnSubmit
                text: "提交"
                onClicked: {
                    console.log(isEmpty())
                    if(!isEmpty()){
                        loaderItem.show()
                        adminLogic.insertFillInTheBlanksQuestion(questionInput.text.trim(),adminLogic.blanksToAnswer(blanks))
                        clear()
                        //                        toastManager.show("提交成功！",1000)
                    }else{
                        toastManager.show("数据异常！",1000)
                    }

                }
            }
        }
        ModifyButtons {
            id:gridModify
        }
    }

    function createblank(){
        var component = Qt.createComponent("BlankComponent.qml").createObject(column)
        component.deleteThis.connect(deleteBlank)
        blanks.push(component)
        console.log(blanks)
    }
    function deleteBlank(blank){
        for(var i=0;i < blankcount;i++){
            if(blanks[i] === blank)
            {
                blanks.splice(i,1)
                break
            }
        }
        //        console.log(questionInput.text.lastIndexOf("____"))
        var index = questionInput.text.lastIndexOf("____")
        var text = questionInput.text
        console.log(text.length)
        if(index != -1){
            questionInput.text = text.substring(0,index) + text.substring(index+4,text.length)
            //            questionInput.cursorPosition = questionInput.text.length
        }

        console.log(index)
        //        questionInput.text = questionInput.text.splice(index,4)
        //        questionInput.text.replace()
        blank.destroy()
        blankcount--
    }



    Component.onCompleted: {
        console.log(model)
        if(model){
            ismodify = false
            questionInput.text = model.question
            model.answer
            var list =JSON.parse(model.answer)
            for(var i=0;i<=list.length-1;i++){
                btnAdd.clicked()
                console.log(blanks)
                console.log(blanks[i])
                blanks[i].text = list[i]
            }
            ismodify = true
            btnSubmit.visible = false
            gridModify.visible = true
        }
    }
}
