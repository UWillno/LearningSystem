import QtQuick
import Felgo
import QtQuick.Controls
/*

// EXAMPLE USAGE:
// add the following piece of code inside your App { } to display the List Page

PhotoListPage {

}

*/

ListPage {

    title: "签到图片列表"
    id:plp

    signal listpop
    property var data
    //    // TODO add your model
    //    model: [{ type: "Fruits", text: "Banana" },
    //        { type: "Fruits", text: "Apple" },
    //        { type: "Vegetables", text: "Potato" }]

    section.property: "type"

    model : ListModel{}
    delegate:
        Rectangle {
        width: parent.width
        height: col.height
        //        clip:true
        Column {
            id:col
            width:parent.width

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: model.name
            }

            AppImage {
                id: image
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width -dp(20)
                height:dp(300)
                fillMode: Image.PreserveAspectCrop
                source: imageResource.available ? imageResource.storagePath :""
                Component.onCompleted:{
                    imageResource.download()
                }
                //                activeFocus:
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        PictureViewer.show(app,imageResource.storagePath)
                    }
                    onPressAndHold: {
                        NativeDialog.confirm("确认", "保存到相册?", function(ok) {
                            if(ok) {
                                const name = model.title +".jpg"
                                var filepath = (Qt.platform.os === "android") ?
                                            ("/sdcard/Pictures/LearningSystem/" + name) :
                                            (FileUtils.storageLocation(FileUtils.PicturesLocation)+name)
                                if(FileUtils.existsFile(filepath)){
                                    toastManager.show("图片已存在!",1000)
                                }else{
                                    if(FileUtils.copyFile(imageResource,filepath)){
                                        toastManager.show("保存成功!",1000)
                                    }else{
                                        toastManager.show("保存失败!",1000)
                                    }
                                }
                            }
                        })
                    }
                }

            }
            DownloadableResource {
                id: imageResource
                headerParameters: ({
                                       "User-Agent": "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36 Edg/109.0.1518.52",
                                       "content-type":"application/x-www-form-urlencoded"
                                   })
                extractAsPackage: false
                //                storageLocation: FileUtils.TempLocation
                source:  "https://p.ananas.chaoxing.com/star3/origin/"+model.title+".jpg"
//                Component.onCompleted: {
//                    download()
//                }
            }


            Connections{
                target: plp
                onListpop:{
                    //            console.log("")
                    imageResource.remove()
                }
            }
            Component.onCompleted:{
                //                console.log(urlText.text)

            }
        }

    }

    Component.onCompleted:{

        if(data){
            data.forEach(function(obj){
                plp.model.append(obj)
            })
        }
    }
    onPopped: {
        listpop()
        //        destroy()
    }

}
