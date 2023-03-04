import QtQuick
import Felgo
import QtMultimedia
import QtQuick.Controls
import QtQuick.Window
AppPage {
    id:mediaPage
    property alias ori: output.orientation
    property alias source: mediaplayer.source
    title: "视频学习"
    Column {
        width:parent.width
        height: parent.height

        AppFlickable {
            width: parent.width
            height: parent.height
            MediaPlayer {
                id: mediaplayer
                videoOutput: output
                loops: MediaPlayer.Infinite
            }

            VideoOutput {
                id: output
                anchors.fill: parent
                //                height: contentRect
            }

            MouseArea{
                anchors.fill: parent
                onPressAndHold: {
                    NativeDialog.confirm("确认", "保存到相册?", function(ok) {
                        if(ok) {
                            const name = source.toString().split("/").pop()
                            var filepath = (Qt.platform.os === "android") ?
                                        ("/sdcard/Pictures/LearningSystem/" + name) :
                                        (FileUtils.storageLocation(FileUtils.PicturesLocation)+name)
                            if(FileUtils.existsFile(filepath)){
                                toastManager.show("视频已存在!",1000)
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
        }


        Row {

            id:btnsRow
            anchors.bottom: parent.bottom
            width: parent.width - dp(10)
            anchors.horizontalCenter: parent.horizontalCenter

            AppIcon {
                id:iconPlay
                iconType: playArea.playing ? IconType.pause: IconType.playcircle
                MouseArea {
                    property bool playing: true
                    id: playArea
                    anchors.fill: parent
                    onClicked: {
                        if(playing){
                            mediaplayer.pause()
                            playing = false
                            navigationBarHidden = true
                        }
                        else{
                            mediaplayer.play()
                            playing = true
                            navigationBarHidden = false
                        }
                    }
                }
            }

            Slider {
                id: progressSlider
                width: parent.width - iconFull.width - iconPlay.width
                from: 0
                to: mediaplayer.duration
                value: mediaplayer.position
                onValueChanged: {
                    mediaplayer.position = value
                }
            }

            AppIcon {
                id:iconFull

                iconType: IconType.squareo
                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        ori =  (ori==90)? 0 :90
                        if(ori===90){
                            mediaPage.navigationBarHidden = true
                            navMode = 4
                        }else {
                            mediaPage.navigationBarHidden = false
                            navMode = 3
                        }
                    }
                }
            }
        }
    }

    Component.onCompleted: mediaplayer.play()
    onPopped: {
//        mediaplayer.stop()
       navMode = 3
       destroy()
    }

}
