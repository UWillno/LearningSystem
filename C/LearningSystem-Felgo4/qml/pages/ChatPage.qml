import QtQuick
import Felgo
import QtQuick.Controls
import "../items/template"
import Qt.labs.settings
AppPage {
    id:chatPage

    title: settings.model
    property var sendings: chatSettings.sss || []
    property var replies:chatSettings.srs || []

    rightBarItem: IconButtonBarItem{

        iconType: IconType.recycle
        onClicked: {
            NativeDialog.confirm("确认","清空记录？",function(ok) {
                if(ok) {
                    clear();

                }
            })
        }
    }

    function sync(){
        chatSettings.sss = sendings
        chatSettings.srs = replies
    }

    function clear(){
        sendings=[]
        replies=[]
        sync()
        for (var i = 0; i < column.children.length; i++) {
            column.children[i].destroy();
        }
    }
    Settings{
        id:chatSettings
        property var sss
        property var srs

    }
    Flickable {
        width: parent.width
        height:  parent.height - botttomRow.height
        contentHeight: column.height
        //        ColumnLay
        Column{
            id:column
            width: parent.width
            anchors.horizontalCenter: parent.horizontalCenter
        }

        onContentHeightChanged: {
            if (contentHeight > height) {
                // 当 contentHeight 大于 height 时，自动滑到最底部
                contentY = contentHeight - height
            }
        }
    }

    Row {
        id: botttomRow
        //        leftPadding: 10
        padding: 10
        anchors.bottom: parent.bottom
        width: parent.width - padding
        //        Rectangle {
        //            width: parent.width  - sendBtn.width
        //            height:sendBtn.height
        //            color: "white"
        //            radius: dp(10)
        //            AppTextEdit {
        //                clip: true
        //                id:sendText
        //                anchors.fill: parent
        //            }
        //        }
        UWAppTextEdit {
//            radius: dp(20)
            id: sendText
            width: parent.width  - sendBtn.width
            height: sendBtn.height

        }

        AppButton {
//            radius: dp(10)
            id:sendBtn
            width: dp(100)
            text: "发送"
            onClicked: {
                if(sendText.text!=""){
                    console.log("click")
                    console.log(sendText.text)
                    console.log(sendings)
                    sendings.push(sendText.text)
                    sync()
                    console.log("after clicking")
                    console.log(sendText.text)
                    console.log(sendings)

                    sendCom.createObject(column,{sendText:sendText.text})
                    const c =  replyCom.createObject(column,{cEnabled:true})
                    enabled = false
                    logic.toChatGPT(sendText.text)
                    sendText.text = ""
                }
            }
        }
    }




    Component{
        id:sendCom

        Rectangle {
            property alias sendText: textSend.text
            //            Layout.fillWidth: true
            width: parent.width
            height: textSend.height
            color: "white"
            Text {
                id:textSend
                horizontalAlignment: Text.AlignLeft
                padding: 10
                width: parent.width
                wrapMode: Text.WrapAnywhere
            }
        }
    }

    Component {

        id:replyCom
        Row {
            property string replyText
            property alias cEnabled: con.enabled
            Component.onCompleted: {
                if(replyText){
                    textReply.text = replyText
                }
            }


            width: parent.width - padding * 2
            anchors.horizontalCenter: parent.horizontalCenter
            padding: 5
            height: gptImage.height > textReply.height ? gptImage.height + dp(10) :  textReply.height+ dp(10)

            Image {
                id: gptImage
                verticalAlignment: Image.AlignTop
                source: "qrc:/images/ChatGPT_logo.png"
                width: 40
                height: 40
            }
            Item {
                id: name
                width: 10
                height: parent.height
            }
            Text {
                id:textReply
                //                padding: 10
                horizontalAlignment: Text.AlignLeft
                width: parent.width - gptImage.width - 20
                text: "请求中……"
                wrapMode: Text.WrapAnywhere
            }

            Connections {
                id:con
                target: logic
                enabled:false
                onChatReply :function(text){
                    //                    replyText = text
                    animation.restart()
                    textReply.text =text
                    enabled = false
                    replies.push(text)
                    sync()
                    console.log(replies)
                    sendBtn.enabled = true
                }
            }
            PropertyAnimation {
                id:animation
                target: textReply
                property: "opacity"
                from: 0
                to: 1
                duration: 1000
                running: true
            }
        }
    }

    Component.onCompleted: {
        console.log(sendings)
        console.log(replies)
        //        sendings = chatSettings.sss || []
        //        replies = chatSettings.srs || []
        //        console.log(sendings)
        //        console.log(replies)
        if(sendings && replies){
            for(var i=0;i<sendings.length;i++){
                sendCom.createObject(column,{sendText:sendings[i]})
                replyCom.createObject(column,{replyText:replies[i]})
            }
        }
        /*else{
            sendings = []
            replies = []

        }*/
        //        if(sss && srs){
        //            sendings = sss
        //            replies = srs
        //            for(var i=0;i<sendings.length;i++){
        //                sendCom.createObject(column,{sendText:sendings[i]})
        //                replyCom.createObject(column,{replyText:replies[i]})
        //            }
        //        }else{
        //            sendings = []
        //            replies = []
        //        }
    }




}
