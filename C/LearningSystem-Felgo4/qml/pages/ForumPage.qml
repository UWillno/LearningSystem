import QtQuick
import Felgo

AppPage {
    title: "论坛"
    AppListView {
        delegate: SimpleRow {
            onSelected: index=>{
                            if(index === 0 ){
                                var page = Qt.createComponent("PostingPage.qml").createObject(parent)
                                forumStack.push(page)
                            }
                            if(index===1){
                                createPostsPage()
                            }
                        }
        }
        model: [
            {
                text: "发帖",
                detailText: "To Post",
                icon: IconType.send
            },

            {
                text: "看贴",
                detailText: "To Reply",
                icon: IconType.weibo
            },
        ]
    }

    function createPostsPage(){
        var component = Qt.createComponent("PostsPage.qml");
        var model = logic.getAllPosts()
        var obj =  component.createObject(parent,{dmodel:model,admin:false})
        forumStack.push(obj)
    }
    Connections {
        target: logic
        onPostsGot:{
            createPostsPage()
        }
    }
    onPopped: {
        destroy()
    }

}
