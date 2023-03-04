import QtQuick
import Felgo

Item {
    //    property var data
//    property string qhttpserver: "http://127.0.0.1:4444/"
    property string qhttpserver: "http://192.168.1.244:4444/"
    id: item
    property var postsdata
    signal postsGot()
    function getQuestion(){
        HttpRequest.get("http://192.168.1.244/currentQuestions.json").timeout(50000).then(function(res){
            console.log(res.body)
        });
    }


    function getAllPosts(){
        //        var p = HttpRequest.get(qhttpserver + "selectAllPosts").timeout(5000).then(function(res){
        //            JSON.stringify(res.body)
        //            postsdata = res.body
        //            postsGot()
        //        });

        const xhr = new XMLHttpRequest();
        xhr.open("GET",qhttpserver + "selectAllPosts",false);  //建立连接，要求同步响应
        xhr.send(null)
        //        console.log(req.statusText)
        //        console.log(req.responseText)

        return JSON.parse(xhr.responseText)
    }

    function getPosts(page){
        const xhr = new XMLHttpRequest();
        xhr.open("GET",qhttpserver + "getPosts/"+page,false);
        xhr.send(null)
        return JSON.parse(xhr.responseText)
    }

    function submitComment(postId,text){

        if(typeof ss.cxid == "undefined"){
            toastManager.show("未登录!",1000);
        }else{
            const xhr = new XMLHttpRequest();
            xhr.open("POST",qhttpserver + "submitComment",false);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
            xhr.send(JSON.stringify({cxid:ss.cxid,username:ss.username,postId:postId,text:text}))
            if(xhr.responseText == "success"){
                return true
            }
        }
        return false
    }

    function getComments(postId,page){
        const xhr = new XMLHttpRequest();
        xhr.open("GET",qhttpserver + "getComments/"+postId+"/"+page,false);
        xhr.send(null)
        return JSON.parse(xhr.responseText)
    }
    function getAllResources(){
        //        var p = HttpRequest.get(qhttpserver + "selectAllPosts").timeout(5000).then(function(res){
        //            JSON.stringify(res.body)
        //            postsdata = res.body
        //            postsGot()
        //        });

        const xhr = new XMLHttpRequest();
        xhr.open("GET",qhttpserver + "selectAllResources",false);  //建立连接，要求同步响应
        xhr.send(null)
        //        console.log(req.statusText)
        //        console.log(req.responseText)

        return JSON.parse(xhr.responseText)
    }



}
