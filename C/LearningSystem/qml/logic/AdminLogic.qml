import QtQuick 2.0
import Felgo 3.0

Item {

    id: adminLogic
    function insertChoiceQuestion(question,option1, option2,option3,option4,answer){
        qm.sendChoiceQuestion(question,option1, option2,option3,option4,answer)
    }

//    WorkerScript {
//        id: adminScript
//        source: ""
//    }

}
