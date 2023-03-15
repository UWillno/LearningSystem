import QtQuick
import Felgo
import QtWebView
import QtQuick.Controls
//import


AppPage {

    id:xxtPage
    property alias url : webview.url
    property var ourl
    property var classId
    property var activeId
    property var courseId
    property bool canPop : false



    rightBarItem: IconButtonBarItem {
        visible: true
        iconType: IconType.refresh
        onClicked: {
            webview.reload()
        }
    }






    Rectangle {
        id:xxtRect
        //        anchors.fill: parent
        height: parent.height /2
        width: parent.width
        z:-1

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
        //        z:1
        anchors.top: xxtRect.bottom
        width:parent.width
        AppButton{
            id:signBtn
            text: "签到"
            onClicked: {
                signContextMenu.open(signBtn.x, signBtn.y + signBtn.height)

            }

        }
        AppButton{
            id:exBtn
            text: "额外"
            onClicked:{
                extraContextMenu.open(exBtn.x, exBtn.y + exBtn.height)
            }
            onPressAndHold: {
                viewSignPhotos()
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
        width: encAction.width
        parent: signBtn
        Action{
            text: "静态签到"
            onTriggered: {
                staticSign()
            }
        }
        Action{
            text: "拍照签到"

            onTriggered: {
                //                staticSign()
                displayImagePicker("photo")
            }
        }
        Action{
            text: "指定位置签到"
            onTriggered: {
                preSign()
                loSign()

            }
        }
        Action{
            text: "二维码签到-选图"
            onTriggered: {
                //                staticSign()
                displayImagePicker("qr")
            }
        }
        Action{
            id:encAction
            text: "二维码签到-手动输入enc"
            onTriggered: {
                //                staticSign()
                //                displayImagePicker("qr")
                preSign()
                NativeDialog.inputText("输入enc", "我不会帮你提取的，自己提取好，输入太慢可能签不成功?", "这里输入", "", function(ok, text) {
                    if(ok) {
                        qRSign(text.trim())
                    }
                })
            }
        }

    }

    function loSign(){

        const url0 = "https://mobilelearn.chaoxing.com/v2/apis/active/getPPTActiveInfo?activeId=" + activeId
        HttpRequest.get(url0).timeout(50000)
        .then(function(res){
            console.log(JSON.stringify(res.body))
            const data = JSON.parse(JSON.stringify(res.body))["data"]
            const locationLatitude = data["locationLatitude"]
            const locationLongitude = data["locationLongitude"]
            const locationText = data["locationText"]

            if(locationLatitude && locationLongitude && locationText){
                const signurl =   "https://mobilelearn.chaoxing.com/pptSign/stuSignajax?address=" + locationText + "&activeId=" + activeId + "&latitude="  +locationLatitude+ "&longitude=" + locationLongitude+ "&fid=0&appType=15&ifTiJiao=1";
                console.log(signurl)
                HttpRequest.get(signurl).timeout(50000)
                .then(function(res){
                    console.log(JSON.stringify(res.body))
                    if(JSON.stringify(res.body).includes("success")){
                        toastManager.show("签到成功！",1000)
                    }
                    webview.reload()
                });
            }else{
                toastManager.show("未指定位置，你可以随便签！",1000)
            }

            //            var s= {"data":{"activeSort":7,"activeType":2,"activityTranMode":1,"addToCacheTime":0,"attendNum":null,"attendPer":null,"bsid":null,"chartid":null,"chatid":null,"clazzid":72277065,"configJson":null,"content":"{\"locationRange\":\"500米\",\"locationLongitude_gd\":\"114.305529\",\"locationText\":\"中国湖北省武汉市洪山区狮子山街道杨泗港快速通道武昌首义学院学生公寓-6号楼\",\"locationLatitude\":\"30.4956\",\"locationLongitude\":\"114.312126\",\"locationLatitude_gd\":\"30.489926\",\"ifopenAddress\":1}","courseId":null,"createtime":1678548894000,"createtimeStr":"2023-03-11 23:34:54","createuid":"103750610","createuidname":null,"createxxuid":"103750610","credit":null,"currentstatus":null,"currentversion":null,"dpurl":null,"editconfig":null,"endtime":null,"endtimeStr":null,"endtimes":null,"fid":null,"grouptype":null,"id":3000059062980,"ifaveraged":null,"ifcommit":null,"ifgetrange":0,"ifopenAddress":1,"ifphoto":0,"ifrefreshewm":0,"ifsendmessage":1,"iphoneContent":null,"isanony":null,"isbackfill":null,"isbegins":0,"isclone":1,"isdelete":0,"islook":null,"ismark":null,"isnorm":null,"isold":null,"isresult":0,"jurl":null,"jwCourseId":null,"latitude":-1,"locationLatitude":"30.4956","locationLatitude_gd":"30.489926","locationLongitude":"114.312126","locationLongitude_gd":"114.305529","locationRange":"500","locationText":"中国湖北省武汉市洪山区狮子山街道杨泗港快速通道武昌首义学院学生公寓-6号楼","longitude":-1,"manual":true,"mark":null,"name":"","newOld":0,"normscore":null,"oldActiveId":null,"oldOtherId":null,"otherId":4,"pActiveId":null,"parentid":3000059062979,"pptPlanId":3000003785818,"pptnum":0,"puid":103750678,"realActiveId":null,"region":null,"releaseNum":0,"scoreWeight":0,"sfdp":null,"sffxs":null,"showOpenTimer":0,"showhide":1,"signCode":"","source":15,"starttime":1678548894700,"starttimeStr":"2023-03-11 23:34:54","starttimes":null,"status":1,"stuid":null,"sxs":null,"timeLong":-1,"title":null,"updatetime":1678549558000,"url":null,"userName":null,"userStatus":null,"viewPicPath":"https://mobilelearn.chaoxing.com/front/mobile/common/images/teachingPlan/","zhjsid":null},"errorMsg":null,"msg":"success","result":1}
        });
    }

    function qRSign(enc){
        const signurl = "https://mobilelearn.chaoxing.com/pptSign/stuSignajax?enc="+enc+"&name="+encodeURI(ss.username)+"&activeId="+activeId+"&uid="+ss.cxid+"&clientip=&useragent=&latitude=-1&longitude=-1&fid=$fid&appType=15"
        HttpRequest.get(signurl).timeout(50000)
        .then(function(res){
            console.log(JSON.stringify(res.body))
            if(JSON.stringify(res.body).includes("success")){
                toastManager.show("签到成功！",1000)
            }
            webview.reload()
        });
    }

    function photoSign(accepted, path){
        if(accepted){
            preSign()
            qm.uploadPhotoToXxt(path)
        }
        NativeUtils.imagePickerFinished.disconnect(photoSign)
    }
    function qrSign(accepted, path){
        console.log(accepted)
        console.log(path)
        if(accepted){
            preSign()
            qm.uploadQrPhoto(path)
        }
        NativeUtils.imagePickerFinished.disconnect(qrSign)
    }

    function displayImagePicker(tag) {
        //         ...
        if(tag === "photo"){
            NativeUtils.imagePickerFinished.connect(photoSign)
            NativeUtils.displayImagePicker("photoSelect")

        }
        if(tag === "qr"){

            NativeUtils.imagePickerFinished.connect(qrSign)
            NativeUtils.displayImagePicker("photoSelect")
        }
    }
    Menu {
        id: extraContextMenu
        width: signBtn.width
        parent: exBtn
        Action{
            text: "查看测验答案"
            onTriggered: {
                getExercisesAnswers()
                toastManager.show("页面加载中",4000)
            }
        }
        Action{
            text: "课程作业统计"
            onTriggered: {
                workStastics()
                toastManager.show("页面加载中",2000)
            }
        }
        Action{
            text: "课程积分统计"
            onTriggered: {
                intergralStatistics()
                toastManager.show("页面加载中",2000)
            }
        }
        Action{
            text: "签到照片查看"
            onTriggered: {
                toastManager.show("??????",1000)
            }
        }

    }


    function workStastics(){
        const url = "https://stat2-ans.chaoxing.com/work-stastics/student-works?clazzid="+classId+"&courseid="+courseId+"&page=1&pageSize=200"
        const xhr = new XMLHttpRequest()
        xhr.open("GET",url,true);
        xhr.setRequestHeader("Cookie",ss.cookie)
        xhr.send(null)
        xhr.onload = function (e) {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    //                    console.log()
                    const p =  Qt.createComponent("XxtWorkStastics.qml").createObject(parent,{body:JSON.parse(xhr.responseText)});
                    studyStack.push(p)
                }
            }
        };




    }

    function intergralStatistics(){
        const url ="https://mobilelearn.chaoxing.com/v2/apis/integral/getIntegralList?DB_STRATEGY=COURSEID&STRATEGY_PARA=courseId&pageSize=200&page=1&classId="+classId+"&courseId="+courseId
        const xhr = new XMLHttpRequest()
        xhr.open("GET",url,true);
        xhr.setRequestHeader("Cookie",ss.cookie)
        xhr.send(null)
        xhr.onload = function (e) {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    //                    console.log()
                    const p =  Qt.createComponent("XxtIntegralStatisticsPage.qml").createObject(parent,{body:JSON.parse(xhr.responseText)});
                    studyStack.push(p)
                }
            }
        };
    }




    function getExercisesAnswers(){
        console.log("wudka")
        const url ="https://mobilelearn.chaoxing.com/v2/apis/quiz/getStatisticsData?activeId="+activeId
        //        HttpRequest.get(url).timeout(50000).then(function(res){
        //            console.log(JSON.stringify(res.body()))

        //            //            var p =  Qt.createComponent("XxtEAPage.qml").createObject(parent,{data:});
        //            //            studyStack.push(p)
        //        }
        //        ).catch(function(err) {
        //            console.log(err.code)
        //          })
        const xhr = new XMLHttpRequest()
        xhr.open("GET",url,true);
        xhr.setRequestHeader("Cookie",ss.cookie)
        xhr.send(null)
        xhr.onload = function (e) {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    //                    console.log()
                    const p =  Qt.createComponent("XxtEAPage.qml").createObject(parent,{body:JSON.parse(xhr.responseText)});
                    studyStack.push(p)
                }
            }
        };


    }

    function httprequestGetCookie(){
        HttpRequest.get("https://passport2-api.chaoxing.com/v11/loginregister?cx_xxt_passport=json&uname="+ss.phone+"&code="+ss.password).timeout(50000)
        .then(function(res){
            if(JSON.parse(res.body)["status"] === true){
                console.log("登录成功！")
                ss.cookie = HttpRequest.cookie
            }
        }
        )
    }
    Connections{
        target: qm
        onUploadXxtSucceed:objectId=>{
                               console.log('objectId'+objectId)
                               console.log('activeId' + activeId)
                               const url = "https://mobilelearn.chaoxing.com/pptSign/stuSignajax?activeId="+activeId+"&objectId="+objectId
                               console.log(url)
                               HttpRequest.get(url).timeout(50000)
                               .then(function(res){
                                   console.log(JSON.stringify(res.body))
                                   if(JSON.stringify(res.body).includes("success")){
                                       toastManager.show("签到成功！",1000)
                                   }
                                   webview.reload()
                               });
                           }

        onDecodeFailed:{
            toastManager.show("解码失败！",1000)
        }
        onDecodeSucceed:url => {
                            console.log(url)
                            var enc  =  /enc=(.*?)&/.exec(url)[1]
                            qRSign(enc)
                        }
    }

    function preSign(){
        const url ="https://mobilelearn.chaoxing.com/newsign/preSign?courseId="+courseId+"&classId="+classId+"&activePrimaryId="+activeId+"&general=1&sys=1&ls=1&appType=15&&tid=&uid="+ss.cxid+"&ut=s"
        HttpRequest.get(url).timeout(50000)
        .then(function(res){
            console.log(JSON.stringify(res.body))
            //            webview.reload()
        });
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
            if(JSON.stringify(res.body).includes("success")){
                toastManager.show("签到成功！",1000)
            }
            webview.reload()
        });

    }
    function getCookies(){
        console.log(HttpRequest.cookie)
    }

    Component.onCompleted:{
        navMode = 4
        if(String(url).includes("chaoxing")){
            httprequestGetCookie()
            //            httprequestGetCookie()
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
        event.accepted = canPop
        if(!canPop){
            NativeDialog.confirm("确认", "确定退出?", function(ok) {
                if(ok){
                    canPop = ok
                    popped()
                }
            })}
    }

    onPopped: {
        navMode = 3
        destroy()
    }


}
