
//#ifdef QT_WIDGETS_LIB
//#include <QApplication>
//#else
//#include <QGuiApplication>
//#endif
#include <QFontDatabase>

#include <QApplication>
#include <FelgoApplication>
//#include <QtCore>
#include <QQmlApplicationEngine>
//#include <QtWebEngineQuick>
#include <QtQml>
#ifdef __ANDROID__
#include<QtWebView>
#else
#include <QtWebEngineQuick>
#endif

//#include <QQmlContext>
#include "qmlmediator.h"
#include "settings.h"

//#include <QtWebView>
//#include <QDebug>
#include "documenthandler.h"
// uncomment this line to add the Live Client Module and use live reloading with your custom C++ code
//#include <FelgoLiveClient>

int main(int argc, char *argv[])
{


    QApplication app(argc, argv);
    #ifdef __ANDROID__
         QtWebView::initialize();
    #else
         QtWebEngineQuick::initialize();
     #endif

    app.setOrganizationName("UWillno");
    app.setOrganizationDomain("uwillno.icu");
    app.setApplicationName("Learning System-Felgo4");
    //    if (QFontDatabase::addApplicationFont(":/fonts/fontello.ttf") == -1)
    //        qWarning() << "Failed to load fontello.ttf";
    QFontDatabase::addApplicationFont(":/fonts/fontello.ttf");
    QFontDatabase::addApplicationFont(":/fonts/fontello1.ttf");

    FelgoApplication felgo;

    // Use platform-specific fonts instead of Felgo's default font
    felgo.setPreservePlatformFonts(true);
    //    QtWebView::initialize();

    QQmlApplicationEngine engine;


    QmlMediator qmlMediator;
    Settings settings;
    engine.rootContext()->setContextProperty("qm",&qmlMediator);
    engine.rootContext()->setContextProperty("ss",&settings);
    qmlRegisterType<DocumentHandler>("io.qt.examples.texteditor", 1, 0, "DocumentHandler");
    //    qmlRegisterType<QmlMediator>("Uwillno.qm",1,0,"QmlMediator");
    //    qmlRegisterType<Settings>("UWillno.ss",1,0,"Settings");
    felgo.initialize(&engine);

    //    // Set an optional license key from project file
    //    // This does not work if using Felgo Live, only for Felgo Cloud Builds and local builds
    felgo.setLicenseKey(PRODUCT_LICENSE_KEY);

    //    // use this during development
    //    // for PUBLISHING, use the entry point below
    felgo.setMainQmlFileName(QStringLiteral("qml/Main.qml"));

    // use this instead of the above call to avoid deployment of the qml files and compile them into the binary with qt's resource system qrc
    // this is the preferred deployment option for publishing games to the app stores, because then your qml files and js files are protected
    // to avoid deployment of your qml files and images, also comment the DEPLOYMENTFOLDERS command in the .pro file
    // also see the .pro file for more details
    felgo.setMainQmlFileName(QStringLiteral("qrc:/qml/Main.qml"));

    engine.load(QUrl(felgo.mainQmlFileName()));

    //    qmlMediator.engine = &engine;
    //     engine.load(QUrl("qrc:/texteditor.qml"));

    // to start your project as Live Client, comment (remove) the lines "felgo.setMainQmlFileName ..." & "engine.load ...",
    // and uncomment the line below
    //FelgoLiveClient client (&engine);

    return app.exec();
}
