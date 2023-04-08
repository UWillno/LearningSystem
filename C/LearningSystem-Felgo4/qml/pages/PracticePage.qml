import QtQuick
import Felgo
import QtWebView

AppPage {

    title: "练习"
    id:ppage

    AppListView {
        delegate: SimpleRow {
            onSelected: index => {
                            var p
                            switch(index){
                                case 0:{
                                    p = Qt.createComponent("ExercisesPage.qml").createObject(parent)

                                    break;
                                }
                                case 1:{
                                    p = Qt.createComponent("HistoryWrongQuestionsPage.qml").createObject(parent)
                                    break
                                }
                                case 2:{

                                    examDialog.open()

                                    //                                    p = Qt.createComponent("VirtualExamPage.qml").createObject(parent)
                                    break
                                }
                            }
                            if(p)
                            practiceStack.push(p)
                        }
        }
        model: [
            {
                text: "刷题",
                detailText: "Immerse Oneself In Exercises",
                icon: IconType.question
            },

            {
                text: "历史错题",
                detailText: "Historical Mistakes",
                icon: IconType.history
            },
            {
                text: "模拟考试",
                detailText: "Virtual Exams",
                icon: IconType.pencil
            },
        ]

    }

    Dialog {
        id: examDialog
        z:10
        title: "题量设置"
        positiveActionLabel: "确定"
        negativeActionLabel: "取消"
        onCanceled: close()
        onAccepted: {
            const  p = Qt.createComponent("VirtualExamPage.qml").createObject(parent,{cCount:choiceSlider.value,tCount:trueOrFalseSlider.value,cCount:fillSlider.value})
            practiceStack.push(p)
            close()
        }

        Column {
            anchors.centerIn: parent
            AppText {
                text:"选择题:"+choiceSlider.value
            }
            AppSlider {
                id:choiceSlider
                from: 1
                value: 2
                stepSize : 1
                to: 50
            }
            AppText {
                text:"判断题:"+trueOrFalseSlider.value
            }
            AppSlider {
                id:trueOrFalseSlider
                from: 1
                value: 2
                stepSize : 1
                to: 50
            }
            AppText {
                text:"填空题:"+fillSlider.value
            }
            AppSlider {
                id:fillSlider
                from: 1
                value: 1
                to: 30
                stepSize : 1
            }
        }



    }
}
