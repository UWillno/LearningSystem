import QtQuick
import Felgo

AppPage {
    property alias source: image.source
    title: "图片学习"
    AppImage {
        id:image
        // The image fills the page completely, this can cause distortion depending on the image size
        anchors.fill: parent
        MouseArea{
            anchors.fill: parent
            onClicked: {
                PictureViewer.show(app,source)
            }
            onPressAndHold: {
                NativeDialog.confirm("确认", "保存到相册?", function(ok) {
                    if(ok) {
                        const name = source.toString().split("/").pop()
                        var filepath = (Qt.platform.os === "android") ?
                                    ("/sdcard/Pictures/LearningSystem/" + name) :
                                    (FileUtils.storageLocation(FileUtils.PicturesLocation)+name)
                        if(FileUtils.existsFile(filepath)){
                            toastManager.show("图片已存在!",1000)
                        }else{
                            if(FileUtils.copyFile(source,filepath)){
                                toastManager.show("保存成功!",1000)
                            }else{
                                toastManager.show("保存失败!",1000)
                            }
                        }
                    }
                })
            }
        }
        //        source: "https://felgo.com/web-assets/girl.jpg"
    }
    onPopped: {
        destroy()
    }
}
