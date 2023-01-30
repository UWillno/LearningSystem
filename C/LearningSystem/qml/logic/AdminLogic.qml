import QtQuick 2.0
import Felgo 3.0

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

}
