import QtQuick
import Felgo
import QtQuick.Controls
/*

// EXAMPLE USAGE:
// add the following piece of code inside your App { } to display the List Page

UserResoucesListPage {

}

*/

ListPage {

    property var data
    // TODO add your model
    model: ListModel {}

    delegate: Rectangle {
        property string status : resource.status
        x:dp(10)
        width:parent.width - 2*x
        height: col.height
        clip:true
        Column{
            id:col
            spacing: 4
            width: parent.width
            AppText {
                text: model.name
            }
            AppText {
                text: model.info
                color: Theme.secondaryTextColor
                width: parent.width
                height: contentHeight
                wrapMode: "WrapAnywhere"
                //                height: dp(70)
                //                clip:true
            }
            AppText {
                visible: model.type===3? false:true
                text: "资源状态:" + status
                color: Theme.secondaryTextColor
            }
            Row {
                anchors.horizontalCenter: parent.horizontalCenter
                AppButton {
                    id:deleteBtn
                    text: "删除"
                    backgroundColor: "red"
                    visible: resource.available? true : false
                    onClicked: {
                        resource.remove()
                    }
                }
                AppButton {
                    id:downloadBtn
                    text: "下载"
                    visible: resource.available? false : true
                    onClicked: {
                        if(!resource.available)  resource.download()
                    }
                }
                AppButton {
                    id:studyBtn
                    text: "学习"
                    enabled: resource.available
                    onClicked: {
                        openRes()
                    }
                }

                AppButton {
                    id:studyInApp
                    text: "内部打开"
                    visible: model.type === 3 ? true:false
                    onClicked: {
                        var p = Qt.createComponent("WebPage.qml").createObject(parent,{title:model.name,url:model.url})
                        studyStack.push(p)
                    }
                }
                AppButton {
                    id:studyOutSide
                    text: "外部打开"
                    visible: model.type === 3 ? true:false
                    //                    enabled: resource.available
                    onClicked: {
                        Qt.openUrlExternally(model.url)
                    }
                }

            }
            DownloadableResource {
                id: resource
                source: model.url
                storageLocation: FileUtils.DocumentsLocation
                storageName: model.url.split("/").pop().replace("{","").replace("}","")
                extractAsPackage: false
            }


        }
        function openRes(){
            if(type===0){
                console.log(resource.storagePath)
                FileUtils.openFile(resource.storagePath)
            }
            if(type===1){
                var p = Qt.createComponent("ImagePage.qml").createObject(parent,{title:model.name,source:resource.storagePath})
                studyStack.push(p)
            }
            if(type===2){
                var p1 = Qt.createComponent("MediaPage.qml").createObject(parent,{title:model.name,source:resource.storagePath})
                studyStack.push(p1)
            }
        }
        Component.onCompleted:{
            if(type===3){
                downloadBtn.visible = false
                deleteBtn.visible = false
                studyBtn.visible = false
            }
        }
    }
    
    Component.onCompleted:{
        if(data){
            data.forEach(function(obj) {
                model.append(obj);
            })
        }
    }
    onPopped: {
        destroy()
    }
}
