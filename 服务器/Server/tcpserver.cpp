
#include "singleton.h"
#include "sqloperator.h"
#include "tcpserver.h"

TcpServer::TcpServer(QObject *parent): QTcpServer(parent)
{
    Singleton<SqlOperator>::GetInstance().connect("192.168.1.12",3306,"learning","root","123456");
}

TcpServer::~TcpServer()
{
    qInfo() << "de";
    QTcpServer::close();
}

void TcpServer::incomingConnection(qintptr handle)
{
    qInfo() << "incoming";
    QFuture<void> future =QtConcurrent::run(this,&TcpServer::handleClient,handle);
}

void TcpServer::sendQuestions()
{

}

void TcpServer::toLogin(QStringList *list,QTcpSocket *s)
{
    s->flush();
    qInfo() << list->at(0) << list->at(1);
    if(Singleton<SqlOperator>::GetInstance().login(list->at(0),list->at(1))){
        m_date=QDateTime::currentSecsSinceEpoch();
        s->write(QString("ok#"+QString::number(m_date)).toUtf8());
        qInfo() << m_date;
    }else{
        s->write("error\r\n");
    }
    s->waitForBytesWritten();
}

void TcpServer::handleClient(qintptr handle)
{
    QScopedPointer<QTcpSocket> p(new QTcpSocket());
    p->setSocketDescriptor(handle);
    qInfo() << handle;
    //    connect(s,&QTcpSocket::readyRead,this,&TcpServer::readyRead);
    //    QEventLoop loop;
    //    connect(s,&QTcpSocket::readyRead,&loop,&QEventLoop::quit);
    //    loop.exec();
    p->waitForReadyRead();
    //    QString value = QString(p->readAll()).simplified();
    QByteArray byte = p->readAll();
    QDataStream stream(&byte,QIODevice::ReadOnly);
    qint32 currentTask;
    if(byte.isEmpty()){
        p->close();
        return;
    }
    //    try {
    stream >> currentTask;
    qInfo() << currentTask;
    //    } catch (...) {
    //        qInfo() << "error";
    //        p->close();
    //        return;
    //    }


    //    qInfo() << value;
    //    if(!value.contains('#')){
    //        p->close();
    //        return;
    //    }
    //    QStringList list = value.split("#");
    //    qInfo() << list;
    //    bool ok;
    //    int currentTask = list.at(list.size()-1).toInt(&ok);
    //    if(ok){
    switch (currentTask) {
    case login:
    {
        QByteArray username;
        QByteArray password;
        stream >> username;
        stream >> password;
        qInfo() << QString(username);
        QStringList list;
        list.append(QString(username));
        list.append(QString(password));
        //        list.append(stream)
        toLogin(&list,p.data());
        break;
    }

    case insertC:
    {
        //添加选择题
        QScopedPointer<ChoiceQuestion> q(factory.createChoiceQuestion());
        stream >> q->question;
        stream >> q->option1 >> q->option2 >> q->option3 >> q->option4 >> q->answer;
        qint64 date;
        stream >> date;
//        if(date != m_date){return;}

        if(Singleton<SqlOperator>::GetInstance().insertQuestion(q.data())){
            p->write("ok");
            p->waitForBytesWritten();
        }
        break;
    }
    default:
        break;
    }

    //    }

    //    if(value.contains('#')){
    //        QList<QByteArray> list =value.split('#');
    //        qInfo() << list.size();
    //        if(list.size()==2){
    //            snedLoginResult(&list,p.data());
    //        }
    //    }
    p->close();
}

