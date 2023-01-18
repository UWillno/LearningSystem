#ifndef TCPCLIENT_H
#define TCPCLIENT_H

#include <QObject>
#include <QTcpSocket>
#include <QAbstractSocket>

#include <QCryptographicHash>
class TcpClient : public QObject
{
    Q_OBJECT
public:
    explicit TcpClient(QObject *parent = nullptr);

    QString host() const;
    void setHost(const QString &newHost);

    quint16 port() const;
    void setPort(quint16 newPort);

    void init(QString host,quint16 port);

signals:


public slots:
    bool toLogin(QStringList *list);


private:
    QString m_host;
    quint16 m_port;
    qint64 m_date;
    QByteArray passwordCryptographicHash(QByteArray password);


};

#endif // TCPCLIENT_H
