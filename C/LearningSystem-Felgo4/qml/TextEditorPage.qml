import QtQuick
import Felgo
import QtQuick.Controls
import QtQuick.Layouts
import io.qt.examples.texteditor
import QtQuick.Dialogs
import Qt.labs.platform as Platform

/* 改自官方例子的touch里的texteditor.qml ，
因为尝试了各种方法都没能让ApplicationWindow在安卓上直接加载出来，
除非不用Felgo，只好写进AppPage了 */

AppPage {

    title: "文本编辑器"
    rightBarItem: IconButtonBarItem {
        property bool rich: true
        iconType: rich ?  IconType.html5 : IconType.undo
        onClicked: {
            textArea.textFormat = rich ? Qt.PlainText : Qt.RichText
            rich = !rich
        }
    }

    Flickable {
        id: flickable
        flickableDirection: Flickable.VerticalFlick
        //        anchors.fill: parent.height - toolbar.height
        height:  parent.height - toolbar.height
        width: parent.width

        TextArea.flickable: TextArea {
            id: textArea
            textFormat: Qt.RichText
            wrapMode: TextArea.Wrap
            readOnly: true
            persistentSelection: true
            // Different styles have different padding and background
            // decorations, but since this editor is almost taking up the
            // entire window, we don't need them.
            leftPadding: 6
            rightPadding: 6
            topPadding: 0
            bottomPadding: 0
            background: null

            onLinkActivated: Qt.openUrlExternally(link)
        }

        ScrollBar.vertical: ScrollBar {}
    }


    ToolBar {
        id:toolbar
        anchors.bottom: parent.bottom
        visible: !textArea.readOnly && textArea.activeFocus
        width: parent.width
        Flickable {
            anchors.fill: parent
            contentWidth: toolRow.implicitWidth
            flickableDirection: Qt.Horizontal
            boundsBehavior: Flickable.StopAtBounds

            Row {
                id: toolRow
                ToolButton {
                    id: openButton
                    text: "\uF115" // icon-folder-open-empty
                    font.family: "fontello"
                    onClicked: openDialog.open()
                    focusPolicy: Qt.TabFocus
                }
                ToolButton {
                    id: saveButton
                    text: "\uE800" // icon-folder-open-empty
                    font.family: "fontello1"
                    //                    onClicked: qm.getFile()
                    onClicked: saveDialog.open()
                    //                    onClicked: saveAsDialog.open()
                    focusPolicy: Qt.TabFocus
                }
                ToolSeparator {}
                ToolButton {
                    id: boldButton
                    text: "\uE800" // icon-bold
                    font.family: "fontello"
                    // Don't want to close the virtual keyboard when this is clicked.
                    focusPolicy: Qt.NoFocus
                    checkable: true
                    checked: document.bold
                    onClicked: document.bold = !document.bold
                }
                ToolButton {
                    id: italicButton
                    text: "\uE801" // icon-italic
                    font.family: "fontello"
                    focusPolicy: Qt.NoFocus
                    checkable: true
                    checked: document.italic
                    onClicked: document.italic = !document.italic
                }
                ToolButton {
                    id: underlineButton
                    text: "\uF0CD" // icon-underline
                    font.family: "fontello"
                    focusPolicy: Qt.NoFocus
                    checkable: true
                    checked: document.underline
                    onClicked: document.underline = !document.underline
                }
                ToolButton {
                    id: strikeoutButton
                    text: "\uF0CC"
                    font.family: "fontello"
                    focusPolicy: Qt.TabFocus
                    checkable: true
                    checked: document.strikeout
                    onClicked: document.strikeout = !document.strikeout
                }
                ToolSeparator {}

                ToolButton {
                    id: alignLeftButton
                    text: "\uE803" // icon-align-left
                    font.family: "fontello"
                    focusPolicy: Qt.NoFocus
                    checkable: true
                    checked: document.alignment == Qt.AlignLeft
                    onClicked: document.alignment = Qt.AlignLeft
                }
                ToolButton {
                    id: alignCenterButton
                    text: "\uE804" // icon-align-center
                    font.family: "fontello"
                    focusPolicy: Qt.NoFocus
                    checkable: true
                    checked: document.alignment == Qt.AlignHCenter
                    onClicked: document.alignment = Qt.AlignHCenter
                }
                ToolButton {
                    id: alignRightButton
                    text: "\uE805" // icon-align-right
                    font.family: "fontello"
                    focusPolicy: Qt.NoFocus
                    checkable: true
                    checked: document.alignment == Qt.AlignRight
                    onClicked: document.alignment = Qt.AlignRight
                }
                ToolButton {
                    id: alignJustifyButton
                    text: "\uE806" // icon-align-justify
                    font.family: "fontello"
                    focusPolicy: Qt.NoFocus
                    checkable: true
                    checked: document.alignment == Qt.AlignJustify
                    onClicked: document.alignment = Qt.AlignJustify
                }
            }
        }
    }
    FileDialog {
        id: openDialog
        fileMode: FileDialog.OpenFile
        selectedNameFilter.index: 1
        nameFilters: ["Text files (*.txt)", "HTML files (*.html *.htm)", "Markdown files (*.md *.markdown)"]
        currentFolder: StandardPaths.writableLocation(StandardPaths.DocumentsLocation)
        onAccepted: document.load(selectedFile)
    }

    //?????? android 13 Miui14 没能成功获取路径，只能创建个文件??? selectedFile一直为空,
    //    Felgo的NativeUtils也不能获取原文件路径
    //    widgets 的方法也不行 估计是用qt实现不了
    //    ……应该可以获取root权限然后用shell写，目前不折腾了。。。
    //    FileDialog {
    //        id: saveDialog
    //        fileMode: FileDialog.SaveFile
    //        //        defaultSuffix: document.fileType
    //        defaultSuffix: "txt"
    //        nameFilters: openDialog.nameFilters

    //        currentFolder: StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]
    //        onAccepted: document.saveAs(selectedFile)
    //    }

    MessageDialog {
        title: qsTr("保存操作")
        id: saveDialog
        onButtonClicked: {
            close()
        }
    }

    MessageDialog {
        title: qsTr("Error")
        id: errorDialog
        onButtonClicked: {
            close()
        }
    }

    RoundButton {
        id: editButton
        font.family: "fontello"
        text: "\uE809" // icon-pencil
        width: 48
        height: width
        // Don't want to use anchors for the y position, because it will anchor
        // to the footer, leaving a large vertical gap.
        y: parent.height - height - 12
        anchors.right: parent.right
        anchors.margins: 12
        visible: textArea.readOnly
        highlighted: true

        onClicked: {
            textArea.readOnly = false
            // Force focus on the text area so the cursor and footer show up.
            textArea.forceActiveFocus()
        }
    }

    DocumentHandler {
        id: document
        document: textArea.textDocument
        cursorPosition: textArea.cursorPosition
        selectionStart: textArea.selectionStart
        selectionEnd: textArea.selectionEnd

        property alias family: document.font.family
        property alias bold: document.font.bold
        property alias italic: document.font.italic
        property alias underline: document.font.underline
        property alias strikeout: document.font.strikeout
        property alias size: document.font.pointSize

        Component.onCompleted: {
            if (Qt.application.arguments.length === 2)
                document.load("file:" + Qt.application.arguments[1]);
            else
                document.load("qrc:/texteditor.html")
        }
        onLoaded: function (text, format) {
            textArea.textFormat = format
            textArea.text = text
        }
        onError: function (message) {
            errorDialog.text = message
            errorDialog.open()
        }
    }



    onPopped: {
        navMode = 3
        destroy()
    }
    Component.onCompleted:{
        navMode = 4
        //        Component.onCompleted: {
        //        x = Screen.width / 2 - width / 2
        //        y = Screen.height / 2 - height / 2
        //        }
    }

}
