﻿import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.5

//Item {
Rectangle {
    property int blankcount: 0
    property var blanks : new Array
    function clear(){
        questionInput.text=""
        for(var i=0;i < blankcount;i++){
            blanks[i].destroy()
        }
        blanks = []
        blankcount = 0

    }
    function isEmpty(){
        if(questionInput.text.trim() === "" && blankcount!=0 )
            return true
        return false
    }
    Column {
        id: column
        anchors.fill: parent
        anchors.leftMargin: dp(20)
        anchors.topMargin: dp(10)
        anchors.rightMargin: dp(20)
        spacing: dp(10)

        //        AppTextInput {
        //            id:questionInput
        //            width: dp(200)
        //            placeholderText: "题目"
        //            //                width: parent.width
        //        }
        AppTextEdit {
            id:questionInput
            width: parent.width
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
        Row{
            anchors.horizontalCenter:parent.horizontalCenter
            AppButton {
                text: "+"
                onClicked: {
                    if(blankcount != 5){
                        blankcount++;
                        createblank();
                        questionInput.text += "____"
                        questionInput.cursorPosition = questionInput.text.length
                    }else{
                        toastManager.show("填空题至多5个空",1000);
                    }
                }
            }

            AppButton {
                text: "提交"
                onClicked: {
                    console.log(isEmpty())
                    if(!isEmpty()){
                        adminLogic.insertFillInTheBlanksQuestion(questionInput.text.trim(),adminLogic.blanksToAnswer(blanks))
                        clear()
                        toastManager.show("提交成功！",1000)
                    }else{
                        toastManager.show("数据异常！",1000)
                    }

                }
            }
        }
    }
    function createblank(){
        var component = Qt.createComponent("BlankComponent.qml").createObject(column)
        component.deleteThis.connect(deleteBlank)
        blanks.push(component)
        console.log(blanks)
        //        component.createObject(column)
        //        console.log(component.status)
        //        if(component.status === Component.Ready){
        //            console.log("creating")

        //        }

        //       var object = Qt.createQmlObject(component,column)
        //        var newobject = Qt.createQmlObject('import QtQuick 2.0;import Felgo 3.0; AppTextInput {
        //            id:questionInput
        //            width: dp(200)
        //            placeholderText: "请输入"
        //            //                width: parent.width
        //        }',column,"")
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
            questionInput.cursorPosition = questionInput.text.length
        }

        console.log(index)
        //        questionInput.text = questionInput.text.splice(index,4)
        questionInput.text.replace()
        blank.destroy()
        blankcount--
    }
}
