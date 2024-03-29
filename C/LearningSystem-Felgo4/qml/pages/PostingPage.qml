import QtQuick
import Felgo
import QtQuick.Controls
import Qt.labs.platform
import "../items/template"
AppPage {
    //    property alias titleInput: titleInput
    //    property alias postEdit: postEdit


    title: "发帖"

    //    property var photos: new Array

    //    anchors.fill: parent
    Column {
        anchors.leftMargin: dp(20)
        anchors.rightMargin: dp(20)
        anchors.topMargin: dp(10)
        anchors.bottomMargin: dp(80)
        anchors.fill: parent
        //        width: parent.width
        //        height: parent.height - navigation.drawerLogoHeight

        AppTextInput {
            id: titleInput
            //            height: contentHeight
            width: parent.width
            placeholderText: "标题"
            //            RegExpFilter.
        }
        Row{
            id:typerow
            AppRadio {
                id:r1
                checked: true
                text:"学习心得"
            }
            AppRadio {
                id:r2
                text:"考试技巧"
            }
            AppRadio {
                id:r3
                text:"提问"
            }
        }

        UWAppTextEdit {
            id:postEdit
            appTextEdit.placeholderText: "内容"
            textFormat: TextEdit.RichText
            width: parent.width
            height: parent.height - buttonsRow.height - titleInput.height - typerow.height
        }


        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            id: buttonsRow
            height: dp(10)

            Switch {
                //                    text: "PlainText"
                text:  checked ? "纯文本" : "富文本"
                onCheckedChanged: {
                    postEdit.textFormat = checked ? Qt.PlainText :  Qt.RichText
                }
            }

            AppButton {
                id:addPictureBtn
                text: "上传图片"
                iconType: IconType.upload
                onClicked: {
                    ss.cxid ? NativeUtils.displayImagePicker("test") : toastManager.show("请先登录！")
                    //                    NativeUtils.displayImagePicker("test")
                }
            }
            AppButton {
                id:postingBtn
                text: "发帖"
                iconType: IconType.send
                onClicked: {
                    if(!ss.cxid)
                    {
                        toastManager.show("请先登录！")
                        return
                    }
                    if(postEdit.text.trim()!=="" && titleInput.text.trim()!==""){
                        var type
                        if(r1.checked) type=0;
                        if(r2.checked) type=1;
                        if(r3.checked) type=2;
                        userLogic.submitPost(titleInput.text.trim(),postEdit.text.trim(),type)
                        //                        forumStack.pop()
                    }else{
                        toastManager.show("标题或内容不能为空",1000);
                    }
                }

            }


        }


    }
    Connections {
        target: NativeUtils
        onImagePickerFinished: (accepted, path) => {
                                   if(accepted) {
                                       toastManager.show("图片上传中！",1000);
                                       userLogic.uploadImage(path)
                                       //                                       console.log(path)
                                       //                                       console.log(FileUtils.readFileBytes())
                                       //                                       console.log(FileUtils.readFileBytes(path).byteLength)

                                       //                                       var filename = qm.uploadPicture(path)
                                       //                                       if(filename === ""){
                                       //                                           toastManager.show("图片上传失败！",1000);
                                       //                                       }else{
                                       ////                                           timer.filename = filename
                                       ////                                           timer.start()
                                       //                                           //                                         var httppath = "http://127.0.0.1/images/"+ filename
                                       //                                           //                                           var httppath = "http://192.168.1.244/images/"+ filename
                                       //                                           //                                           var ah = "<a href=\""+httppath+"\">"
                                       //                                           //                                           var ae = "</a>"
                                       //                                           //                                           var br =  "<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><br /></p>"
                                       //                                           //                                           postEdit.text += br +ah+"<img src=\""+httppath+"\" width=\""+postEdit.width +"\" />" +ae+br
                                       //                                           //                                           postEdit.appTextEdit.cursorPosition =postEdit.text.length

                                       //                                       }
                                   }
                               }
    }
    // 避免文件已到服务器程序，但还没完全存入静态资源而导致图片加载不完全？
    //不一定有用？
    Timer {
        id:timer
        property string filename
        interval: 2000
        running: false
        repeat: false
        onTriggered: addPicture(filename)

    }

    function addPicture(filename){
        var httppath = "http://192.168.1.244/images/"+filename
        var ah = "<a href=\""+httppath+"\">"
        var ae = "</a>"
        var br =  "<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><br /></p>"
        postEdit.text += br +ah+"<img src=\""+httppath+"\" width=\""+postEdit.width +"\" />" +ae+br
        postEdit.appTextEdit.cursorPosition =postEdit.text.length
    }





    Connections{
        target: userLogic
        onPostingSucceed :{
            toastManager.show("发布成功！",1000)
            popped()
        }
        onUploadPhotoSucceed: function(filename){
            addPicture(filename)
        }
    }

    onPopped: {
        destroy()
    }
}


