import QtQuick 2.0
import Felgo 3.0

Grid {
    id: gridModify
    columns: 2
    rows: 1
    visible: false
    //            spacing:
    anchors.horizontalCenter: parent.horizontalCenter
    AppButton {
        id: btnSave
        text: "保存"
        //            anchors.horizontalCenter: parent.horizontalCenter
        //            anchors.bottom: parent.bottom
        //                visible: false

        onClicked: {
            if(!isEmpty()){
                switch(type){
                case 0:{
                    //                    console.log(model)
                    console.log(question === model.question)
                    console.log(option1 === model.option1)
                    console.log(option2 === model.option2)
                    console.log(option3 === model.option3)
                    console.log(option4 === model.option4)
                    console.log(answer === model.answer)

                    if(question === model.question && option1 === model.option1 &&  option2 === model.option2
                            &&  option3 === model.option3 && option4 === model.option4 && answer === model.answer)
                    {

                    }
                    break;
                }
                }
            }

            //            qm.testModel(model)



        }
    }
    AppButton {
        id: btnDelete

        text: "删除"
        onClicked: {
            console.log(type)
            console.log(model.id)
            adminLogic.deleteQuestion(model.id,type);
        }

        //                visible: false
        //            anchors.horizontalCenter: parent.horizontalCenter
        //            anchors.bottom: parent.bottom
    }
}
