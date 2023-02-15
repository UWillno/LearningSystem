import QtQuick 2.0
import Felgo 3.0


Rectangle {
    property alias text: appTextEdit.text
    property alias  placeholderText: appTextEdit.placeholderText
    property alias appTextEdit: appTextEdit
    //    property alias  cursorPosition
    width: parent.width
    height: dp(100)
    AppFlickable {
        id: flick
        anchors.fill: parent
        contentWidth: width
        contentHeight: appTextEdit.height

        AppTextEdit {
            id:appTextEdit
            //            anchors.fill: parent
            width: parent.width
            height: Math.max(appTextEdit.contentHeight, flick.height)
            verticalAlignment: TextEdit.AlignTop
            wrapMode: AppTextEdit.WrapAnywhere
            // This enables the text field to automatically scroll if cursor moves outside while typing
            cursorInView: true
            flickable: flick
            cursorInViewBottomPadding: dp(25)
            cursorInViewTopPadding: dp(25)
            //            cursorPosition: text.length
            //            cursorPosition
        }
    }
    ScrollIndicator {
        flickable: flick
    }
    //    border.

}
