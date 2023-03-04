import QtQuick
import Felgo
import QtQuick.Controls
Rectangle {
     property alias modelData: jsonlistModel.source
    property alias cellHeight: gridView.cellHeight
    property alias cellWidth: gridView.cellWidth
    GridView {
        id:gridView

        anchors.fill: parent
        leftMargin: dp(40)
        topMargin: dp(10)
        bottomMargin: dp(10)
        cellHeight: dp(70)
        cellWidth: dp(100)

        model: JsonListModel {
            id:jsonlistModel
        }
        delegate: QuestionRect {
            state: "wrong"
            width: cellWidth - 8
            height: cellHeight - 8
        }

    }
}
