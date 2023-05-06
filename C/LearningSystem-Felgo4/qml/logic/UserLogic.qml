import QtQuick
import Felgo


Item {

    id: userLogic
    //    property string httpserver: "http://192.168.1.12/"
    //    http://192.168.1.12/
    //    property string localhost : "http://127.0.0.1/"
    property string qhttpserver: "http://192.168.1.244:4444/"
    property string localhost : "http://192.168.1.244/"
    //    property var chaoxingLogin: value

    //    property string infoApi : "http://passport2.chaoxing.com/mooc/accountManage"
    //    property string photoapi: "http://photo.chaoxing.com/p/239158049_80"

    signal userLoginSucceed()
    signal newUserLogined()
    signal postingSucceed()
    signal logoutSucceed()

    signal oldUserLogined()

    signal getResourcesSucceed(var json,int type)
    signal getQuestionsDBSucceed(var questionsDB)
    //17671056113
    signal uploadPhotoSucceed(var filename)

    //    signal

    function login(phone,password){
        HttpRequest.get("https://passport2-api.chaoxing.com/v11/loginregister?cx_xxt_passport=json&uname="+phone+"&code="+password).timeout(50000)
        .then(function(res){
            //            console.log(res.body)
            if(JSON.parse(res.body)["status"] === true){
                //                console.log()
                //                console.log(HttpRequest.cookie)
                console.log("登录成功！")
                ss.phone = phone
                ss.password = password
                getUserInfo()

            }else{
                toastManager.show("账号或密码错误？？",1000)
                console.log("登录失败或接口失效")
                //                return false
            }

        });
    }

    function getUserInfo(){
        //        console.log(HttpRequest.cookie)
        HttpRequest.get("https://sso.chaoxing.com/apis/login/userLogin4Uname.do").timeout(5000000).then(function(res){
            //            console.log(HttpRequest.cookie)
            //            var parser = new DOMParser();
            //            console.log(typeof(res.body))
            //            console.log(res.body)
            //            if(res.status === 200)
            ss.cookie = HttpRequest.cookie
            console.log(res.status)
            var html = res.body
            var namereg = /\"name\":\"(.*)\",\"f/

            console.log(namereg.exec(html)[1])
            ss.username = namereg.exec(html)[1]
            var cxidreg = /\"cxid\":(\d+),\"s/
            console.log(cxidreg.exec(html)[1])
            //            cxid = cxidreg.exec(html)[1]
            ss.cxid = cxidreg.exec(html)[1]
            //            toastManager.show("登录成功！",1000)
            //            isNewUser(ss.cxid)
            userExists(ss.cxid)

            ss.save()
            userLoginSucceed()
            //            return true

        }).catch(function(err){
            console.log(err.message)
            console.log(err.response)
            //            return false
        })
        //        return false
    }

    function userExists(cxid){
        const xhr = new XMLHttpRequest()
        xhr.open("GET",qhttpserver + "userExists/"+cxid,true);
        xhr.send(null)
        xhr.onload = function (e) {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    if(xhr.responseText === "new"){
                        createUser()
                    }else{
                        oldUserLogined()
                    }
                } else {
                    console.error(xhr.statusText);
                }
            }
        };
    }

    function createUser(){
        const xhr = new XMLHttpRequest()
        xhr.open("POST",qhttpserver + "createUser",true);
        xhr.send(JSON.stringify({cxid:ss.cxid,username:ss.username}))
        xhr.onload = function (e) {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    if(xhr.responseText === "success")
                        toastManager.show("创建用户成功！",1000)
                    else{
                        toastManager.show("创建用户失败！",1000)
                    }
                } else {
                    console.error(xhr.statusText);
                }
            }
        };
    }

    //弃用
    function isNewUser(cxid){
        HttpRequest.get(localhost+cxid+"/info.json").timeout(50000).then(function(res){
            console.log("老用户")

        }).catch(function(err) {
            console.log(err)
            console.log("新用户!")
            newUserLogined()
        });;
    }

    function submitPost(title,text,type){
        //        qm.submitPost(title,text,ss.cxid,ss.username,type)
        //改为HTTP
        const xhr = new XMLHttpRequest()
        xhr.open("POST",qhttpserver + "submitPost",true);
        xhr.send(JSON.stringify({title:title,text:text,cxid:ss.cxid,username:ss.username,type:type}))
        xhr.onload = function (e) {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    //                    console.log(xhr.responseText);
                    //                   console.log(xhr.responseText)
                    postingSucceed()
                } else {
                    console.error(xhr.statusText);
                }
            }
        };
    }

    function getResourcesByType(type){

        const xhr = new XMLHttpRequest()
        xhr.open("GET",qhttpserver + "getResourcesByType/"+type,true);
        xhr.send(null)
        xhr.onload = function (e) {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    //                    console.log(xhr.responseText);
                    getResourcesSucceed(JSON.parse(xhr.responseText),type)
                } else {
                    console.error(xhr.statusText);
                }
            }
        };
    }

    function getQuestionsDB(){
        const xhr = new XMLHttpRequest()
        xhr.open("GET",localhost + "currentQuestions.json",true);
        xhr.send(null)
        xhr.onload = function (e) {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    //                    console.log(xhr.responseText);
                    getQuestionsDBSucceed(JSON.parse(xhr.responseText))
                } else {
                    console.error(xhr.statusText);
                }
            }
        };

    }
    function isWrong(id,type){
        return ss.isWrong(id,type)
    }
    function isRight(id,type){
        return ss.isRight(id,type)
    }

    function addWQ(id,type){
        ss.insertW(id,type)
    }

    function addRQ(id,type){
        ss.insertR(id,type)
    }

    function removeW(id,type){
        return ss.removeW(id,type)
        //        console.log(ss.removeW(id,type))
        //        return
    }

    function randomNum(min, max) {
        return Math.floor(Math.random() * (max - min + 1) + min);
    }

    // 定义一个函数，用于产生不重复随机数
    function getUniqueRandomNum(min, max, count) {
        var arr = []; // 定义一个数组，用于存储随机数
        for (var i = 0; i < count; i++) { // 循环产生count个随机数
            arr[i] = randomNum(min, max); // 调用上面的函数，生成一个范围内的随机数
            for (var j = 0; j < i; j++) { // 遍历数组，检查是否有重复的元素
                if (arr[i] === arr[j]) { // 如果有重复，则重新产生一个随机数
                    i--;
                    break;
                }
            }
        }
        return arr;
    }

    function uploadUserData(){
        if(ss.cxid){

            const xhr = new XMLHttpRequest()
            xhr.open("POST",qhttpserver + "uploadUserData",true);
            xhr.send(JSON.stringify({cxid:ss.cxid,questions:settings.questions,exams:settings.exams}))
            xhr.onload = function (e) {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        if(xhr.responseText === "success"){
                            toastManager.show("数据上传成功！",1000);
                            settings.syncTime = logic.getDate()
                        }
                    } else {
                        console.error(xhr.statusText);
                    }
                }
            };
        }

    }

    function logout(){
        ss.clear()
        //        settings.clear()
    }

    function downloadUserData(){
        if(ss.cxid){
            const xhr = new XMLHttpRequest()
            xhr.open("POST",qhttpserver + "userData/"+ss.cxid,true);
            xhr.send(null)
            xhr.onload = function (e) {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        console.log(xhr.responseText)
                        const data = JSON.parse(xhr.responseText)
                        settings.exams = data["exams"]
                        settings.questions = data["questions"]
                        ss.wrongCQ = data["questions"]["wrongCQ"]
                        ss.wrongFQ = data["questions"]["wrongFQ"]
                        ss.wrongTQ = data["questions"]["wrongTQ"]
                        ss.rightCQ = data["questions"]["rightCQ"]
                        ss.rightTQ = data["questions"]["rightTQ"]
                        ss.rightFQ = data["questions"]["rightFQ"]
                        toastManager.show("下载完成！",1000)
                        settings.syncTime = logic.getDate()
                    } else {
                        console.error(xhr.statusText);
                    }
                }
            };
        }

    }




    //    function addWQ(id,type){
    //        switch(type){
    //        case 0:{
    //            if(wCQ.indexOf(id)!==-1){
    //                wCQ.push(id)
    //            }
    //            break;
    //        }
    //        case 1:{
    //            if(wTQ.indexOf(id)!==-1){
    //                wTQ.push(id)
    //            }
    //            break;
    //        }
    //        case 2:{
    //            if(wFQ.indexOf(id)!==-1){
    //                wFQ.push(id)
    //            }
    //            break;
    //        }
    //        }
    //    }

    //    function addRQ(id,type){
    //        switch(type){
    //        case 0:{
    //            if(rCQ.indexOf(id)!==-1){
    //                rCQ.push(id)
    //            }
    //            break;
    //        }
    //        case 1:{
    //            if(rTQ.indexOf(id)!==-1){
    //                rTQ.push(id)
    //            }
    //            break;
    //        }
    //        case 2:{
    //            if(rFQ.indexOf(id)!==-1){
    //                rFQ.push(id)
    //            }
    //            break;
    //        }
    //        }
    //    }
    function uploadImage(path){
        //        console.log(path.split('.').pop())
        //        console.log()
        const xhr = new XMLHttpRequest()
        const hz = path.split('.').pop()
        xhr.open("POST",qhttpserver + "userUploadImage",true);
        xhr.setRequestHeader("Hz",hz)
        xhr.send(FileUtils.readFileBytes(path))
        xhr.onload = function (e) {
            if(xhr.responseText!="error"){
                uploadPhotoSucceed(xhr.responseText)
            }
        };
    }

}
