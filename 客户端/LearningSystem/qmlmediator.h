#ifndef QMLMEDIATOR_H
#define QMLMEDIATOR_H

#include <QObject>
#include "singleton.h"
#include "tcpclient.h"
#include <QDebug>
#include <QtConcurrent>
#include <QFuture>
class QmlMediator : public QObject
{
    Q_OBJECT
public:
    explicit QmlMediator(QObject *parent = nullptr);
    enum usertype {administrator,chaoxing};
    void adminLogin(QString username,QString password);
    void tcpclientInit();
signals:
    void loginSucceeded();
    void loginFailed();

public slots:
    void login(QString username,QString password, int usertype);
};

#endif // QMLMEDIATOR_H
