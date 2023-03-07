import QtQuick
import Felgo

AppListItem {

    property string answer
    property alias myanswer : blankInput.text
    property alias resultDisplay: resultIcon.visible
    property bool result: (answer === myanswer)
    leftItem: AppTextInput{
        id:blankInput
        placeholderText: "填空"
        width: dp(250)
        height: parent.height
        clip: true
    }

    rightItem: AppIcon {
        id:resultIcon
        height: parent.height
        visible: false
        iconType: result ? IconType.check : IconType.remove
        color: result ? "green" : "red"
    }
}
