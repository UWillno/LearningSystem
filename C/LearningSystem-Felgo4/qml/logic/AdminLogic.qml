import QtQuick
import Felgo
//import "../items/loaders/LoaderDialog.qml"
Item {

    id: adminLogic
    function insertChoiceQuestion(question,option1, option2,option3,option4,answer){
        qm.sendChoiceQuestion(question,option1, option2,option3,option4,answer)
    }
    //填转JSON字符串
    function blanksToAnswer(blanksObj){
        var temp = new Array
        blanksObj.forEach(function(obj){
            temp.push(obj.text)
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
    //    WorkerScript {
    //        id: adminScript
    //        source: ""
    //    }
    function loading(p){
        var component = Qt.createComponent("../items/loader/Loader.qml");
        var obj = component.createObject(p,{"anchors.centerIn":p})
    }

    function deleteQuestion(id,type){
        qm.deleteQuestion(id,type)
    }
    //    // 更新查看列表model
    //    function updateSelectQuestions(lv1,lv2,lv3){

    //        lv1.model = qm.tcpQuestions[0]
    //        lv2.model = qm.tcpQuestions[1]
    //        lv3.model = qm.tcpQuestions[2]
    //    }

//    function updateQuestionsModel(m1,m2,m3){
//        m1=  qm.tcpQuestions[0]
//        m2 = qm.tcpQuestions[1]
//        m3 = qm.tcpQuestions[2]
//        //        qm.getQuestionsByTcp()
//    }

    //    function updateChoiceQuesiton(id,question,op1,op2,op3,op4,answer){

    //    }

    function updateQuestion(model,type){
        //        console.log("asdasdasd")
        console.log(model)
        qm.updateQuestion(model,type)
    }

    function commitQuestions(){
        qm.commitQuestons()
    }

    function selectPosts(){
        qm.selectPosts()
    }

    Connections {
//        id:con
        target: qm

        onDeleteFailed:{
            toastManager.show("删除失败！",1000)
            loaderItem.close()
        }
        onUpdateFailed:{
            toastManager.show("保存失败！",1000)
            rootStack.pop()
        }
        onSubmitSucceeded:{
            toastManager.show("插入成功！",1000)
            loaderItem.close()
        }
        onSubmitFailed:{
            toastManager.show("插入失败！",1000)
            loaderItem.close()
        }
    }
}
