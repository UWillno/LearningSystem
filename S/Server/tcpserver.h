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

class TcpServer : public QTcpServer
{
    Q_OBJECT
public:
    explicit TcpServer(QObject *parent = nullptr);
    ~TcpServer();
    void handleClient(qintptr handle);


signals:
    void connected();

    // QTcpServer interface
protected:
    void incomingConnection(qintptr handle);

private slots:



private:
//    QList<QSharedPointer<QTcpSocket>> m_clients;
    #warning old way to send questions , use sendQuestionsJson will be more simple
    void sendQuestions(QTcpSocket *s) Q_DECL_DEPRECATED;

    void sendQuestionsJson(QTcpSocket *s);
    void toLogin(QStringList *list,QTcpSocket *s);
    enum m_task{
        login,insertC,insertT,insertF,getQuestions,unUse,deleteQ,updateC,updateT,updateF
    };
    qint64 m_date;
    QuestionFactory factory;
};

#endif // TCPSERVER_H
