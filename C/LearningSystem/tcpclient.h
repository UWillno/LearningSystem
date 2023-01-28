#ifndef TCPCLIENT_H
#define TCPCLIENT_H

#include <QObject>
#include <QTcpSocket>
#include <QAbstractSocket>
#include <QDataStream>
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
    bool insertQuestion(QStringList *list,qint32 type);

private:
    QString m_host;
    quint16 m_port;
    qint64 m_date;
    QByteArray passwordCryptographicHash(QByteArray password);
    enum m_task{
        login,insertC,insertT,insertF,getQuestions
    };


};

#endif // TCPCLIENT_H
