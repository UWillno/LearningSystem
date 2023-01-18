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
//        QuestionFactory factory;
//        ChoiceQuestion *q = qobject_cast<ChoiceQuestion*>(factory.createChoiceQuestion());
//        q->question="你大爷的";
//        q->option1="A";
//        q->option2="B";
//        q->option3="C";
//        q->option4="D";
//        q->answer="草泥马";
//    //    QTemporaryFile file();
//        QByteArray qba;
//        qInfo() << "ByteArray:" <<qba;
//        QDataStream streamWrite(&qba,QIODevice::ReadWrite);
//        streamWrite << q->question << q->option1;

//        ChoiceQuestion *q1 = qobject_cast<ChoiceQuestion*>(factory.createChoiceQuestion());
//        QDataStream streamRead(&qba,QIODevice::ReadWrite);
//        streamRead >> q1->question;
//        streamRead >> q1->option1;
//        qInfo() << q1->question;
//        qInfo() << q1->option1;
        //    SqlOperator op;
        //    op.insertQuestion(q);

    return a.exec();
}
