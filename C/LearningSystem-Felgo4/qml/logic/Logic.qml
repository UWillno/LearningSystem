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

    function submitComment(postId,text,replyId=0,atUsername=""){

        if(!ss.cxid){
            toastManager.show("未登录!",1000);
        }else{
            const xhr = new XMLHttpRequest();
            xhr.open("POST",qhttpserver + "submitComment",false);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
            if(atUsername==="")
                xhr.send(JSON.stringify({cxid:ss.cxid,username:ss.username,postId:postId,text:text,replyId:replyId}))
            else{
                xhr.send(JSON.stringify({cxid:ss.cxid,username:ss.username + "\t<font color='green'>@\t"+atUsername+"</font>",postId:postId,text:text,replyId:replyId}))
            }

            if(xhr.responseText == "success"){
                return true
            }
        }
        return false
    }

    function getCommentsA2(page){
        const xhr = new XMLHttpRequest();
        xhr.open("GET",qhttpserver + "getComments/"+page,false);
        xhr.send(null)
        console.log("getComments:"+JSON.stringify(xhr.responseText))
        return JSON.parse(xhr.responseText)
    }

    function getComments(postId,page){
        const xhr = new XMLHttpRequest();
        xhr.open("GET",qhttpserver + "getComments/"+postId+"/"+page,false);
        xhr.send(null)
        console.log("getComments:"+JSON.stringify(xhr.responseText))
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

    function toJson(object){
        return JSON.parse(JSON.stringify(object))
    }

    function getDate(){
        var d = new Date(); //获取系统当前时间
        var year = d.getFullYear(); //获取年份
        var month = d.getMonth() + 1; //获取月份，注意要加1
        var date = d.getDate(); //获取日期
        var hour = d.getHours(); //获取小时
        var minute = d.getMinutes(); //获取分钟
        var second = d.getSeconds(); //获取秒
        //如果月份、日期、小时、分钟、秒小于10，就在前面加0
        if (month < 10) {
            month = "0" + month;
        }
        if (date < 10) {
            date = "0" + date;
        }
        if (hour < 10) {
            hour = "0" + hour;
        }
        if (minute < 10) {
            minute = "0" + minute;
        }
        if (second < 10) {
            second = "0" + second;
        }
        return year + "-" + month + "-" + date + " " + hour + ":" + minute + ":" + second
    }


}
