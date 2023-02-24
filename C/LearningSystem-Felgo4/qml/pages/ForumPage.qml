import QtQuick
import Felgo

AppPage {

    title: "论坛"
    AppListView {
        delegate: SimpleRow {
            onSelected: index=>{
                            if(index === 0 ){
                                var page = Qt.createComponent("PostingPage.qml").createObject(parent)
                                forumStatck.push(page)
                            }
                            if(index===1){
                                logic.getAllPosts()
                            }
                        }
        }
        model: [
            {
                text: "发帖",
                detailText: "Immerse Oneself In Exercises",
                iconType: IconType.apple
            },

            {
                text: "看贴",
                detailText: "Historical Mistakes",
                iconType: IconType.beer
            },
        ]
    }

    function createPostsPage(){
        var component = Qt.createComponent("PostsPage.qml");
        var model = logic.postsdata
        var obj =  component.createObject(parent,{dmodel:model,admin:false})
        forumStatck.push(obj)
    }
    Connections {
        //        id:con
        target: logic
        onPostsGot:{
            createPostsPage()
        }
    }
    onPopped: {
        destroy()
    }

}
