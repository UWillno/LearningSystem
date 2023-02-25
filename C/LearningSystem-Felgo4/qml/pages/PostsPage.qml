import QtQuick
import Felgo
import QtQuick.Controls
import "../items"
AppPage {
    id:postsPage
    property var dmodel
    property bool admin: false
    //    backgroundColor: "#F"
    title: "帖子列表"


    //    Rectangle {
    //        anchors.fill: parent
    //        anchors.topMargin: dp(20)
    AppListView {

        backgroundColor: "white"
        id:postList
        delegate: admin ? adminItem : userItem
        model: dmodel
        scrollsToTop : true



        //        function update() {
        //            var pos = getScrollPosition() //retrieve scroll position data
        //            loadMoreItems()         //adds new items to list model
        //            restoreScrollPosition(pos) //scrolls to the previous position
        //        }

        function refresh(){
            console.log("refresh");
            dmodel = logic.getAllPosts()
        }
        PullToRefreshHandler {
            onRefresh: {
                postList.refresh()
                toastManager.show("刷新成功",1000)
            }
        }

        onContentYChanged:  {
            //分页时可以做
            if((contentY+height)>=contentHeight){

            }

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
        onDeleteSucceed: {
            var pos = postList.getScrollPosition()
            postList.refresh()
            postList.restoreScrollPosition(pos)
        }
    }

    onPopped: {
        destroy()
    }

}
