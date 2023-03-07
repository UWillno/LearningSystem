import QtQuick
import Felgo
import QtWebView
import QtQuick.Controls


AppPage {

    property alias url : webview.url
    property var ourl
    property var classId
    property var activeId
    property var courseId



    rightBarItem: IconButtonBarItem {
        visible: true
        iconType: IconType.refresh
        onClicked: {
            webview.reload()
        }
    }

    AppFlickable {
        anchors.fill: parent

        WebView {
            id:webview
            anchors.fill: parent

            onLoadingChanged: {
                console.log(url)
                if(String(url).includes("activeId=")){
                    activeId = /activeId=(\d+)/.exec(url)[1]
                }
                if(String(url).includes("courseId=")){
                    courseId = /courseId=(\d+)/.exec(url)[1]
                }
                if(String(url).includes("classId=")){
                    classId = /classId=(\d+)/.exec(url)[1]
                }
            }
        }
    }

    Row {
        anchors.bottom: parent.bottom
        width:parent.width
        AppButton{
            id:signBtn
            text: "签到"
            onClicked: {
                signContextMenu.popup()

            }
        }
        AppButton{
            text: "额外"
            onClicked:{
                extraContextMenu.popup()
            }
        }

        AppButton{
            text: "返回"
            onClicked: {
                if(webview.canGoBack)
                {
                    webview.goBack()
                }
            }
        }
    }
    Menu {
        id: signContextMenu
        width: signBtn.width
        Action{
            text: "静态签到"
            onTriggered: {
                staticSign()
            }
        }
        Action{
            text: "拍照签到"
        }
        Action{
            text: "指定位置签到"
        }
        Action{
            text: "二维码签到"
        }

    }

    Menu {
        id: extraContextMenu
        width: signBtn.width
        Action{
            text: "查看测验答案"
        }
        Action{
            text: "课程作业统计"
        }
        Action{
            text: "课程积分统计"
        }
        Action{
            text: "签到照片查看"
            onTriggered: {
                viewSignPhotos()
            }
        }

    }

    function viewSignPhotos(){
        //        https://mobilelearn.chaoxing.com/widget/sign/pcTeaSignController/getAttendList?activeId=$activeId&appType=15&classId=$classId
        const url = "https://mobilelearn.chaoxing.com/widget/sign/pcTeaSignController/getAttendList?activeId="+activeId+"&appType=15&classId="+classId
        HttpRequest.get(url).timeout(50000)
        .then(function(res){
            //            console.log(JSON.stringify(res.body))
            const body = res.body
            //            console.log(JSON.stringify(body))
            //            console.log(body["data"]["yiqian"])
            //            console.log(body["data"]["yiqianList"])
            if(body["data"]["yiqian"] > 0){
                const p = Qt.createComponent("PhotoListPage.qml").createObject(parent,{data:body["data"]["yiqianList"]})
                //            var md5Array = []
                //            for(var i = 0;i<body["data"]["yiqian"];i++){
                //                md5Array.push(body["data"]["yiqianList"][i]["title"])
                //            }
                //            console.log(md5Array)
                studyStack.push(p)
            }

        });
    }

    function staticSign(){
        const url = "https://mobilelearn.chaoxing.com/v2/apis/sign/signIn?activeId="+activeId
        HttpRequest.get(url).timeout(50000)
        .then(function(res){
            console.log(JSON.stringify(res.body))
            webview.reload()
        });

    }
    function getCookies(){
        console.log(HttpRequest.cookie)
    }

    Component.onCompleted:{
        navMode = 4
        if(String(url).includes("chaoxing")){
            ourl = url
            url = "https://passport2-api.chaoxing.com/v11/loginregister?cx_xxt_passport=json&uname="+ss.phone+"&code="+ss.password
            timer.start()
        }
    }


    Timer {
        id: timer
        interval: 1000 // 設置跳轉間隔為5秒
        repeat: false // 設置重複執行
        //        running: true // 設置自動運行
        onTriggered: {
            toastManager.show("获取cookie中",1000)
            url = ourl
        }
    }
    onWillPop: {
        NativeDialog.confirm("确认", "确定退出?", function(ok) {
            event.accepted = ok
        })
    }

    onPopped: {
        navMode = 3
        destroy()
    }


}
