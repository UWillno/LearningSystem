import QtQuick
import Felgo
import QtQuick.Controls
import QtWebView

//PdfPageView {
//    document: PdfDocument {
//        source :"https://see.xidian.edu.cn/faculty/lpxu/pdf/qwzda.pdf"
//    }
//}
AppPage {

    property alias url: wv.url
    WebView {
        anchors.fill: parent

        id:wv



    }
}
