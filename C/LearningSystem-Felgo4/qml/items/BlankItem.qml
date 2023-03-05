import QtQuick
import Felgo

AppListItem {

    property string answer
    property alias myanswer : blankInput.text
    property alias result: resultIcon.visible
    leftItem: AppTextInput{
        id:blankInput
        placeholderText: "填空"
        width: dp(200)
//        onTextChanged: {
//            console.log(answer)
//            console.log(myanswer)
//            console.log(answer === myanswer)
//        }
    }

    rightItem: AppIcon {
        id:resultIcon
        visible: false
        iconType: (answer === myanswer) ? IconType.check : IconType.remove
        color: (answer === myanswer) ? "green" : "red"
    }
}
