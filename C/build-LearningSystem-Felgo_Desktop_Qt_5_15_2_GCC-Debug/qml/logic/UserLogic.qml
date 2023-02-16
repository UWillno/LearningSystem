import QtQuick 2.0
import Felgo 3.0

Item {

    id: item

    signal loginSucceed;
    signal loginFailed;
    //    property var chaoxingLogin: value

    property string infoApi : "http://passport2.chaoxing.com/mooc/accountManage"
    property string photoapi: "http://photo.chaoxing.com/p/239158049_80"

    function login(){
        HttpRequest.get("https://passport2-api.chaoxing.com/v11/loginregister?cx_xxt_passport=json&uname=17671056113&code=zhj775825").timeout(50000)
        .then(function(res){
            //            console.log(res.body)
            if(JSON.parse(res.body)["status"] === true){
                //                console.log()
                //                console.log(HttpRequest.cookie)
                console.log("登录成功！")
                getUserInfo()
            }else{
                console.log("登录失败或接口失效")
            }

        });
    }


    function getUserInfo(){
        console.log(HttpRequest.cookie)
        HttpRequest.get("https://passport2.chaoxing.com/mooc/accountManage").timeout(50000).then(function(res){
            //            console.log(HttpRequest.cookie)
//            var parser = new DOMParser();
            console.log(typeof(res.body))

        })
    }


}
