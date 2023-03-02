import QtQuick
import Felgo
import QtQuick.Controls
import "../items/template"
AppPage {
    id:page
    title: "添加资源"

    property string uploadStatus : "未上传"

    property alias name: rnameInput.text
    property alias info: rinfoEdit.text
    property alias url: urlInput.text
    property alias type: ratioButtonGroup1.checkedButton

    property var model

    AppFlickable {
        id: appFlickable
        anchors.fill: parent
        contentHeight: content.height
        Column {
            id:content
            width: parent.width
            //        height: parent.height
            SimpleSection {
                title: "资源类型: " + ratioButtonGroup1.checkedButton.value
            }

            ButtonGroup {
                id: ratioButtonGroup1
                buttons: [radio1, radio2, radio3,radio4]
            }

            AppListItem {
                text: "文档资源"
                showDisclosure: false

                leftItem: AppRadio {
                    id: radio1
                    checked: true
                    value: 0
                    anchors.verticalCenter: parent.verticalCenter
                }

                onSelected: {
                    if(!radio1.checked) radio1.toggle()
                }
            }

            AppListItem {
                text: "图片资源"
                showDisclosure: false

                leftItem: AppRadio {
                    id: radio2
                    value: 1
                    anchors.verticalCenter: parent.verticalCenter
                }

                onSelected: {
                    if(!radio2.checked) radio2.toggle()
                }
            }

            AppListItem {
                text: "视频资源"
                showDisclosure: false
                lastInSection: true

                leftItem: AppRadio {
                    id: radio3
                    value: 2
                    anchors.verticalCenter: parent.verticalCenter
                }

                onSelected: {
                    if(!radio3.checked) radio3.toggle()
                }
            }
            AppListItem {
                text: "WEB资源"
                showDisclosure: false
                lastInSection: true

                leftItem: AppRadio {
                    id: radio4
                    value: 3
                    anchors.verticalCenter: parent.verticalCenter
                }

                onSelected: {
                    if(!radio4.checked) radio4.toggle()
                }
            }
            Rectangle {
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width - dp(20)
                height: col.height

                Column {
                    id:col
                    spacing: dp(10)
                    width: parent.width
                    AppTextInput {
                        id:rnameInput
                        //                    anchors.fill: parent
                        height: dp(30)
                        width: parent.width

                        placeholderText: "资源名:"
                        //                        clip: true
                    }
                    UWAppTextEdit {
                        id:rinfoEdit
                        height: dp(200)
                        width: parent.width
                        placeholderText: "资源简介:"
                    }

                    AppText {
                        //                    anchors.fill: parent
                        height: dp(30)
                        width: parent.width
                        text: "资源状态:" + uploadStatus
                    }

                    AppButton {
                        id:localUploadBtn
                        text: "本地资源上传"
                        onClicked: {
                            NativeUtils.displayFilePicker("选择文件");
                        }
                    }
                    CheckBox {
                        id:checkbox
                        text: "非本地资源"
                    }
                    AppTextInput {
                        id:urlInput
                        //                        visible: false
                        height: dp(30)
                        width: parent.width
                        enabled: (checkbox.checkState == Qt.Checked)? true:false
                        placeholderText: "资源URL"
                    }

                    AppButton {
                        anchors.horizontalCenter: parent.horizontalCenter
                        text:"提交"
                        onClicked: {
                            submit()
                        }

                    }
                }

            }
        }
        AppScrollIndicator {
            flickable: appFlickable
        }
    }
    Connections {
        target: qm
        onUploadResourceSucceed: url =>{
                                     //                                     console.log("qml:"+url)
                                     urlInput.text = url
                                     uploadStatus = "上传完成"
                                 }
    }
    Connections {
        target: NativeUtils
        onFilePickerFinished:(accepted,files)=>{
                                 if(accepted){
                                     localUploadBtn.enabled = false
                                     var s = files[0].toString()
                                     var list =s.split('/')
                                     rnameInput.text = list.pop()
                                     info = rnameInput.text.split(".")[0]
                                     qm.upload(files[0])
                                     uploadStatus = "上传中"

                                 }
                             }
    }

    function submit(){
        //        console.log(type.value)
        if(name.trim()!==""&&info.trim()!==""&&url.trim()!==""){
            if(adminLogic.submitResource(name.trim(),info.trim(),url.trim(),type.value)){
                toastManager.show("添加成功",1000);
                popped()
            }
        }else{
            toastManager.show("数据异常",1000);
        }
    }

    Component.onCompleted:{
        if(model){
            console.log("编辑模式")
            title = "编辑资源"
            name = model.name
            info = model.info
            url = model.url
            uploadStatus = "上传完成"
            switch(model.type){
            case 0:{
//                radio1.toggle()
                break
            }
            case 1:{
                radio2.toggle()
                break
            }
            case 2:{
                radio3.toggle()
                break
            }
            case 3:{
                checkbox.toggle()
                radio4.toggle()
                break
            }
            }

        }else{
             console.log("添加模式")

        }
    }

    onPopped: {
        destroy()
    }
}
