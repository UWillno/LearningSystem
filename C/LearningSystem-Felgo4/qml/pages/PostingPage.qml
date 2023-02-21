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
                text:"考试心得"
            }
            AppRadio {
                id:r3
                text:"提问"
            }
        }

        UWAppTextEdit {
            id:postEdit
            appTextEdit.placeholderText: "内容"
            //            height: dp(800)
            //            appTextEdit.textFormat: TextEdit.RichText
            textFormat: TextEdit.RichText
            //            placeholderText: "这里输入"
            width: parent.width
            height: parent.height - buttonsRow.height - titleInput.height - typerow.height
            //            height: parent.height - buttonsRow.height

            //            text:



        }


        Row {
            anchors.horizontalCenter: parent.horizontalCenter
            id: buttonsRow
            height: dp(10)
            AppButton {
                id:addPictureBtn
                text: "上传图片"
                onClicked: {
                    NativeUtils.displayImagePicker("test")
                }
            }
            AppButton {
                id:postingBtn
                text: "发帖"
                onClicked: {
                    if(postEdit.text.trim()!=="" && titleInput.text.trim()!==""){
                        var type
                        if(r1.checked) type=0;
                        if(r2.checked) type=1;
                        if(r3.checked) type=2;
                        userLogic.submitPost(titleInput.text.trim(),postEdit.text.trim(),type)
                        forumStatck.pop()
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
                                       toastManager.show("图片上传中！",5000);
                                       var filename = qm.uploadPicture(path)
                                       if(filename === ""){
                                         toastManager.show("图片上传失败！",1000);
                                       }else{
                                           var httppath = "http://127.0.0.1/images/"+ filename
                                           postEdit.text += "<img src=\""+httppath+"\" width=\""+postEdit.width +"\" />"
                                       }
                                   }
                               }
    }
}


