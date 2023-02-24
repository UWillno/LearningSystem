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
        var p = HttpRequest.get(qhttpserver + "selectAllPosts").timeout(5000).then(function(res){
            JSON.stringify(res.body)
            postsdata = res.body
            postsGot()
        });
    }


}
