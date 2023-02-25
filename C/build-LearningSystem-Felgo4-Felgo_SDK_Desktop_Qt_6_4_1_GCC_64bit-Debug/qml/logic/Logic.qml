import QtQuick
import Felgo

Item {
    //    property var data
    property string qhttpserver: "http://127.0.0.1:4444/"
    id: item
    property var postsdata
    signal postsGot()
    function getQuestion(){
        HttpRequest.get("http://192.168.1.12/currentQuestions.json").timeout(50000).then(function(res){
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


}
