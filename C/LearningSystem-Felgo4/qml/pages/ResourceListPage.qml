import QtQuick
import Felgo
import QtQuick.Controls
import "../items"

ListPage {
    id:reslistPage

    title:"资源列表"
    model: ListModel {}
    section.property: "typeText"




    delegate:ResourceRow {}

    Component.onCompleted:{
        var arr = logic.getAllResources()
        arr.forEach(function(obj) {
            reslistPage.model.append(obj);
        })
    }

}
