import QtQuick
import Felgo
import QtWebView
import QtQuick.Controls


AppPage {
    id:webPage
    property bool canPop : false
    property alias url : webview.url
    //    property string url
    //    property var ourl

    WebView {
        id:webview
        anchors.fill: parent
    }
    // Android含WebView的话必须要有Pop拦截判断，不然全面屏手势下，会直接退出程序？？
    onWillPop: {
        event.accepted = canPop
        if(!canPop){
            NativeDialog.confirm("确认", "确定退出?", function(ok) {
                if(ok){
                    canPop = ok
                    popped()
                }
            })}
    }

    onPopped: {
        destroy()
    }

}
