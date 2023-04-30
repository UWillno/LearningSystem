import QtQuick
import Felgo
import QtQuick.Controls
import "../items"

ListPage {
    id:reslistPage

    property alias origModel: jsonListModel
    title:"资源列表"
    model: proxyModel
    section.property: "typeText"
    delegate:ResourceRow {}
//    search:
    showSearch: true

    onSearch: function(term){
        regFilter.pattern = term
    }
//    ListModel {
//        id:listmodel
//    }
    JsonListModel {
        id:jsonListModel
//        source:

    }

    SortFilterProxyModel {
        id:proxyModel
        sourceModel: jsonListModel


        filters: RegExpFilter{
            id: regFilter
            roleName: "name"
        }
    }


    Component.onCompleted:{
//        var arr = logic.getAllResources()
//        arr.forEach(function(obj) {
////            reslistPage.model.append(obj);
//            listmodel.append(obj)
//        })
        console.log(JSON.stringify(logic.getAllResources()))
        jsonListModel.source = logic.getAllResources()
        section.property="typeText"
    }

    function refresh(){
        jsonListModel.clear()
        jsonListModel.source = logic.getAllResources()
//        reslistPage.model.clear()
//        var arr = logic.getAllResources()
//        arr.forEach(function(obj) {
//            reslistPage.model.append(obj);
//        })
        section.property= "typeText"
    }


}
