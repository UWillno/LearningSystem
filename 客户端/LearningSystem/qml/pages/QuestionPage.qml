import QtQuick 2.0
import Felgo 3.0
import "../items"
import QtQuick 2.9

import QtQuick.Controls 2.0 as QuickControls2
Page {
    title: "题目编辑"
    AppTabBar{
        id:appTabBar
        contentContainer: questionSwipeView

        AppTabButton {
            text: "选择题"
        }
        AppTabButton {
            text: "判断题"
        }
        AppTabButton {
            text: "填空题"
        }
    }

    QuickControls2.SwipeView {
        id: questionSwipeView
        anchors.top: appTabBar.bottom
        anchors.bottom: parent.bottom
        width: parent.width
        clip: true

        ChoiceQuestionItem {

        }

        TrueOrFalseQuestionItem {

        }
        FillInTheBlanksQuestionItem {

        }
    }


}
