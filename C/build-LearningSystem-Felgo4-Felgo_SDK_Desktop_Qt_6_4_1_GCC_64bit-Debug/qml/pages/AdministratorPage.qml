import QtQuick
import Felgo
import "../items"

import "../logic"
AppPage {
    id: adminPage
    title: "管理员操作"
    //    anchors.top:rootStack.navigationBar.bottom

    property var ops: [
        {
            text: "添加题目",
            detailText: "Add Question",
            //            icon: IconType.apple
        },

        {
            text: "查看题目",
            detailText: "Select & Update Questions",
        },
        {
            text: "题库更新",
            detailText: "Commit Questions to Users",
        },
        {
            text: "删帖/删评",
            detailText: "Delete Post Or Comment",
        }
    ]

    AppListView {
        id: adminlist
        model:ops
        delegate: SimpleRow {
            onSelected: index=>{
                            console.log(index)
                            if(index === 0 || index === 1)
                            createQuestionPage(index)
                            if(index === 2)
                            adminLogic.commitQuestions()
                            if(index === 3)
                            createPostsPage()
//                            logic.getAllPosts()
                            //                            createPostsPage()
                            //                            if(index === 4)

                            //                switch(index){
                            //                case 0:
                            ////                    questionPage.qP.state=0
                            ////                    rootStack.push(questionPage)

                            //                    break;
                            //                case 1:
                            //                    break;
                            //                }
                        }
        }


    }
    function createQuestionPage(index){
        var component = Qt.createComponent("QuestionPage.qml");
        if(component.status === Component.Ready){
            console.log("here")
            var obj =  component.createObject(parent,{state: index})
            rootStack.push(obj)
        }
    }

    function createPostsPage(){
        var component = Qt.createComponent("PostsPage.qml");
//        var model = logic.postsdata

        var model = logic.getAllPosts()
        var obj =  component.createObject(parent,{dmodel:model,admin:true})
        rootStack.push(obj)
    }

    Connections {
        id:con
        target: logic
        onPostsGot:{
            createPostsPage()
        }
    }
    onPopped: {
        destroy()
    }

}
