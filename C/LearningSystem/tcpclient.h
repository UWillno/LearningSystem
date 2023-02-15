#ifndef TCPCLIENT_H
#define TCPCLIENT_H

#include <QObject>
#include <QTcpSocket>
#include <QAbstractSocket>
#include <QDataStream>
#include <QCryptographicHash>
#include <QJsonArray>
#include <QJsonObject>
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

    //    #warning //deprecated, use getQuestionsJson()
    QByteArray getQuestionsBytes();

    QList<QJsonArray> getQuestionsJson();

signals:


public slots:
    bool toLogin(QStringList *list);
    bool insertQuestion(QStringList *list,qint32 type);
    bool deleteQuestion(qint64 &id,qint32 &type);
    bool updateQuestion(QJsonObject &json, qint32 &type);
private:
    QString m_host;
    quint16 m_port;
    qint64 m_date;
    QByteArray passwordCryptographicHash(QByteArray password);
    enum m_task{
        login,insertC,insertT,insertF,getQuestions,unUse,deleteQ,updateC,updateT,updateF
    };

private:
    enum question_type{choice,trueOrFalse,fill};
};

#endif // TCPCLIENT_H
