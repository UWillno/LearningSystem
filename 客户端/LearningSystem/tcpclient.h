#ifndef TCPCLIENT_H
#define TCPCLIENT_H

#include <QObject>
#include <QTcpSocket>
#include <QAbstractSocket>
#include <QtConcurrent>
#include <QFuture>
#include <QCryptographicHash>
class TcpClient : public QObject
{
    Q_OBJECT
public:
    explicit TcpClient(QObject *parent = nullptr);
    enum task{
        login,insert
    };

    QString host() const;
    void setHost(const QString &newHost);

    quint16 port() const;
    void setPort(quint16 newPort);

signals:


public slots:
    void toLogin(QStringList *list);
    void handle_task(int t);

private:
    QString m_host;
    quint16 m_port;
    qint64 m_date;
    QByteArray passwordCryptographicHash(QByteArray password);


};

#endif // TCPCLIENT_H
