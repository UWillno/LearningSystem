import QtQuick
import Felgo

Item {
    //    property var data
    //    property string qhttpserver: "http://127.0.0.1:4444/"
    property string qhttpserver: "http://192.168.1.244:4444/"
    id: item
    property var postsdata
    signal postsGot()
    signal chatReply(var text)
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

    function toChatGPT(text){
        //        {
        //             "model": "gpt-3.5-turbo",
        //             "messages": [{"role": "user", "content": "Say this is a test!"}],
        //             "temperature": 0.7
        //           }
        //        console.log({ model: settings.model, messages: [{role: "user", content: text}],temperature:0.7})
        //        console.log(JSON.stringify({ model: settings.model, messages: [{role: "user", content: text}],temperature:0.7}))
        HttpRequest
        .post("https://api.openai.com/v1/chat/completions")
        .set('Content-Type', 'application/json')
        .set('Authorization','Bearer '+settings.key)
        .send({ model: settings.model, messages: [{role: "user", content: text}],temperature:0.7})
        .then(function(res) {
            console.log(res.status);
//            console.log(JSON.stringify(res.body));
            var data = res.body
            console.log(data.choices[0].message.content)
            chatReply(data.choices[0].message.content)
        })
        .catch(function(err) {
            console.log(err.code)
             chatReply("error")
        });
//        {"choices":[{"finish_reason":"stop","index":0,"message":{"content":"作为AI语言模型，我无法直接接收消息。但是，API测试通常会返回响应消息，包括请求是否成功、响应的状态码、响应的数据等。测试人员可以通过查看响应消息来判断API是否正常工作，从而进行测试和调试。","role":"assistant"}}],"created":1681458887,"id":"chatcmpl-758YZY6GQUtA0pUDKSQKRwrUQjNB6","model":"gpt-3.5-turbo-0301","object":"chat.completion","usage":{"completion_tokens":81,"prompt_tokens":17,"total_tokens":98}}
        ////       const xhr = new  XMLHttpRequest()
//        var body = {"choices":[{"finish_reason":"stop","index":0,"message":{"content":"作为AI语言模型，我无法直接接收消息。但是，API测试通常会返回响应消息，包括请求是否成功、响应的状态码、响应的数据等。测试人员可以通过查看响应消息来判断API是否正常工作，从而进行测试和调试。","role":"assistant"}}],"created":1681458887,"id":"chatcmpl-758YZY6GQUtA0pUDKSQKRwrUQjNB6","model":"gpt-3.5-turbo-0301","object":"chat.completion","usage":{"completion_tokens":81,"prompt_tokens":17,"total_tokens":98}}
//        console.log(body.choices[0].message.content)
    }


}
