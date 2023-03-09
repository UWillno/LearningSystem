import QtQuick
import Felgo
//import QtQuick.Controls
import QtQuick.Controls

SwipeView {

    //    property alias selectSwipeView: selectSwipeView
    id: selectSwipeView
    anchors.fill: parent
    //    property string listData
    //    currentIndex: 0
    //    orientation: Qt.Horizontal
    //    property var selectQuestion
    //    property var selectType
    //    property var choiceModel : qm.tcpQuestions[0]
    //    property var trueOrFalseModel : qm.tcpQuestions[1]
    //    property var fillModel : qm.tcpQuestions[2]
    //    property var model1: qm.tcpQuestions[0]



    Rectangle {

        AppListView {
            showSearch : true
            onSearch: term => {
                          console.log(term)
                          choiceModel.clear()
                          if(term === ""){
                              choiceModel.source = qm.tcpQuestions[0]
                          }
                          else {
                              var choiceSearchModel = []
                              qm.tcpQuestions[0].forEach(function(q){
                                  //                                  searchModel.push()
                                  if(JSON.stringify(q).includes(String(term))){
                                      choiceSearchModel.push(q)
                                      console.log(JSON.stringify(q))
                                  }
                              })
                              choiceModel.source = choiceSearchModel
                          }

                      }

            id:choiceView
            anchors.fill: parent
            //                        model: model1
            model:JsonListModel {
                id:choiceModel
                source : qm.tcpQuestions[0]

            }


            delegate: SimpleRow { text : index+1 + "." + model.question
                onSelected: {
                    viewDetail(0,model)
                }
            }
        }
    }
    Rectangle {
        AppListView {
            showSearch : true
            onSearch: term => {
                          console.log(term)
                          trueOrFalseModel.clear()
                          if(term === ""){
                              trueOrFalseModel.source = qm.tcpQuestions[1]
                          }
                          else {
                              var trueOrFalseSearchModel = []
                              qm.tcpQuestions[1].forEach(function(q){
                                  //                                  searchModel.push()
                                  if(JSON.stringify(q).includes(String(term))){
                                      trueOrFalseSearchModel.push(q)
                                  }
                              })
                              trueOrFalseModel.source = trueOrFalseSearchModel
                          }

                      }

            id:trueOrfalseView
            anchors.fill: parent
            //            model: qm.tcpQuestions[1]
            model: JsonListModel {
                id:trueOrFalseModel
                source: qm.tcpQuestions[1]

            }

            delegate: SimpleRow { text : index+1 +"." + model.question
                onSelected: {
                    //                    console.log(model.id)
                    viewDetail(1,model)
                }
            }
        }
    }
    Rectangle {

        AppListView {
            showSearch : true
            onSearch: term => {
                          console.log(term)
                          fillModel.clear()
                          if(term === ""){
                              fillModel.source = qm.tcpQuestions[2]
                          }
                          else {
                              var fillSeachModel = []
                              qm.tcpQuestions[2].forEach(function(q){
                                  if(JSON.stringify(q).includes(String(term))){
                                      fillSeachModel.push(q)
                                  }
                              })
                              fillModel.source = fillSeachModel
                          }
                      }

            id:fillView
            anchors.fill: parent
            //            model: qm.tcpQuestions[2]
            model: JsonListModel {
                id:fillModel
                source: qm.tcpQuestions[2]
            }
            delegate: SimpleRow { text : index+1 +"." + model.question
                onSelected: {
                    //                    console.log(model)
                    viewDetail(2,model)
                }
            }
        }
        //        ValueFilter {
        //        }

    }
    function viewDetail(type,question){
        console.log(question)
        console.log(question.id)
        //        var q = JSON.parse(JSON.stringify(question))

        var component = Qt.createComponent("ModifyQuestionPage.qml").createObject(null,{model:question,type:type})
        ////        selectQuestion = question
        ////        selectType= type
        rootStack.push(component)

    }

    function update(){
        choiceModel.source = qm.tcpQuestions[0]
        trueOrFalseModel.source = qm.tcpQuestions[1]
        fillModel.source = qm.tcpQuestions[2]
    }

    Component.onCompleted:{
        //        console.log(qm.tcpQuestions[0])
        //                console.log(qm.tcpQuestions[0].length)

        //        choiceModel = qm.tcpQuestions[0]
        //        qm.tcpQuestions[0].forEach(function(e){
        //        console.log(e)
        //        })

    }
    Connections {
        id:con
        target: qm

        onDeleteSuceeded:{
            update()
        }

        onUpdateSucceeded:{

            update()
        }

    }


}
