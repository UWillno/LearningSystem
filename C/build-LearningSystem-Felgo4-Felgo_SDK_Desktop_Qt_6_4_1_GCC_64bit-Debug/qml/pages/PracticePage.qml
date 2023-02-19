import QtQuick
import Felgo

AppPage {

    title: "练习"

    AppListView {
        delegate: SimpleRow {
            onSelected: console.log("Clicked Item #"+index+": "+JSON.stringify(modelData))
        }
        model: [
            {
                text: "刷题",
                detailText: "Immerse Oneself In Exercises",
                iconType: IconType.apple
            },

            {
                text: "历史错题",
                detailText: "Historical Mistakes",
                iconType: IconType.beer
            },
            {
                text: "模拟考试",
                detailText: "Virtual Exams",
                iconType: IconType.beer
            }
        ]
    }
}
