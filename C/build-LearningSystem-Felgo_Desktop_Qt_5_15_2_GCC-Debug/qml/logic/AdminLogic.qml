import QtQuick 2.0
import Felgo 3.0
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
    function updateSelectQuestions(lv1,lv2,lv3){
        lv1.model = qm.tcpQuestions[0]
        lv2.model = qm.tcpQuestions[1]
        lv3.model = qm.tcpQuestions[2]
    }

}
