import QtQuick
import Felgo
import "../pages"
import  "./toast"
//import "./loader"
import QtQuick.Controls
Rectangle {
    id: root
    anchors.horizontalCenter: parent.horizontalCenter
    //    color: "#FFFFF5"
    implicitWidth: parent.width - dp(20)
    implicitHeight: roundedImage.height + dp(20)
    radius: dp(20)
    //    anchors.verticalCenter: parent
    property string dialogtitle: "学习通登陆"
    property string currentstatus: "游客模式"
    property int administrator: 0
    property int chaoxingUser: 1
    property int  times: 0

    Row {
        spacing: dp(5)
        //        anchors.horizontalCenter: parent.horizontalCenter
        anchors.centerIn: parent
        RoundedImage {
            id: roundedImage
            //            width: root.width - simpleInfo.width - dp(5)
            width: dp(100)
            height: width

            fillMode: Image.PreserveAspectCrop
            anchors.verticalCenter: parent.verticalCenter
            source: userImageResource.available ? userImageResource.storagePath :"http://q1.qlogo.cn/g?b=qq&nk=44910244&s=640"
            radius: width/2



            MouseArea {
                anchors.fill:parent
                onClicked:{
                    console.log("clicked!!")
                    dialogtitle = "用户登陆"
                    loginDialog.open()

                    //测试用
                    //                    loaderItem.show();
                    //                     adminLogic.loading(rootStack)
                    //                    toastManager.show("登陆成功!",1000)

                    //                    loginDialog.open()
                    //                    rootStack.push(adminComponent)
                    //                    rootStack.popAllExceptFirstAndPush(adminComponent)
                }
                onPressAndHold: {
                    console.log("hold")
                    var adminComponent = Qt.createComponent("../pages/AdministratorPage.qml").createObject()
                    rootStack.push(adminComponent)
                    //                    dialogtitle = "管理员登陆"

                    //                    loginDialog.open()
                }

            }

        }
        Column {
            id: simpleInfo
            //            anchors.centerIn: parent
            //            spacing: dp(5)
            AppText {
                id: currentStatus
                width: dp(200)
                //                fontSize: 14
                text: "当前状态:" + currentstatus
            }

            //            Rectangle {
            //                id: userDetail
            //                visible: false
            //            Column {
            AppText {
                visible: false
                id: nameText
                width: dp(200)
                //                fontSize: 14
                text: "昵称:" + ss.username
            }
            AppText {
                id: cxidText
                width: dp(200)
                //                fontSize: 14
                text: "ID:" + ss.cxid
                visible: false
            }
            AppText {
                id: phoneText
                width: dp(200)
                //                fontSize: 14
                text: "当前账号:" + ss.phone
                visible: false
            }
            //                }
            //            }
            //            Loader {}
        }
    }

    DownloadableResource {
        id: userImageResource
        headerParameters: ({
                               "User-Agent": "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36 Edg/109.0.1518.52",
                               "content-type":"application/x-www-form-urlencoded"
                           })
        extractAsPackage: false
        source:  ss.cxid ? "http://photo.chaoxing.com/p/"+ss.cxid+"_80" : "http://photo.chaoxing.com/photo_80.jpg"


        Component.onCompleted: {
            //            if(ss.cxid){
            //                source = "http://photo.chaoxing.com/p/"+ss.cxid+"_80";
            //            }else {
            //                source = "http://photo.chaoxing.com/photo_80.jpg";
            //            }

            console.log(source)
            download()
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
            //            console.log(usernameInput.text.trim()+"#"+passwordInput.text.trim())
            if(title ===  "管理员登陆"){
                qm.tologin(usernameInput.text.trim(),passwordInput.text.trim(),administrator)
                close()
            }
            else{
                userLogic.login(usernameInput.text.trim(),passwordInput.text.trim())
                close()
                //                HttpRequest.get("")
                //                userLogic.login(usernameInput.text.trim(),passwordInput.text.trim())
                //测试用
                //                if(userLogic.login()){
                //                    toastManager.show("登录成功!",1000)
                //                }else{
                //                    toastManager.show("登录失败!",1000)
                //                }

                //                console.log("userlogin here")
            }
        }


        Column {
            id: column
            anchors.centerIn: parent
            spacing: dp(10)
            AppTextInput {
                id: usernameInput
                width: dp(200)
                placeholderText: "账号"
                //                width: parent.width
            }

            AppTextInput {
                id: passwordInput
                width: dp(200)
                placeholderText: "密码"
                echoMode: AppTextInput.Password
                //                width: parent.width
            }
        }
        //        state:
    }


    Connections {
        target: qm
        onLoginSucceeded:{
            console.log("登陆成功！！")
            toastManager.show("登录成功！",1000)
            var adminComponent = Qt.createComponent("../pages/AdministratorPage.qml").createObject()
            if(dialogtitle === "管理员登陆"){
                rootStack.push(adminComponent)
            }

        }
        onLoginFailed:{
            console.log("登陆失败！！")
            toastManager.show("登录失败！",1000)
        }
    }

    Connections {
        target: userLogic
        onUserLoginSucceed: {
            currentstatus = "超星模式"
            toastManager.show("登录成功！",1000)
            cxidText.visible = true
            nameText.visible = true
            phoneText.visible = true

        }
        onNewUserLogined: {
            console.log("创建用户目录")
            qm.createNewUser(ss.username,ss.cxid)
        }

    }



    Component.onCompleted: {
                console.log("asdasdasd")
        if(ss.phone && ss.password ){
            //            userLogic.login(ss.phone,ss.password)
//            userLogic.userLoginSucceed()
            currentstatus = "超星模式"
            console.log(ss.cxid)
            cxidText.visible = true
            nameText.visible = true
            phoneText.visible = true
        }
    }



}


