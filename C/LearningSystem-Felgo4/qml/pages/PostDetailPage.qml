import QtQuick
import Felgo
import QtQuick.Layouts
import QtQuick.Controls

AppPage {
    title: "帖子"
    height: parent.height - dp(80)
    property var postModel

    AppFlickable{
        width: parent.width
        height: parent.height
        //        contentWidth: Math.max(width, child.width)
        contentHeight: Math.max(height, child.height)

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
                clip: true

            }
            Item {
                id: bottomSpacer

                width: parent.width
                height: dp(6)

                Layout.columnSpan: parent.columns
                Layout.fillWidth: true
            }



        }
        AppListView {
            model: postModel.comments
            delegate: SimpleRow{}
        }

    }
    Row{
        AppText{
            text:"woqunidaty"

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
        console.log(JSON.stringify(postModel))
        //        download()
    }


}
