import QtQuick
import Felgo
import QtWebView
AppPage {

    title: "课程学习"

    AppListView {
        //            showSearch: true
        id:studyoptions
        anchors.fill: parent
        //                        model: model1
        model: [
            {
                text: "文档学习",
                detailText: "Study From DOC/PPT/PDF……",
                icon: IconType.file
            },

            {
                text: "图片学习",
                detailText: "Study By Images",
                icon: IconType.image
            },
            {
                text: "视频学习",
                detailText: "Study By Video",
                icon: IconType.filevideoo
            },
            {
                text: "WEB学习",
                detailText: "Study By WEB",
                icon: IconType.weixin
            },
            {
                text: "学习通学习",
                detailText: "Study By ChaoXing",
                icon: IconType.star
            }
        ]
        delegate: SimpleRow {

            onSelected: index=>{
                            console.log(index)
                            if(index !== 4){
                            var page
                            userLogic.getResourcesByType(index)
                            }
                            if(index === 4){
                                var p = Qt.createComponent("XxtWebPage.qml").createObject(parent,{title:"学习通",url:"https://mooc1.chaoxing.com/course/phone/courselisthead?passed=1"})
                                studyStack.push(p)
                            }

                            //                            switch(index){
                            //                                case 0:{
                            //                                    userLogic.getResourcesByType(index)
                            //                                    break;
                            //                                }
                            //                                case 1:{
                            //                                    break;
                            //                                }
                            //                                case 2:{
                            //                                    break;
                            //                                }
                            //                                case 3:{
                            //                                    break;
                            //                                }

                            //                            }

                            //                            if(index === 0 ) {
                            //                                //                                page = Qt.createComponent("PdfPage.qml").createObject();
                            //                                //                                Qt.openUrlExternally("http://stackoverflow.com/questions/23001582/how-to-open-a-pdf-file-from-qml/23002658")
                            //                                //                                FileUtils.openFile()
                            //                                if(pdfResource.available) {
                            //                                    toastManager.show("本地已有文件，直接打开",1000);
                            //                                    openPdf()
                            //                                }
                            //                                else {
                            //                                    toastManager.show("文件下载中！",1000)
                            //                                    pdfResource.download()
                            //                                }

                            //                            }
                            //                            if(index === 1 ) {
                            //                                page = Qt.createComponent("XxtWebPage.qml").createObject();
                            //                                studyStack.push(page)
                            //                            }
                            //                            studyStatck.push(page)
                            //                console.log(modelData.id)
                            //                viewDetail(0,modelData)

                        }
        }
    }


    Connections {
        target: userLogic
        onGetResourcesSucceed: function(json,type){

            var t
            switch(type){
            case 0:{
                t = "文档资源"
                break
            }
            case 1:{
                t = "图片资源"
                break
            }
            case 2:{
                t = "视频资源"
                break
            }
            case 3:{
                t = "WEB资源"
                break
            }
            }
            if(t){
                 var p =Qt.createComponent("UserResourcesListPage.qml").createObject(parent,{title:t,data:json})
                 studyStack.push(p)
            }
        }

    }

}
