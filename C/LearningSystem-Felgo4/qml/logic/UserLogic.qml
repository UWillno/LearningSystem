import QtQuick
import Felgo


Item {

    id: logic
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

    signal getResourcesSucceed(var json,int type)
    signal getQuestionsDBSucceed(var questionsDB)
    //17671056113


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
            isNewUser(ss.cxid)
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
        qm.submitPost(title,text,ss.cxid,ss.username,type)
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
}
