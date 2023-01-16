import QtQuick 2.0
import Felgo 3.0


Item {
    id: root
//    anchors.verticalCenter: parent
    property  string dialogtitle: "学习通登陆"
    property string currentstatus: "游客模式"
//    HttpNetworkActivityIndicator
    Row {

        RoundedImage {
            id: roundedImage
            width: dp(100)
            height: dp(100)
            fillMode: Image.PreserveAspectCrop
            source: "http://q1.qlogo.cn/g?b=qq&nk=44910244&s=640"
            radius: width/2



            MouseArea {
                anchors.fill:parent
                onClicked:{
                    console.log("clicked!!")
                    dialogtitle = "学习通登陆"
                    loginDialog.open()

                }
                onPressAndHold: {
                    console.log("hold")
                    dialogtitle = "管理员登陆"
                    loginDialog.open()
                }

            }

        }
        Column {
            AppText {
                id: currentStatus
                width: 200
//                fontSize: 14
                text: "当前状态：" + currentstatus
            }
        }
    }
    Dialog {
        id: loginDialog
        title:dialogtitle
        positiveActionLabel: "登陆"
        negativeActionLabel: "返回"
        onClosed: {
            usernameInput.text=""
            passwordInput.text=""
        }
        onCanceled: {
            close()
        }

        onAccepted: {
            console.log(usernameInput.text.trim()+"#"+passwordInput.text.trim())
            close()
        }

        Column {
            id: column
            anchors.centerIn: parent
            spacing: dp(10)
            AppTextInput {
                id: usernameInput
                width: dp(200)
                placeholderText: "用户名"
                //                width: parent.width
            }

            AppTextInput {
                id: passwordInput
                width: dp(200)
                placeholderText: "密码"
                //                width: parent.width
            }
        }
        //        state:
    }






}

