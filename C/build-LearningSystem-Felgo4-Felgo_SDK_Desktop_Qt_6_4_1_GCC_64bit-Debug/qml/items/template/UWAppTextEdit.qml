import QtQuick
import Felgo
//import QtQuick.Controls


Rectangle {
    property alias text: appTextEdit.text
    property alias  placeholderText: appTextEdit.placeholderText
    property alias appTextEdit: appTextEdit
    property alias textFormat :  appTextEdit.textFormat
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
//            cursorVisible: false
            //            cursorPosition: text.length
            //            cursorPosition
            onTextChanged: {
                console.log(text)
            }
        }
    }


    AppScrollIndicator {
        flickable: flick
    }
    //    border.

}
