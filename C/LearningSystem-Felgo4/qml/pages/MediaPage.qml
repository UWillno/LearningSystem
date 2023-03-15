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
    backgroundColor: "black"

    navigationBarHidden: width > height
    Column {

        width:parent.width
        height: parent.height
        //        anchors.fill: parent

        AppFlickable {
            width: parent.width
            height: parent.height
            MediaPlayer {
                id: mediaplayer
                videoOutput: output
                loops: MediaPlayer.Infinite
                playbackRate: 1.0
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
            height: progressSlider.height
            width: parent.width - dp(40)
            anchors.horizontalCenter: parent.horizontalCenter

            AppIcon {
                id:iconPlay
                iconType: playArea.playing ? IconType.pause: IconType.playcircle
                height: progressSlider.height
                color: "white"
                MouseArea {
                    property bool playing: true
                    id: playArea
                    anchors.fill: parent
                    onClicked: {
                        if(playing){
                            mediaplayer.pause()
                            playing = false
                            //                            navigationBarHidden = true
                        }
                        else{
                            mediaplayer.play()
                            playing = true
                            //                            navigationBarHidden = false
                        }
                    }
                }
            }

            Slider {
                id: progressSlider
                width: parent.width - iconPlay.width - speedText.width
                from: 0
                to: mediaplayer.duration
                value: mediaplayer.position
                onValueChanged: {
                    mediaplayer.position = value
                }
            }

            AppText {
                id:speedText
                text:"x"+mediaplayer.playbackRate
                width: dp(20)
                height: progressSlider.height
                color: "white"
                MouseArea{
                    anchors.fill: parent
                    onClicked: {
                        speedMenu.popup()
                    }
                }
            }






            //            AppIcon {
            //                id:iconFull
            //                iconType: IconType.squareo
            //                MouseArea {
            //                    anchors.fill: parent
            //                    onClicked: {
            //                        ori =  (ori===90)? 0 :90
            //                        if(ori===90){
            //                            mediaPage.navigationBarHidden = true
            //                            navMode = 4
            //                        }else {
            //                            mediaPage.navigationBarHidden = false
            //                            navMode = 3
            //                        }
            //                    }
            //                }
            //            }
        }
    }

    Menu {
        id:speedMenu
        parent: speedText
        //        anchors.centerIn: parent
        opacity: 0.7
        Action {
            text: "x0.5"
            onTriggered: {
                mediaplayer.playbackRate = 0.5
            }
        }
        Action {
            text: "x1.0"
            onTriggered: {
                mediaplayer.playbackRate = 1.0
            }
        }
        Action {
            text: "x1.5"
            onTriggered: {
                mediaplayer.playbackRate = 1.5
            }
        }
        Action {
            text: "x2.0"
            onTriggered: {
                mediaplayer.playbackRate = 2.0
            }
        }

    }


    Component.onCompleted: {
                navMode = 4

        mediaplayer.play()
    }
    onPopped: {
        //        destroy()
        navMode = 3
        mediaplayer.stop()

        //        destroy()
    }

}
