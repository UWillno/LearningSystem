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
    qInfo() << "开始发送选择题";
    QStringList list;
    list.append(question);
    list.append(option1);
    list.append(option2);
    list.append(option3);
    list.append(option4);
    list.append(answer);
    QFuture<bool> future = QtConcurrent::run(&Singleton<TcpClient>::GetInstance(),&TcpClient::insertQuestion,&list,insertC);
    if(future.result()){
        emit submitSucceeded();
        //        emit submitSucceeded();
        qInfo() << "插入成功";
    }else{
        emit submitFailed();
        qInfo() << "插入失败";
    }
}

void QmlMediator::sendTrueOrFalseQuestion(QString question, bool answer)
{
    QStringList list;
    list.append(question);
    list.append(QString::number(answer));
    //    QVariant a = QString::number(answer);

    //    qInfo() << answer << QString::number(answer) << a << a.toBool();

    //    bool answertobool = false;
    //    if(answer != 0) answertobool = true;
    //    qInfo() << QString::number(answertobool);
    //    list.append(QString::number(answertobool));

    QFuture<bool> future = QtConcurrent::run(&Singleton<TcpClient>::GetInstance(),&TcpClient::insertQuestion,&list,insertT);
    if(future.result()){
        emit submitSucceeded();
        //        emit submitSucceeded();
        qInfo() << "插入成功";
    }else{
        emit submitFailed();
        qInfo() << "插入失败";
    }
}

void QmlMediator::sendFillInTheBlanksQuestion(QString question, QString answer)
{
    QStringList list;
    list.append(question);
    list.append(answer);
    //    QVariant a = QString::number(answer);

    //    qInfo() << answer << QString::number(answer) << a << a.toBool();

    //    bool answertobool = false;
    //    if(answer != 0) answertobool = true;
    //    qInfo() << QString::number(answertobool);
    //    list.append(QString::number(answertobool));

    QFuture<bool> future = QtConcurrent::run(&Singleton<TcpClient>::GetInstance(),&TcpClient::insertQuestion,&list,insertF);
    if(future.result()){
        emit submitSucceeded();
        //        emit submitSucceeded();
        qInfo() << "插入成功";
    }else{
        emit submitFailed();
        qInfo() << "插入失败";
    }

}

void QmlMediator::getQuestionsByTcp()
{
    QFuture<QList<QJsonArray>> future = QtConcurrent::run(&Singleton<TcpClient>::GetInstance(),&TcpClient::getQuestionsJson);
    m_tcpQuestions = future.result();
    if(m_tcpQuestions.isEmpty()){
        emit selectFailed();
        return;
    }
    emit selectSuceeded();
    qInfo() << m_tcpQuestions;

}

void QmlMediator::modifyQuestion(QJsonObject json, int type)
{

}

void QmlMediator::deleteQuestion(qint64 id, qint32 type)
{
    QFuture<bool> future = QtConcurrent::run(&Singleton<TcpClient>::GetInstance(),&TcpClient::deleteQuestion,id,type);
    if(future.result()){
        emit deleteSuceeded();
        // 刷新JSON
        getQuestionsByTcp();
        return;
    }
    emit  deleteFailed();

}

void QmlMediator::testModel(QJsonObject a)
{
    qInfo() << a;
}

const QList<QJsonArray> &QmlMediator::tcpQuestions() const
{
    return m_tcpQuestions;
}

void QmlMediator::setTcpQuestions(const QList<QJsonArray> &newTcpQuestions)
{
    if (m_tcpQuestions == newTcpQuestions)
        return;
    m_tcpQuestions = newTcpQuestions;
    emit tcpQuestionsChanged();
}

void QmlMediator::resetTcpQuestions()
{
    setTcpQuestions({}); // TODO: Adapt to use your actual default value
}



