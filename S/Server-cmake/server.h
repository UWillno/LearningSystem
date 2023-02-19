#ifndef SERVER_H
#define SERVER_H

#include <QObject>
#include <QTcpServer>
#include <QTcpSocket>

class Server : public QTcpServer
{
    Q_OBJECT
public:
    explicit Server(QObject *parent = nullptr);
    ~Server();
    void close();


signals:


    // QTcpServer interface
protected:
    void incomingConnection(qintptr handle) override;

public slots:
    void connected();
    void readyRead();
    void disconnected();

private:
    QList<QTcpSocket*> m_clients;
    void sendAll(QString value);
};

#endif // SERVER_H
