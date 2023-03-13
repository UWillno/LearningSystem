import QtQuick
import Felgo
import QtQuick.Controls

Grid {
//    property var model
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

                    if(!(question.trim() === model.question && option1.trim() === model.option1 &&  option2.trim() === model.option2
                         &&  option3.trim() === model.option3 && option4.trim() === model.option4 && answer === model.answer))
                    {

                        console.log("ModifyBUttons"+ model.id) //??????
                        const newmodel = {
                            id : model.id,
                            question : question.trim(),
                            option1 :option1.trim(),
                            option2 : option2.trim(),
                            option3 :option3.trim(),
                            option4: option4.trim(),
                            answer: answer
                        }
                        //                        model.question = question.trim()
                        //                        model.option1 = option1.trim()
                        //                        model.option2 = option2.trim()
                        //                        model.option3 = option3.trim()
                        //                        model.option4 = option4.trim()
                        //                        model.answer = answer
                        adminLogic.updateQuestion(newmodel,0)
                    }
                    break;
                }
                case 1:{
                    if(!(question.trim() === model.question && answer === model.answer)){

                        const newmodel = {
                            id:model.id,
                            question : question.trim(),
                            answer : answer
                        }
//                        model.question = question.trim()
//                        model.answer = answer
                        adminLogic.updateQuestion(newmodel,1)
                    }
                    break;
                }
                case 2:{
                    if(!(adminLogic.blanksToAnswer(blanks) === model.answer && question.trim() === model.question))
                    {

                        const newmodel = {
                            id:model.id,
                            question : question.trim(),
                            answer : adminLogic.blanksToAnswer(blanks)
                        }
//                        model.question = question.trim()
//                        model.answer = adminLogic.blanksToAnswer(blanks);
                        adminLogic.updateQuestion(newmodel,2)
                    }
                    break;
                }
                }
            }else{
                toastManager.show("数据异常！",1000);
            }
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


    //    Connections {
    //        id:con
    //        target: qm


    ////        onDeleteFailed:{
    ////            toastManager.show("删除失败！",1000)
    ////            loaderItem.close()
    ////        }
    //        onDeleteSuceeded:{

    //            toastManager.show("删除成功！",1000)
    //            loaderItem.close()
    //            rootStack.pop()
    //        }

    //        onUpdateSucceeded:{

    //            toastManager.show("保存成功！",1000)

    //            rootStack.pop()
    //        }

    //    }

}
