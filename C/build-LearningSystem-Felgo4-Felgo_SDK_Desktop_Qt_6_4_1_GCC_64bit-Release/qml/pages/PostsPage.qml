import QtQuick
import Felgo
import QtQuick.Controls
import QtQml.Models
import "../items"
AppPage {
    id:postsPage
//    property var dmodel
    property bool admin: false
    title: "帖子列表"
    AppListView {

        property int page: 1
        backgroundColor: "white"
        id:postList
        delegate: admin ? adminItem : userItem
        //        model: dmodel
        model: ListModel{}
        scrollsToTop : true

        function refresh(){
            //            console.log("refresh");
            //            dmodel = logic.getAllPosts() //查全部
            page = 1
            var m = logic.getPosts(page)
            //            console.
            m.forEach(function(element) {
                postList.model.append(element);
            });
        }
        PullToRefreshHandler {
            onRefresh: {
                postList.model.clear()
                postList.refresh()
                toastManager.show("刷新成功",1000)
            }
        }
        footer: VisibilityRefreshHandler {
            id:refreshHandler
//            animation
            defaultAppActivityIndicatorVisible:false
            canRefresh: true
            onRefresh: {
                postList.page++
                console.log(postList.page)
                var arr = logic.getPosts(postList.page)

                if(arr.length === 0)
                {
                    toastManager.show("已经到底了！！",1000)
                }else{
                    arr.forEach(function(obj) {
                        postList.model.append(obj);
                    })
                }
            }
        }
        Component.onCompleted: {
            refresh()
        }
    }
    //    }



    Component {
        id:adminItem
        PostItem {
            admin: true
        }
    }
    Component {
        id:userItem
        PostItem {
            admin: false

        }
    }

    Connections {
        target: adminLogic
        onDeleteSucceed: index =>{
            var pos = postList.getScrollPosition()
            postList.model.remove(index,1)
            postList.restoreScrollPosition(pos)
        }
    }

    onPopped: {
        destroy()
    }

}
