import QtQuick
import Felgo
import QtWebView
import QtQuick.Controls


AppPage {
    property alias url : webview.url

    WebView {
        id:webview
        anchors.fill: parent


    }
    Component.onCompleted:{
    }

    onPopped: {
       destroy()
    }

}
