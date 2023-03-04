import QtQuick
import Felgo

ListPage {

    title: "学习资源管理"

    model:[
        {
            text: "添加资源",
            detailText: "Add Question",
            //            icon: IconType.apple
        },
        {
            text: "查看/删除/修改资源",
            detailText: "Select & Update Questions",
        }
    ]

    delegate: SimpleRow {

        onSelected: index => {
                        var p
                        if(index === 0){
                            p =  Qt.createComponent("AddResourcePage.qml").createObject(parent);
//                            rootStack.push(p)
                        }
                        if(index===1){
                            p =  Qt.createComponent("ResourceListPage.qml").createObject(parent);

                        }
                        rootStack.push(p)
                    }

    }

}
