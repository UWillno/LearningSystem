import QtQuick
import Felgo
import QtQuick.Controls
Rectangle {
    id:postItem
    width: parent.width
    height: column.height
    anchors.horizontalCenter: parent.horizontalCenter
    border.width: 1
    border.color: "gray"
//    radius: dp(20)
    property bool admin: false

//    border.
    Column {

        id:column
        spacing:dp(10)
        Rectangle{

            width: parent.width
            height: dp(5)
        }

        Row {

            spacing: dp(5)
            RoundedImage {
                id: roundedImage
                width: dp(30)
                height: width

                fillMode: Image.PreserveAspectCrop
                anchors.verticalCenter: parent.verticalCenter
                source: userImageResource.available ? userImageResource.storagePath :"http://q1.qlogo.cn/g?b=qq&nk=44910244&s=640"
                radius: width/2
            }

            AppText {
                id:usernameText
                text:modelData.username
                fontSize: 20
            }

        }
        AppText {
            id:titleText
            text:modelData.title
            font.bold: true

        }

        AppText {
            id:textText
            width: parent.width
            height:(contentHeight > dp(100))? dp(100) : contentHeight
            clip:true
            textFormat: Text.RichText
            text: modelData.text
            wrapMode: AppTextEdit.WrapAnywhere
        }

        Grid{
            height: dp(50)
            width: postItem.width
            columns: 3
            rows:1
            horizontalItemAlignment:Grid.AlignHCenter
            verticalItemAlignment: Grid.AlignVCenter
            AppIcon {
                width: parent.width/3
                //                height: parent.height
                color:"green"
                iconType: IconType.comment +" "+ modelData.comments.length
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
            }
            AppIcon {
                //                horizontalItemAlignment:horizontalCenter
                width: parent.width / 3
                height: parent.height
                iconType: IconType.remove
                color: "red"
                visible: admin ? true:false
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        adminLogic.deletePost(modelData.id);
                    }
                }
            }
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
        source: "http://photo.chaoxing.com/p/"+modelData.cxid+"_80"

        Component.onCompleted: {
            console.log(source)
            download()
        }
    }

    Component.onCompleted:{
        switch(modelData.type){
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
