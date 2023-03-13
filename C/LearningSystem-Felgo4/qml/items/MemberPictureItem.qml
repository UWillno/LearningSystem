import QtQuick
import Felgo
import QtQuick.Controls

Rectangle {

    property var objectid
    width: parent.width
    height: dp(200)
    AppImage {
        id:image
        anchors.horizontalCenter: parent.horizontalCenter
        height: dp(200)
        fillMode: Image.PreserveAspectFit
        source: resource.available? resource.storagePath : ""
        Component.onCompleted:{
            resource.download()
        }
        MouseArea {
            anchors.fill: parent
            onClicked: {
                PictureViewer.show(app,resource.storagePath)
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
                            if(FileUtils.copyFile(resource,filepath)){
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
        headerParameters: ({
                               "User-Agent": "Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/109.0.0.0 Mobile Safari/537.36 Edg/109.0.1518.52",
                               "content-type":"application/x-www-form-urlencoded"
                           })
        id: resource
        //        source:img
        extractAsPackage: false
        source : "https://p.ananas.chaoxing.com/star3/origin/"+objectid+".jpg"
    }

}
