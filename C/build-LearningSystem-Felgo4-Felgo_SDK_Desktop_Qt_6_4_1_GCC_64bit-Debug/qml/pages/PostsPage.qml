import QtQuick
import Felgo
import QtQuick.Controls
import "../items"
AppPage {
    id:postsPage
    property var dmodel
    property bool admin: false
    backgroundColor: "#F5F5F5"
    title: "帖子列表"


    //    Rectangle {
    //        anchors.fill: parent
    //        anchors.topMargin: dp(20)
    AppListView {

        backgroundColor: "#F5F5F5"
        id:postList
        delegate: admin ? adminItem : userItem
        model: dmodel
        scrollsToTop : true

        function update() {
            var pos = getScrollPosition() //retrieve scroll position data
            loadMoreItems()         //adds new items to list model
            restoreScrollPosition(pos) //scrolls to the previous position
        }
        PullToRefreshHandler {
            onRefresh: {
                console.log("refresh");
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
            dmodel = adminLogic.postsdata
        }
    }

    onPopped: {
        destroy()
    }

}
