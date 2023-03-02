import QtQuick
import Felgo

Rectangle {
    width: parent.width
    height: dp(150)
    clip: true
    Column {
        width: parent.width - dp(20)
        anchors.horizontalCenter: parent.horizontalCenter

        AppText {
            text:model.name
            color:Theme.textColor

        }
        AppText {
            text:model.info
            color:Theme.secondaryTextColor
            wrapMode: AppText.WrapAnywhere
            height: dp(50)
            clip:true
        }

        Row {
            AppButton {
                text: "修改"
                onClicked: {
                    var p = Qt.createComponent("../pages/AddResourcePage.qml").createObject(parent,{model:model})
                    rootStack.push(p)
                }
            }
            AppButton {
                text: "删除"
                onClicked: {
                    if(adminLogic.deleteResource(model.id)){
                        reslistPage.model.remove(index,1)
                        toastManager.show("删除成功!",1000)
                    }
                }
            }
            AppButton {
                text: "查看"
                onClicked: {

                }

            }
        }

    }

}
