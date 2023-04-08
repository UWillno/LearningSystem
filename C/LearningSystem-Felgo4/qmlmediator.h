#ifndef QMLMEDIATOR_H
#define QMLMEDIATOR_H

#include <QObject>
#include "httpclient.h"
#include "singleton.h"
#include "tcpclient.h"
#include <QDebug>
#include <QtConcurrent>
#include <QFuture>
#include <QJsonArray>
#include <QQmlApplicationEngine>
#include <QFileDialog>
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
    QQmlApplicationEngine *engine;

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
    void updateSucceeded();
    void updateFailed();
    void uploadResource(QUrl &path);
    void uploadXxt(QUrl &path);
    //    void commitSignal();
    void uploadResourceSucceed(QString url);
    void uploadXxtSucceed(QString objectId);
    void uploadQr(QUrl &path);

    void decodeSucceed(QString url);
    void decodeFailed();

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
    void updateQuestion(QJsonObject json, qint32 type);

    // 删除题目
    void deleteQuestion(qint32 id,qint32 type);

    // 测试
    void testModel(QJsonObject a);

    // 提交题库到HTTP
    void commitQuestons();

    // 创建新用户
    void createNewUser(QString username,qint32 cxid);

    //上传图片 by Tcp
    QString uploadPicture(QUrl path);

    // 上传任意资源 by Http
    void upload(QUrl path);

    //发帖
    void submitPost(QString title,QString text,qint32 cxid,QString username,qint32 type);

    //管理员用帖子列表
    void selectPosts();

    //上传图片到学习通
    void uploadPhotoToXxt(QUrl path);

    // qr
    void uploadQrPhoto(QUrl path);

    //    void openWordWindow(const qint32 w,const qint32 h);

//    void createNewWin();

//    void getFile();

private:
    enum m_task{
        login,insertC,insertT,insertF,getQuestions,modifyC,modifyT,modifyF,deleteC,deleteT,deleteF
    };
    QList<QJsonArray> m_tcpQuestions;


};

#endif // QMLMEDIATOR_H
