import QtQuick 2.0
import Felgo 3.0
import QtQuick.Controls 2.0 as QuickControls2


QuickControls2.SwipeView {
    id: insertSwipeView
     anchors.fill: parent
//    anchors.top: appTabBar.bottom
//    anchors.bottom: parent.bottom
//    width: parent.width
    //        clip: true
    //        anchors.fill: parent
    currentIndex: 0
    orientation: Qt.Horizontal

    ChoiceQuestionItem {
    }

    TrueOrFalseQuestionItem {

    }
    FillInTheBlanksQuestionItem {

    }

}

