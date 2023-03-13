import QtQuick
import Felgo
import QtQuick.Controls
Rectangle {
    property var name
    property var content
    property var objectids
    width: parent.width
    height: col.height
    Column {
        id:col
        //        anchors.fill: parent
        width: parent.width
        height: nameText.height + contentText.height
        spacing: 5
        AppText {
            anchors.horizontalCenter: parent.horizontalCenter
            color: Theme.secondaryTextColor
            id: nameText
            text:String(name)
        }

        AppText {
            visible: content ? true : false
            anchors.horizontalCenter: parent.horizontalCenter
            id: contentText
            text:String(content)
        }
    }


    Component.onCompleted:{
        if(objectids){
            objectids.forEach(function(objectid){
                //            console.log(String(e))
                var obj= Qt.createComponent("MemberPictureItem.qml").createObject(col,{objectid:objectid})
                col.height += dp(200)
//                console.log(obj.height)
            });
        }
    }



}
