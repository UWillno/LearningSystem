#include <QCoreApplication>
#include <QDebug>
//#include "singleton.h"
//#include "sqloperator.h"
#include "tcpserver.h"
int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);
       //    Singleton<SqlOperator>::GetInstance().login("UWillno","44910244");

    TcpServer server;

    if(!server.listen(QHostAddress::Any, 4444))
    {
        qCritical() << server.errorString();
    }
    else
    {
        qInfo() << "服务启动!";
    }


    return a.exec();
}
