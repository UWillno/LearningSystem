import QtQuick
import Felgo
import QtQuick.Controls
import QtQuick.Layouts



Rectangle {

    //    property var model
    width: parent.width
    height: innerGrid.height
    property bool admin: false

    //    signal reply2(var model)

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
            Layout.preferredWidth: dp(30)
            Layout.preferredHeight: dp(30)
            Layout.rowSpan: 3
            Layout.alignment: Qt.AlignTop
            source: userImageResource.available ? userImageResource.storagePath :""
        }
        AppText {
            id:usernameText
            elide: Text.ElideRight
            text:model.username
            textFormat: "RichText"
            Layout.columnSpan: 3
            maximumLineCount: 1
            color: Theme.textColor
            //            font.family: Theme.normalFont.name
            //            font.bold: true
            font.pixelSize: dp(15)
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
            font.pixelSize: dp(12)
            lineHeight: dp(16)
            lineHeightMode: Text.FixedHeight

            Layout.fillWidth: true
            verticalAlignment: Text.AlignBottom
            Layout.preferredWidth: parent.width
            text:model.datetime
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
            height: contentHeight
            //            clip: true
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
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            reply(model,model.username)
        }
        onPressAndHold: {
            //            console.log(model.cxid)
            //            console.log(ss.cxid)
            if(model.cxid === ss.cxid || admin ){
                NativeDialog.confirm("确认","删除该回复？",function(ok){
                    if(ok){
                        deleteCon.enabled = true
                        adminLogic.deleteComment(model.id,index,true);
                    }
                })
            }
        }
    }

    Connections {
        id:deleteCon
        enabled: false
        target: adminLogic
        onDeleteCcSucceed : index => {
                                enabled = false
                                ccModel.remove(index,1)
//                                destroy()
                            }
    }


}
