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
    ListModel{
        id:postListModel
    }
    rightBarItem: IconButtonBarItem {
        id:rightBar
        visible: true
        iconType:IconType.filter
        onClicked: {
            filterMenu.popup()
        }

    }

   Menu {
        id:filterMenu
        modal: true
        opacity: 0.7
        parent:postsPage
        anchors.centerIn: postsPage
        AppRadio{
            id:radio4
            text:"我的帖子"
//            checked: true
            onCheckedChanged: {
                if(checked){
                    filterByType.enabled = false
                    filterByCxid.value = ss.cxid
                    filterByCxid.enabled = true
                }else {
                     filterByCxid.enabled = false
                }
            }
        }
        AppRadio{
            id:radio0
            text: "学习心得"
            value: 0
            onCheckedChanged: {
                if(checked){
                    filterByType.value = 0
                    filterByType.enabled = true
                    //                    postList.model = sortFilterModel
                }
            }
        }
        AppRadio{
            id:radio1
            value: 1
            text:"考试技巧"
            onCheckedChanged: {
                if(checked){
                    filterByType.value = 1
                    filterByType.enabled = true
                    //                    postList.model = sortFilterModel
                }
            }
        }
        AppRadio{
            id:radio2
            value: 2
            text:"提问"
            onCheckedChanged: {
                if(checked){
                    filterByType.value = 2
                    filterByType.enabled = true
                    //                    postList.model = sortFilterModel
                }
            }
        }

        AppRadio{
            id:radio3
            //                value:
            text:"全部"
            checked: true
            onCheckedChanged: {
                if(checked){
                    filterByType.enabled = false
                }
            }
        }

    }

    AppListView {
        showSearch : true
        onSearch: term => {
                      filterByRegExp.enabled = term===""? false : true
                      filterByRegExp.pattern = term
                  }

        //        header: Row {
        //            visible: !postList.showSearch
        //            AppRadio{
        //                id:radio0
        //                text: "学习心得"
        //                value: 0
        //                onCheckedChanged: {
        //                    if(checked){
        //                        filterByType.value = 0
        //                        filterByType.enabled = true
        //                        postList.model = sortFilterModel
        //                    }
        //                }
        //            }
        //            AppRadio{
        //                id:radio1
        //                value: 1
        //                text:"考试技巧"
        //                onCheckedChanged: {
        //                    if(checked){
        //                        filterByType.value = 1
        //                        filterByType.enabled = true
        //                        postList.model = sortFilterModel
        //                    }
        //                }
        //            }
        //            AppRadio{
        //                id:radio2
        //                value: 2
        //                text:"提问"
        //                onCheckedChanged: {
        //                    if(checked){
        //                        filterByType.value = 2
        //                        filterByType.enabled = true
        //                        postList.model = sortFilterModel
        //                    }
        //                }
        //            }
        //            AppRadio{
        //                id:radio3
        ////                value:
        //                text:"全部"
        //                checked: true
        //                onCheckedChanged: {
        //                    if(checked){
        //                        filterByType.enabled = false
        //                    }
        //                }
        //            }
        //        }


        property int page: 1
        backgroundColor: "white"
        id:postList
        delegate: admin ? adminItem : userItem
        //        model: dmodel
        model: sortFilterModel
        scrollsToTop : true

        function refresh(){
            //            console.log("refresh");
            //            dmodel = logic.getAllPosts() //查全部
            page = 1
            var m = logic.getPosts(page)
            //            console.
            m.forEach(function(element) {
                postListModel.append(element);
            });
        }
        PullToRefreshHandler {
            onRefresh: {
                postListModel.clear()
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
                        postListModel.append(obj);
                    })
                }
            }
        }
        Component.onCompleted: {
            refresh()
        }

        SortFilterProxyModel {
            id:sortFilterModel
            sourceModel:postListModel

            filters: [
                ValueFilter {
                    id:filterByType
                    roleName: "type"
                },
                ValueFilter {
                    id:filterByCxid
                    roleName: "cxid"
                },
                RegExpFilter {
                    id:filterByRegExp
                    roleName: "title"
                    //                        pattern:
                }
            ]
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
