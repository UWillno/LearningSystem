#ifndef TCPSERVER_H
#define TCPSERVER_H

#include <QObject>
#include <QTcpServer>
#include <QTcpSocket>
#include <QtConcurrent>
#include <QFuture>
#include <QFutureWatcher>
#include <QDateTime>
#include "questionfactory.h"
#include "interface/iQuestion.h"
#include "user.h"

#include <QFile>
#include <QDir>

class TcpServer : public QTcpServer
{
    Q_OBJECT
public:
    explicit TcpServer(QObject *parent = nullptr);
    ~TcpServer();



signals:
    void connected();
    void commitQuestionSignal();
    // QTcpServer interface
protected:
    void incomingConnection(qintptr handle);

private slots:

    void handleClient(qintptr &handle);
    void createUserDir(User &user);


private:
//    QList<QSharedPointer<QTcpSocket>> m_clients;
    // old way to send questions , use sendQuestionsJson will be more simple
    void sendQuestions(QTcpSocket *s);

    void sendQuestionsJson(QTcpSocket *s);
    void toLogin(QStringList *list,QTcpSocket *s);
    enum m_task{
        login,insertC,insertT,insertF,getQuestions,unUse,deleteQ,updateC,updateT,updateF,commitQ
        ,isNewUser
    };
    qint64 m_date;
    QuestionFactory factory;
};

#endif // TCPSERVER_H
