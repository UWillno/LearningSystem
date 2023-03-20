import QtQuick
import Felgo
//import "../items/loaders/LoaderDialog.qml"
Item {
    //    property string qhttpserver: "http://127.0.0.1:4444/"
    property string qhttpserver: "http://192.168.1.244:4444/"
    // 删帖
    signal deleteSucceed(int index)
    // 删评
    signal deleteCSucceed(int index)
    //删多级评论
    signal deleteCCsucceed(int index)

    //    property var postsdata
    id: adminLogic
    function insertChoiceQuestion(question,option1, option2,option3,option4,answer){
        qm.sendChoiceQuestion(question,option1, option2,option3,option4,answer)
    }
    //填转JSON字符串
    function blanksToAnswer(blanksObj){
        var temp = new Array
        blanksObj.forEach(function(obj){
            temp.push(obj.text.trim())
        })
        //        console.log(temp)
        //        console.log(JSON.stringify(temp))
        return JSON.stringify(temp)
    }
    //    function insertChoiceQuestion(question,answer){
    //        qm.sendChoiceQuestion(question,answer)
    //    }
    function insertFillInTheBlanksQuestion(question,answer){
        qm.sendFillInTheBlanksQuestion(question,answer)
    }
    function loading(p){
        var component = Qt.createComponent("../items/loader/Loader.qml");
        var obj = component.createObject(p,{"anchors.centerIn":p})
    }
    function deleteQuestion(id,type){
        qm.deleteQuestion(id,type)
    }
    function updateQuestion(model,type){
        //        console.log("asdasdasd")
        //        console.log(model)
        console.log(JSON.stringify(model))
        qm.updateQuestion(model,type)
    }

    function commitQuestions(){
        qm.commitQuestons()
    }

    function selectPosts(){
        qm.selectPosts()
    }

    //    function getAllPosts(){
    //        var p = HttpRequest.get(qhttpserver + "selectAllPosts").timeout(5000).then(function(res){
    //            JSON.stringify(res.body)
    //            postsdata = res.body
    //            deleteSucceed()
    //        });
    //    }

    Connections {
        //        id:con
        target: qm

        //        onDeleteFailed:{
        //            toastManager.show("删除失败！",1000)
        //            loaderItem.close()
        //        }
        //        onUpdateFailed:{
        //            toastManager.show("保存失败！",1000)
        //            rootStack.pop()
        //        }
        onSubmitSucceeded:{
            toastManager.show("插入成功！",1000)
            loaderItem.close()
        }
        onSubmitFailed:{
            toastManager.show("插入失败！",1000)
            loaderItem.close()
        }
    }

    function deletePost(id,index){
        HttpRequest
        .post(qhttpserver+"deletePost")
        .set('Content-Type', 'application/json')
        .send({ postId: id, v: "" })
        .then(function(res) {
            if(res.body === "success"){
                deleteSucceed(index)
            }
        })
        .catch(function(err) {
            console.log(err.code)
        });
    }

    function deleteComment(id,index,isCC=false){
        HttpRequest
        .post(qhttpserver+"deleteComment")
        .set('Content-Type', 'application/json')
        .send({ id: id, v: "" })
        .then(function(res) {
            if(res.body === "success"){
                if(isCC){
                    deleteCSucceed(index)
                }
                else{
                    deleteCCsucceed(index)
                }
            }
        })
        .catch(function(err) {
            console.log(err.code)
        });
    }

    function submitResource(name,info,url,type){

        const xhr = new XMLHttpRequest();
        xhr.open("POST",qhttpserver + "submitResource",false);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
        xhr.send(JSON.stringify({name:name,info:info,url:url,type:type}))
        if(xhr.responseText == "success"){
            return true
        }
        return false
    }
    function updateResource(id,name,info,url,type){

        const xhr = new XMLHttpRequest();
        xhr.open("POST",qhttpserver + "updateResource",false);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
        xhr.send(JSON.stringify({id:id,name:name,info:info,url:url,type:type}))
        if(xhr.responseText == "success"){
            return true
        }
        return false
    }

    function deleteResource(id){
        const xhr = new XMLHttpRequest();
        xhr.open("POST",qhttpserver + "deleteResource",false);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded")
        xhr.send(JSON.stringify({id:id}))
        if(xhr.responseText == "success"){
            return true
        }
        return false
    }

    function getQuestionByTcp(){
        qm.getQuestionsByTcp();
    }



}
