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

void QmlMediator::tologin(QString username, QString password,int usertype)
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

void QmlMediator::sendChoiceQuestion(QString question, QString option1, QString option2, QString option3, QString option4, QString answer)
{
    QStringList list;
    list.append(question);
    list.append(option1);
    list.append(option2);
    list.append(option3);
    list.append(option4);
    list.append(answer);
    QFuture<bool> future = QtConcurrent::run(&Singleton<TcpClient>::GetInstance(),&TcpClient::insertQuestion,&list,insertC);
    if(future.result()){
//        emit loginSucceeded();
        qInfo() << "插入成功";
    }else{
//        emit loginFailed();
        qInfo() << "插入失败";
    }
}
