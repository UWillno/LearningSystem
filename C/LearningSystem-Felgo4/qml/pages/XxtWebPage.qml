import QtQuick
import Felgo
import QtQuick.Controls
import QtWebView

AppPage {

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
