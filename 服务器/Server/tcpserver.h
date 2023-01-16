#ifndef TCPSERVER_H
#define TCPSERVER_H

#include <QObject>
#include <QTcpServer>
#include <QTcpSocket>
#include <QtConcurrent>
#include <QFuture>
#include <QFutureWatcher>
#include <QDateTime>

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
    void sendQuestions();
    void toLogin(QStringList *list,QTcpSocket *s);
    enum m_task{
        login,insert,getQuestions
    };
    qint64 m_date;
};

#endif // TCPSERVER_H
