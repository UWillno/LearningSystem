#include <QCoreApplication>
#include <QDebug>
#include <QTemporaryFile>
#include "questionfactory.h"
#include "choicequestion.h"
#include "sqloperator.h"
#include <QDataStream>
#include "singleton.h"
#include "sqloperator.h"
#include "tcpserver.h"
void test(){
//    Singleton<SqlOperator>::GetInstance().selectAllQuestion();
    qint64 id;

    id=33;
    int type=0;
    Singleton<SqlOperator>::GetInstance().deleteQuestion(id,type);
}
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
//        qInfo() <<
        qInfo() << "服务启动!";
    }
    //        QTcpSocket s;
    //        server.sendQuestionsJson(&s);
//        test();


    return a.exec();
}
