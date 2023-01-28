﻿import Felgo 3.0
import QtQuick 2.0
import "pages"
import "items/toast"
import "logic"
App {
    id:main
    dpScale: 1
    //    property NavigationStack rootStack: rootStack
    // You get free licenseKeys from https://felgo.com/licenseKey
    // With a licenseKey you can:
    //  * Publish your games & apps for the app stores
    //  * Remove the Felgo Splash Screen or set a custom one (available with the Pro Licenses)
    //  * Add plugins to monetize, analyze & improve your apps (available with the Pro Licenses)
    //licenseKey: "<generate one from https://felgo.com/licenseKey>"

    NavigationStack {
        id:rootStack
        anchors.fill: parent

        IndexPage {
            id: indexPage
            //            anchors.horizontalCenter: parent.horizontalCenter
        }

    }



    ToastManager {
        id:toastManager
        //        x:0
    }

    AdminLogic {
        id: adminLogic

    }
//    Component.onCompleted: {
//        adminLogic.insertChoiceQuestion.connect(qm.sendChoiceQuestion)
//    }
}
