import QtQuick 2.0
import Felgo 3.0
import QtWebView 1.1

Page {

    title: "New Page"

    WebView {
        id:webview
        anchors.fill: parent

        url:  "https://www.baidu.com"
//        Component.onCompleted: {
//            webview.url="https://www.baidu.com"
//        }
    }


}
