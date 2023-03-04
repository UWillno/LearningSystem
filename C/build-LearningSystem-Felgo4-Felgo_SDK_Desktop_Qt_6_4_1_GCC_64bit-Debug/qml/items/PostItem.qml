import QtQuick
import Felgo
import QtQuick.Controls
import QtQuick.Layouts
Rectangle {
    id:postItem
    //    width: parent.width
    //    height: column.height
    implicitWidth: parent.width - dp(10)
    //    implicitHeight: column.height
    implicitHeight: innerGrid.height

    anchors.horizontalCenter: parent.horizontalCenter
    border.width: 1
    border.color: "#F5F5F5"
    //    radius: dp(20)
    property bool admin: false
    property var pm

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
            source: userImageResource.available ? userImageResource.storagePath :"http://q1.qlogo.cn/g?b=qq&nk=44910244&s=640"
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
            text:model.datetime
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
            text:model.title
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
            text: model.text
            wrapMode: Text.WordWrap
            Layout.columnSpan: 3
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignTop
            height: (contentHeight > dp(400))? dp(400):contentHeight
            clip: true
            onLinkActivated: link => {
                                 //              Qt.openUrlExternally(link)
                                 PictureViewer.show(app,link)
                             }

        }

        Grid{
            id: actionGrid
            Layout.columnSpan: 3
            columns: 3
            rows:1
            Layout.fillWidth: true
            Layout.preferredWidth: parent.width
            Layout.alignment: Qt.AlignBottom
            horizontalItemAlignment:Grid.AlignHCenter
            verticalItemAlignment: Grid.AlignVCenter
            AppIcon {
                width: parent.width/3
                //                height: parent.height
                color:"green"
                iconType: IconType.comment +" "+ model.commentsCount
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.log(index+admin)
                        var com = Qt.createComponent("../pages/PostDetailPage.qml").createObject(parent,{admin:admin,postModel:model})
                        if(admin){
                            rootStack.push(com)
                        }else{
                            forumStack.push(com)
                        }
                    }


                }
            }
            Rectangle {
                id:rectst
                width:  parent.width/3
                height: typeText.contentHeight
                border.color: "green"
                AppText{
                    anchors.centerIn: parent
                    id:typeText
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        console.log("查看")
                    }
                }
            }
            AppIcon {
                //                horizontalItemAlignment:horizontalCenter
                width: parent.width / 3
                height: parent.height
                iconType: IconType.remove
                color: "red"
                visible: {
                    if(admin || (ss.cxid === model.cxid )) {
                        return true
                    }else{
                        return false
                    }
                }

                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        adminLogic.deletePost(model.id,index);
                    }
                }
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
    //    Dialog {
    ////        z:0
    //        id: confirmDialog
    //        title: "确认删除该贴?"
    //        positiveActionLabel: "确定"
    //        negativeActionLabel: "取消"
    //        onCanceled: close()
    //        onAccepted: {

    //            close()
    //        }
    //        autoSize:true

    //    }



    DownloadableResource {
        id: userImageResource
        headerParameters: ({
                               "User-Agent": "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36 Edg/109.0.1518.52",
                               "content-type":"application/x-www-form-urlencoded"
                           })
        extractAsPackage: false
        source: "http://photo.chaoxing.com/p/"+model.cxid+"_80"

        Component.onCompleted: {
            console.log(source)
            download()
        }
    }

    Component.onCompleted:{
        switch(model.type){
        case 0:{
            typeText.text = "学习心得";
            typeText.color = "green"
            rectst.border.color = "green"
            break;
        }
        case 1:{
            typeText.text = "考试技巧";
            typeText.color = "pink"
            rectst.border.color = "pink"
            break;
        }
        case 2:{
            typeText.text = "提问";
            typeText.color = "blue"
            rectst.border.color = "blue"
            break;
        }
        }

    }

}
