import QtQuick
import Felgo
import QtQuick.Controls
import QtQuick.Layouts



Rectangle {

    //    property var model
    width: parent.width
    height: innerGrid.height
    property bool admin: false

    signal reply(var model)



    GridLayout {
        id: innerGrid

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
            source: userImageResource.available ? userImageResource.storagePath :""
        }
        AppText {
            id:usernameText
            elide: Text.ElideRight
            text:model.username

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
            text:model.datetime + "\t第" + (model.index+1) + "楼"
            //            font.bold: true
        }
        AppText {
            id: contentText
            textFormat: "RichText"
            color: Theme.textColor
            linkColor: Theme.tintColor
            font.family: Theme.normalFont.name
            font.pixelSize: dp(14)
            lineHeight: 1.15
            text: model.text
            wrapMode: Text.WordWrap
            Layout.columnSpan: 3
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignTop
            height: (contentHeight > dp(400))? dp(400):contentHeight
            //            clip: true
            onLinkActivated: link => {
                                 //              Qt.openUrlExternally(link)
                                 PictureViewer.show(app,link)
                             }

            MouseArea{
                anchors.fill: parent
                onClicked: {
                    //                    adminLogic.deleteComment(model.id,index);
                    reply(model)
                }
            }


        }
        AppIcon {
            //                horizontalItemAlignment:horizontalCenter
            Layout.fillWidth: true
            Layout.fillHeight: true
            //            height: parent.height
            iconType: IconType.remove
            color: "red"
            visible: if(admin || (ss.cxid === model.cxid )) {
                         return true
                     }else{
                         return false
                     }
            MouseArea{
                anchors.fill: parent
                onClicked: {
                    adminLogic.deleteComment(model.id,index);
                }
            }
        }


        AppIcon {
            id:displayIcon
            //                horizontalItemAlignment:horizontalCenter
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.columnSpan: 3
            Layout.alignment: Qt.AlignHCenter
            width: parent.width
            iconType: IconType.angledown
            color: "gray"
            //            visible:
            visible: model.comments2 ? true : false
            MouseArea {
                anchors.fill: parent
                onClicked:{
                    //                    comments2Col.visible = !comments2Col.visible
                    ccListView.visible = !ccListView.visible
                }
            }
        }
        JsonListModel {
            //                    source:
            id:ccModel
            source:displayIcon.visible ? model.comments2 : ""
        }

        //        Column {
        //            id:comments2Col
        //            //            color: "green"
        //            visible: false
        //            Layout.fillWidth: true
        //            Layout.fillHeight: true
        //            Layout.columnSpan: 3
        //            height: ccListView.height
        AppListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.columnSpan: 3
            height: contentHeight > dp(400) ? dp(400) : contentHeight
            visible: false
            id:ccListView
            //                anchors.fill: parent

            model:ccModel
            delegate: Comment2Row {
            }
            //                //                console.log(model.comments2)

            //                if(model.comments2)
            //                {
            //                    console.log("comment2"+model.comments2.length)

            //                    //                    for(var i=0; i<model.comments2.count; i++){
            //                    //                        console.log("username"+model.comments2[i].username)
            //                    ////                       const o= Qt.createComponent("Comment2Row.qml").createObject(comments2Col,{model:model.comments2[i]})
            //                    ////                       comments2Col.height = comments2Col.height + o.height
            //                    //                    }
            //                    model.comments2.forEach(function(c2){
            //                        const o= Qt.createComponent("Comment2Row.qml").createObject(comments2Col,{model:c2})
            //                        comments2Col.height = comments2Col.height + o.height
            //                    });

            //                }
            //                //                console.log("comments2"+model.comments2.count)
            //                //                console.log("model:"+model.comments2.length)
            //                //                if(model.comments2)
            //                //                console.log(JSON.stringify(model.comments2))
            //                //                Qt.createComponent("Comment2Row.qml").createObject(comments2Col,{model:})
        }


        //            Layout.rowSpan: 2
        //        }


        Item {
            id: bottomSpacer

            width: parent.width
            height: dp(6)

            Layout.columnSpan: parent.columns
            Layout.fillWidth: true
        }
    }

    DownloadableResource {
        id: userImageResource
        headerParameters: ({
                               "User-Agent": "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36 Edg/109.0.1518.52",
                               "content-type":"application/x-www-form-urlencoded"
                           })
        extractAsPackage: false
        source: "http://photo.chaoxing.com/p/"+model.cxid+"_80"

        Component.onCompleted: {
            download()
        }
    }

    Component.onCompleted:{
        //        console.log("Crow" + admin)
        //        console.log("二级评论" + )
    }



}
