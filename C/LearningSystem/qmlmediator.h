#ifndef QMLMEDIATOR_H
#define QMLMEDIATOR_H

#include <QObject>
#include "singleton.h"
#include "tcpclient.h"
#include <QDebug>
#include <QtConcurrent>
#include <QFuture>
#include <QJsonArray>
class QmlMediator : public QObject
{
    Q_OBJECT
public:
    explicit QmlMediator(QObject *parent = nullptr);
    enum usertype {administrator,chaoxing};
    void adminLogin(QString username,QString password);
    void tcpclientInit();

    const QList<QJsonArray> &tcpQuestions() const;
    void setTcpQuestions(const QList<QJsonArray> &newTcpQuestions);
    void resetTcpQuestions();
    Q_PROPERTY(QList<QJsonArray> tcpQuestions READ tcpQuestions WRITE setTcpQuestions RESET resetTcpQuestions NOTIFY tcpQuestionsChanged)

signals:
    void loginSucceeded();
    void loginFailed();
    void submitSucceeded();

    void tcpQuestionsChanged();

public slots:
    void tologin(QString username,QString password, int usertype);
    void sendChoiceQuestion(QString question,QString option1,QString option2,QString option3,QString option4,QString answer);
    void sendTrueOrFalseQuestion(QString question,bool answer);
    void sendFillInTheBlanksQuestion(QString question,QString answer);
    void getQuestionsByTcp();

private:
    enum m_task{
        login,insertC,insertT,insertF,getQuestions
    };
    QList<QJsonArray> m_tcpQuestions;

};

#endif // QMLMEDIATOR_H
