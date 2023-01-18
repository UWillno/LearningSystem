#include "qmlmediator.h"

QmlMediator::QmlMediator(QObject *parent)
    : QObject{parent}
{
    tcpclientInit();
}

void QmlMediator::adminLogin(QString username, QString password)
{

    QStringList list;
    list.append(username);
    list.append(password);
    QFuture<bool> future = QtConcurrent::run(&Singleton<TcpClient>::GetInstance(),&TcpClient::toLogin,&list);
//    bool result = Singleton<TcpClient>::GetInstance().toLogin(&list);
    qInfo() << future.result();
    if(future.result()){
        emit loginSucceeded();
    }else{
        emit loginFailed();
    }
}

void QmlMediator::tcpclientInit()
{
    Singleton<TcpClient>::GetInstance().init("127.0.0.1",4444);
}

void QmlMediator::login(QString username, QString password,int usertype)
{
    switch (usertype) {
    case administrator:
        adminLogin(username.simplified(),password.simplified());
        break;
    default:
        break;
    }
    qInfo() << username;
    qInfo() << password;
}
