import QtQuick
import Felgo
import QtQuick.Controls


AppPage {
    title: "评论管理"
    id:root
    property int page: 1

    rightBarItem: IconButtonBarItem {
        iconType: IconType.expand
        onClicked: {
            for (var i = 0; i < commentModel.count; i++) {
                var item = commentListView.itemAtIndex(i)
                item.expand = !item.expand
            }
        }
    }

    JsonListModel {
        id:commentModel
    }
    AppListView {
        id:commentListView
        showSearch: true
        anchors.fill: parent
        //        model: commentModel
        model:proxyModel
        onSearch: term => {
                      regFilter.pattern = term
                  }
        delegate: Item {
            id:item
            width: parent.width
            height: col.height
            property alias expand: col.expand
            Column {
                id:col
                width: parent.width
                property double colHeight : (rootText.height + comment2ListView.contentHeight)
                property bool expand: false
                leftPadding: dp(40)
                height: expand ? colHeight : rootText.height
                clip: !expand
                Row {
                    id:row
                    height: rootText.height
                    width: parent.width
                    spacing: 5
                    AppIcon {
                        id:a1
                        visible:  model.comments2.length === 0
                        iconType: IconType.minus
                        //                        width: a2.width
                        anchors.verticalCenter: parent.verticalCenter
                    }
                    AppIcon {
                        anchors.verticalCenter: parent.verticalCenter
                        id:a2
                        visible:  model.comments2.length !==0
                        iconType: col.expand ? IconType.angledown :IconType.angleright
                    }
                    TapHandler {
                        onTapped: {
                            col.expand = !col.expand
                        }
                        onLongPressed: {
                            console.log("delete")
                            NativeDialog.confirm("确认？","子评论都将被删除！", function(ok){
                                if(ok){
                                    console.log(index)
                                    deleteC(model.id)
                                    //                                    commentModel.remove(index,1)
                                }
                            })
                        }
                    }
                    AppText {
                        id:rootText
                        text: model.text
                        fontSize: 18
                        color: "green"
                    }

                }
                JsonListModel {
                    id:comment2Model
                    source: model.comments2

                }
                AppListView{
                    id:comment2ListView
                    model: comment2Model
                    delegate: AppText {
                        text: "   "+model.text
                        color: "blue"
                        TapHandler {
                            onLongPressed: {
                                console.log(model.id)
                                NativeDialog.confirm("确认？","删除该评论！", function(ok){
                                    if(ok){
                                        console.log(index)
                                        deleteC(model.id)
                                        //                                        console.log(model.id)
                                        //                                        comment2Model.remove(index,1)
                                    }
                                })
                            }
                        }
                    }
                }

                //                Component.onCompleted:{
                ////                    model.comments2.forEach(function(e){
                ////                        const c =   comment2Com.createObject(col,{data:e});
                ////                        col.colHeight += c.height;
                ////                    })
                //                }

            }

        }


        PullToRefreshHandler {
            onRefresh: {
                root.refresh()
                toastManager.show("刷新成功",1000)
            }
        }
        footer: VisibilityRefreshHandler {
            id:refreshHandler
            defaultAppActivityIndicatorVisible:false
            canRefresh: true
            onRefresh: {
                page++
                var arr = logic.getCommentsA2(page)
                if(arr.length === 0)
                {
                    toastManager.show("已经到底了！！",1000)
                }else{
                    arr.forEach(function(obj) {
                        commentModel.append(obj)
                    })
                }
            }
        }
    }
    //建议别用这个名称，和某个信号重名了……前面用多了，懒得改了
    function refresh(){
        commentModel.clear()
        page = 1
        commentModel.source = logic.getCommentsA2(page)
    }
    function deleteC(id){
        adminLogic.deleteCommentAComment2(id)
        //        root.refresh()
    }

    Connections {
        target: adminLogic
        onDeleteCorCCSucceed:{
            root.refresh()
        }
    }

    SortFilterProxyModel {
        id:proxyModel
        sourceModel: commentModel

        filters: [
            RegExpFilter {
                id:regFilter
                roleName: "filter"
            }
        ]


    }

    Component.onCompleted:{
        commentModel.source =logic.getCommentsA2(page)
    }

    onPopped: {
        destroy()
    }
}




