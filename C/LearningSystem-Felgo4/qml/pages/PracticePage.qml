import QtQuick
import Felgo
import QtWebView

AppPage {

    title: "练习"

    AppListView {
        delegate: SimpleRow {
            onSelected: index => {
                            var p
                            switch(index){
                                case 0:{
                                    p = Qt.createComponent("ExercisesPage.qml").createObject(parent)
                                    break;
                                }
                            }
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
            }
        ]

    }
}
