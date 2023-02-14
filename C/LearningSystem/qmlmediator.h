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
    void submitFailed();
    void selectSuceeded();
    void selectFailed();
    void tcpQuestionsChanged();
    void deleteSuceeded();
    void deleteFailed();


public slots:
    // 登录
    void tologin(QString username,QString password, const int usertype);
    // 添加题目
    void sendChoiceQuestion(QString question,QString option1,QString option2,QString option3,QString option4,QString answer);
    void sendTrueOrFalseQuestion(QString question,bool answer);
    void sendFillInTheBlanksQuestion(QString question,QString answer);

    // 获取题目
    void getQuestionsByTcp();

    // 修改题目
    void modifyQuestion(QJsonObject json, int type);

    // 删除题目
    void deleteQuestion(qint64 id,qint32 type);

    // 测试
    void testModel(QJsonObject a);

private:
    enum m_task{
        login,insertC,insertT,insertF,getQuestions,modifyC,modifyT,modifyF,deleteC,deleteT,deleteF
    };
    QList<QJsonArray> m_tcpQuestions;

};

#endif // QMLMEDIATOR_H
