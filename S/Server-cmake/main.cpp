#include <QCoreApplication>
#include <QDebug>
#include <QTemporaryFile>
#include "questionfactory.h"
#include "choicequestion.h"
#include "sqloperator.h"
#include <QDataStream>
#include "httpserver.h"
#include "singleton.h"
#include "sqloperator.h"
#include "tcpserver.h"
#include <QHttpServer>
#include <QtConcurrent>

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
    //    Singleton<SqlOperator>::GetInstance().login("UWillno","44910244");
    HttpServer httpsever;
    TcpServer server;
    //    Singleton<SqlOperator>::GetInstance().selectPosts();
    if(!server.listen(QHostAddress::Any, 9444))
    {
        qCritical() << server.errorString();
    }
    else
    {
        //        qInfo() <<
        qInfo() << "服务启动!";
    }
    //        QTcpSocket s;
    //        server.sendQuestionsJson(&s);
    //        test();


    return a.exec();
}
