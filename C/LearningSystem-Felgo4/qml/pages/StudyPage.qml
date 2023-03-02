import QtQuick
import Felgo
import QtWebView
AppPage {

    title: "学习模块"

    AppListView {
        //            showSearch: true
        id:studyoptions
        anchors.fill: parent
        //                        model: model1
        model: [
            {
                text: "《计算机应用基础》PDF阅读",
                detailText: "Study From Book",
                iconType: IconType.apple
            },

            {
                text: "学习通Mobile",
                detailText: "Study By CHAOXING ",
                iconType: IconType.beer
            },
        ]
        delegate: SimpleRow {
            onSelected: index=>{
                            console.log(index)

                            var page
                            if(index === 0 ) {
                                //                                page = Qt.createComponent("PdfPage.qml").createObject();
                                //                                Qt.openUrlExternally("http://stackoverflow.com/questions/23001582/how-to-open-a-pdf-file-from-qml/23002658")
                                //                                FileUtils.openFile()
                                if(pdfResource.available) {
                                    toastManager.show("本地已有文件，直接打开",1000);
                                    openPdf()
                                }
                                else {
                                    toastManager.show("文件下载中！",1000)
                                    pdfResource.download()
                                }

                            }
                            if(index === 1 ) {
                                page = Qt.createComponent("XxtWebPage.qml").createObject();
                                studyStack.push(page)
                            }
                            //                            studyStatck.push(page)
                            //                console.log(modelData.id)
                            //                viewDetail(0,modelData)

                        }
        }
    }


    DownloadableResource {
        id: pdfResource
        source: "http://www.orimi.com/pdf-test.pdf"
        storageLocation: FileUtils.DocumentsLocation
        storageName: "pdf-test.pdf"
        extractAsPackage: false
        // if the download is competed, available will be set to true
        onAvailableChanged: if(available) openPdf()
    }
    function openPdf() {
        // you can also open files with nativeUtils.openUrl() now (for paths starting with "file://")
        //nativeUtils.openUrl(pdfResource.storagePath)
        // with V-Play 2.17.0 you can also use fileUtils.openFile()
        fileUtils.openFile(pdfResource.storagePath)
    }
    //    WebView {
    //        id:webview
    //        anchors.fill: parent

    //        url:  "https://www.baidu.com"
    //        Component.onCompleted: {
    //            webview.url="https://www.baidu.com"
    //        }
    //    }
}
