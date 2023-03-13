import QtQuick
import Felgo
import QtQuick.Controls

AppPage {

    title: "测验答案"
    property var body

    AppTabBar {
        id: appTabBar
        contentContainer: swipeView

        AppTabButton {
            text: "标准答案"
        }
        AppTabButton {
            text: "学生答案"
        }
    }


    SwipeView {
        anchors.top: appTabBar.bottom
        anchors.bottom: parent.bottom
        width: parent.width
        id:swipeView


        Rectangle {
            AppFlickable {
                anchors.fill: parent
                contentHeight: rightAnswerCol.height
                Column {
                    id:rightAnswerCol
                    width: parent.width
                    //                    anchors.fill: parent

                }
            }

        }
        Rectangle {
            //            color: "red"
            AppFlickable {
                anchors.fill: parent
                contentHeight: memberAnswerCol.height
                Column {
                    id:memberAnswerCol
                    width: parent.width
                    //                    anchors.fill: parent
                }
            }
        }
    }
    onPopped: {
        destroy()
    }

    Component.onCompleted:{
        const data = body.data
        const questionList = data.questionList
        if(questionList){
            questionList.forEach(function(object,index){
                Qt.createComponent("../items/RightAnswerAppListItem.qml").createObject(rightAnswerCol,{numberText:"第"+(index+1)+"题",
                                                                                           answerText:String(object.rightAnswer)
                                                                                       })
                console.log(object.rightAnswer)
                const memberList = object.memberList
                if(memberList){
                    memberList.forEach(function(member,index){
                        const name = member.name
                        const answer = JSON.parse(member.answer)
                        const content = answer.content
                        const recs = answer.recs
                        console.log(recs)
                        if(recs){
                            var objectids = []
                            recs.forEach(function(res){
                                if(res.objectid)
                                    objectids.push(res.objectid)
                            })
                            Qt.createComponent("../items/MemberAnswerItem.qml").createObject(memberAnswerCol,{name:name,content:content,objectids:objectids})
                        }else{
                            Qt.createComponent("../items/MemberAnswerItem.qml").createObject(memberAnswerCol,{name:name,content:content})
                        }

                        //                        if(objectid && content){
                        //                            console.log(name + objectid + content)
                        //                            //                                                continue
                        //                        }
                        //                        else if(content){
                        //                            console.log(name  + content)
                        //                            //                                                continue
                        //                        }
                        //                        else if(objectid){
                        //                            console.log(name  + img)
                        //                            //                                                continue
                        //                        }else {
                        //                            console.log("这个人可能交的空白页面？？？")
                        //                        }
                    })
                }
            })
        }


    }

}
