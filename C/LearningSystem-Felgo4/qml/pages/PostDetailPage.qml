import QtQuick
import Felgo
import QtQuick.Layouts
import QtQuick.Controls

import "../items/template"
import "../items"

AppPage {
    id:postDetailPage
    title: "帖子"
    //    height: parent.height
    property bool admin: false
    property var postModel
    property int commentId
    property string atUsername : ""

    AppTabBar {
        id: appTabBar
        contentContainer: swipeView

        AppTabButton {
            text: "帖子"
        }
        AppTabButton {
            text: "评论"
        }
    }


    SwipeView {
        anchors.top: appTabBar.bottom
        height: parent.height - dp(40)
        width: parent.width
        //        anchors.bottom: parent.bottom
        id:swipeView


        Rectangle {
            AppFlickable{
                id:flick
                scrollsToTop : true
                anchors.fill: parent
                contentHeight: child.height

                GridLayout {
                    id: child

                    // Auto-break after 4 columns, so we do not have to set row & column manually
                    columns: 4
                    rowSpacing: dp(4)
                    columnSpacing: dp(8)

                    x: dp(10)
                    width: parent.width - 2 * x

                    // Top spacer
                    Item {
                        id: topSpacer
                        width: parent.width
                        height: dp(6)

                        Layout.columnSpan: parent.columns
                        Layout.fillWidth: true
                    }

                    RoundedImage {
                        id: avatarImage
                        radius: width
                        Layout.preferredWidth: dp(50)
                        Layout.preferredHeight: dp(50)
                        Layout.rowSpan: 3
                        Layout.alignment: Qt.AlignTop
                        source: userImageResource.available ? userImageResource.storagePath :"http://q1.qlogo.cn/g?b=qq&nk=44910244&s=640"
                    }
                    AppText {
                        id:usernameText
                        elide: Text.ElideRight
                        text:postModel.username

                        Layout.columnSpan: 3
                        maximumLineCount: 1
                        color: Theme.textColor
                        //            font.family: Theme.normalFont.name
                        //            font.bold: true
                        font.pixelSize: dp(17)
                        lineHeight: dp(16)
                        lineHeightMode: Text.FixedHeight
                    }
                    AppText {
                        id:timeText
                        elide: Text.ElideRight
                        maximumLineCount: 1
                        Layout.rowSpan:2
                        //            Layout.columnSpan: 3
                        color: Theme.secondaryTextColor
                        //            font.family: Theme.normalFont.name
                        font.pixelSize: dp(14)
                        lineHeight: dp(16)
                        lineHeightMode: Text.FixedHeight

                        Layout.fillWidth: true
                        verticalAlignment: Text.AlignBottom
                        Layout.preferredWidth: parent.width
                        text:postModel.datetime
                        //            font.bold: true
                    }
                    AppText {
                        id:titleText
                        elide: Text.ElideRight
                        maximumLineCount: 2
                        Layout.columnSpan: 3
                        color: Theme.textColor
                        //            font.family: Theme.normalFont.name
                        font.pixelSize: dp(20)
                        lineHeight: dp(16)
                        lineHeightMode: Text.FixedHeight
                        Layout.fillWidth: true
                        verticalAlignment: Text.AlignBottom
                        Layout.preferredWidth: parent.width
                        text:postModel.title
                        font.bold: true
                    }


                    AppText {
                        id: contentText
                        textFormat: "RichText"
                        color: Theme.textColor
                        linkColor: Theme.tintColor
                        font.family: Theme.normalFont.name
                        font.pixelSize: dp(14)
                        lineHeight: 1.15
                        text: postModel.text
                        wrapMode: Text.WordWrap
                        Layout.columnSpan: 3
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.alignment: Qt.AlignTop
                        height: contentHeight
                        //                        clip: true
                        onLinkActivated: link => {
                                             //              Qt.openUrlExternally(link)
                                             PictureViewer.show(app,link)
                                         }
                    }
                    Item {
                        id: bottomSpacer
                        width: parent.width
                        height: dp(6)
                        Layout.columnSpan: parent.columns
                        Layout.fillWidth: true
                    }
                }
            }
        }
        //        }
        //        AppFlickable{
        //            //            id:flick
        //            width: parent.width
        Rectangle {
            //            anchors.fill: parent
            AppListView {
                property int page: 1
                anchors.fill: parent
                id:commentList
                //                model: postModel.comments
                model: JsonListModel {
                    id: commentModel
                }


                delegate: CommentRow{
                    id:commentRow
                    admin:postDetailPage.admin
                    onReply:function(model,username){ replyComment(model,username)}
                }

                function refresh(){
                    page = 1
                    commentModel.clear()
                    commentModel.source = logic.getComments(postModel.id,page)
                }

                PullToRefreshHandler {
                    onRefresh: {
                        commentModel.clear()
                        commentList.refresh()
                        toastManager.show("刷新成功",1000)
                    }
                }
                footer: VisibilityRefreshHandler {
                    id:refreshHandler
                    defaultAppActivityIndicatorVisible:false
                    canRefresh: true
                    onRefresh: {
                        commentList.page++
                        console.log(postList.page)
                        var arr = logic.getComments(postModel.id,commentList.page)
                        if(arr.length === 0)
                        {
                            toastManager.show("已经到底了！！",1000)
                        }else{
                            arr.forEach(function(obj) {
                                //                                commentList.model.append(obj);
                                commentModel.append(obj)
                            })
                        }
                    }
                }

                Component.onCompleted:{
                    commentList.refresh()
                }

                //                footer:VisibilityRefreshHandler
            }
        }
        //        }
    }

    function replyComment(model,username){
        atUsername=""
        rowlayout.state = "replyComment"
        if(username!==""){
            console.log("评论的回复")
            atUsername = username.split("<")[0]
            atText.text = "@"+atUsername
            commentId = model.replyId
        }else {
            //            atUsername = model.username
            atText.text = "@"+model.username
            commentId = model.id
        }


    }


    RowLayout {
        opacity: 0.8
        id:rowlayout
        x: dp(10)
        width: parent.width - 2 * x
        height: dp(40)

        states: [
            State {
                name: "replyComment"
                PropertyChanges {
                    target: r1
                    visible:false
                }
            },
            State {
                name: "replyPost"
                PropertyChanges {
                    target: r1
                    visible: true
                }
                PropertyChanges {
                    target: atText
                    text:""
                }

            }
        ]
        Rectangle {
            id:r1
            //            width: dp(10)
            //                        Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight:ico.height
            Layout.preferredWidth:ico.width
            Layout.alignment: Qt.AlignTop
            AppIcon {
                id:ico
                iconType: IconType.pencil
            }
        }

        Rectangle {
            id:r0
            visible: !r1.visible
            //            width: dp(10)
            //                        Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.preferredHeight:r1.height
            Layout.preferredWidth:atText.width
            Layout.alignment: Qt.AlignTop
            AppText {
                id:atText
                color: Theme.secondaryTextColor
            }
            clip: true
            //            color: "blue"

            MouseArea {
                anchors.fill: parent
                onPressAndHold: {
                    rowlayout.state = "replyPost"

                }
            }
        }



        Rectangle {
            z:10
            id:r2
            //            Layout.fillWidth: true
            Layout.preferredHeight:dp(25)
            //            Layout.fillHeight: true
            Layout.alignment:  Qt.AlignTop
            Layout.preferredWidth:r1.visible ? parent.width -sendBtn.width - r1.width : parent.width - sendBtn.width-r0.width

            radius: width
            color: "#f5f5f5"
            //            AppTextEdit {
            UWAppTextEdit{
                id:textEdit
                anchors.fill: parent
                placeholderText: "回帖"

                //                MouseArea {
                //                    anchors.fill: parent
                //                    onClicked: rowlayout.height = dp(200)
                //                }
            }
        }

        AppButton {
            id:sendBtn
            radius: width
            Layout.alignment:  Qt.AlignTop
            iconType: IconType.send
            //            Layout.preferredWidth:
            //            Layout.fillWidth: true
            Layout.preferredHeight:dp(20)
            Layout.preferredWidth: parent.width / 4
            //            text:"发送"
            onClicked: {
                console.log("评论发送")
                var pos = commentList.getScrollPosition()
                if(rowlayout.state === "replyComment"){
                    console.log(postModel.id+textEdit.text+commentId+atUsername)
                    if(logic.submitComment(postModel.id,textEdit.text,commentId,atUsername)){
                        textEdit.text = ""
                        atUsername = ""
                        commentModel.clear()
                        commentList.refresh()
                        commentList.restoreScrollPosition(pos)
                        toastManager.show("发送成功!",1000);
                        rowlayout.state = "replyPost"
                    }
                }else{
                    if(logic.submitComment(postModel.id,textEdit.text)){
                        textEdit.text = ""
                        commentModel.clear()
                        commentList.refresh()
                        commentList.restoreScrollPosition(pos)
                        toastManager.show("发送成功!",1000);
                    }
                }

            }
        }
        anchors.bottom: parent.bottom
    }

    DownloadableResource {
        id: userImageResource
        headerParameters: ({
                               "User-Agent": "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36 Edg/109.0.1518.52",
                               "content-type":"application/x-www-form-urlencoded"
                           })
        extractAsPackage: false
        source: "http://photo.chaoxing.com/p/"+postModel.cxid+"_80"

        Component.onCompleted: {
            console.log(source)
            download()
        }
    }
    Component.onCompleted: {
        //        console.log(JSON.stringify(postModel))
        //        download()
        console.log("postDetailPage"+admin)
    }

    Connections {
        target: adminLogic
        onDeleteCSucceed : index => {
                               console.log("index"+index)
                               //                               commentList.model.remove(index,1)
                               commentModel.remove(index,1)
                           }
    }
    onPopped: {
        destroy()
    }
}
