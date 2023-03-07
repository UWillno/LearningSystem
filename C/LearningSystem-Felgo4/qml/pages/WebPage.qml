import QtQuick
import Felgo
import QtWebView
import QtQuick.Controls


AppPage {
    property alias url : webview.url
    property var ourl

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
