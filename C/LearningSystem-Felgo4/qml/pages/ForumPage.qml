import QtQuick
import Felgo

AppPage {

    title: "论坛"
    AppListView {
        delegate: SimpleRow {
            onSelected: index=>{

                            if(index === 0 ){
                               var page = Qt.createComponent("PostingPage.qml").createObject(parent)
                               forumStatck.push(page)
                            }



                        }
        }
        model: [
            {
                text: "发帖",
                detailText: "Immerse Oneself In Exercises",
                iconType: IconType.apple
            },

            {
                text: "看贴",
                detailText: "Historical Mistakes",
                iconType: IconType.beer
            },
        ]


    }

}
