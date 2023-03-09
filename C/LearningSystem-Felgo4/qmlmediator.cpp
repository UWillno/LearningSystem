#include "qmlmediator.h"

QmlMediator::QmlMediator(QObject *parent)
    : QObject{parent}
{
    tcpclientInit();
    HttpClient *httpclient = new HttpClient(this);
    QObject::connect(this,&QmlMediator::uploadResource,httpclient,&HttpClient::uploadFile);

    QObject::connect(httpclient,&HttpClient::getFilenameSucceed,this,[this](QString url){
        qInfo() << url;
        emit uploadResourceSucceed(url);
    });
    //    connect(this,QmlMediator::commitSignal(),&Singleton<TcpClient>::GetInstance(),TcpClient::);
}

void QmlMediator::adminLogin(QString username, QString password)
{

    QStringList list;
    list.append(username);
    list.append(password);
    //    QFuture<bool> future = QtConcurrent::run(&Singleton<TcpClient>::GetInstance(),&TcpClient::toLogin,&list);
    //    auto *p =&Singleton<TcpClient>::GetInstance();
    //    QFuture<bool> future = QtConcurrent::run([p](QStringList list){ return p->toLogin(&list);},list);
    //    //    bool result = Singleton<TcpClient>::GetInstance().toLogin(&list);
    QFuture<bool> future = QtConcurrent::run([](QStringList list){ return Singleton<TcpClient>::GetInstance().toLogin(&list);},list);

    qInfo() << future.result();
    if(future.result()){
        emit loginSucceeded();
    }else{
        emit loginFailed();
    }
}

void QmlMediator::tcpclientInit()
{
    //    Singleton<TcpClient>::GetInstance().init("192.168.1.12",9444);
//    Singleton<TcpClient>::GetInstance().init("127.0.0.1",9444);
    Singleton<TcpClient>::GetInstance().init("192.168.1.244",9444);
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
    auto *p =&Singleton<TcpClient>::GetInstance();
    QFuture<bool> future = QtConcurrent::run([p](QStringList list,qint32 type){ return p->insertQuestion(&list,type);},list,insertC);
    //    QFuture<bool> future = QtConcurrent::run(&Singleton<TcpClient>::GetInstance(),&TcpClient::insertQuestion,&list,insertC);
    if(future.result()){
        emit submitSucceeded();
        //        emit submitSucceeded();
        qInfo() << "插入成功";
    }else{
        emit submitFailed();
        qInfo() << "插入失败";
    }

    //    p->deleteLater();
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

    //    QFuture<bool> future = QtConcurrent::run(&Singleton<TcpClient>::GetInstance(),&TcpClient::insertQuestion,&list,insertT);
    auto *p = &Singleton<TcpClient>::GetInstance();
    QFuture<bool> future = QtConcurrent::run([p](QStringList list,qint32 type){return p->insertQuestion(&list,type);},list,insertT);
    if(future.result()){
        emit submitSucceeded();
        //        emit submitSucceeded();
        qInfo() << "插入成功";
    }else{
        emit submitFailed();
        qInfo() << "插入失败";
    }
    //    p->deleteLater();
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
    auto *p = &Singleton<TcpClient>::GetInstance();
    QFuture<bool> future = QtConcurrent::run([p](QStringList list,qint32 type){return p->insertQuestion(&list,type);},list,insertF);

    //        QFuture<bool> future = QtConcurrent::run(&Singleton<TcpClient>::GetInstance(),&TcpClient::insertQuestion,&list,insertF);
    if(future.result()){
        emit submitSucceeded();
        //        emit submitSucceeded();
        qInfo() << "插入成功";
    }else{
        emit submitFailed();
        qInfo() << "插入失败";
    }
    //    p->deleteLater();

}

void QmlMediator::getQuestionsByTcp()
{
    auto *p =&Singleton<TcpClient>::GetInstance();
    //    QFuture<bool> future = QtConcurrent::run([p](QStringList list){ return p->toLogin(&list);},list);
    QFuture<QList<QJsonArray>> future = QtConcurrent::run([p]{ return p->getQuestionsJson();});
    //    delete p;
    m_tcpQuestions = future.result();
    if(m_tcpQuestions.isEmpty()){
        //        emit selectFailed();
        return;
    }
    emit selectSuceeded();
//    qInfo() << m_tcpQuestions;
    //    p->deleteLater();

}

void QmlMediator::updateQuestion(QJsonObject json, qint32 type)
{
    qInfo() << json << type;
    auto *p =&Singleton<TcpClient>::GetInstance();
    //    QFuture<bool> future = QtConcurrent::run(&Singleton<TcpClient>::GetInstance(),&TcpClient::updateQuestion,json,type);
    QFuture<bool> future = QtConcurrent::run([p](QJsonObject json, qint32 type){return p->updateQuestion(json,type);},json,type);
    if(future.result()){
        getQuestionsByTcp();
        emit updateSucceeded();
        // 刷新JSON
        return;
    }
    emit  updateFailed();
    //    p->deleteLater();
}


void QmlMediator::deleteQuestion(qint32 id, qint32 type)
{
    //        QFuture<bool> future = QtConcurrent::run(&Singleton<TcpClient>::GetInstance(),&TcpClient::deleteQuestion,id,type);
    auto *p =&Singleton<TcpClient>::GetInstance();
    QFuture<bool> future = QtConcurrent::run([p](qint32 id, qint32 type){return p->deleteQuestion(id,type);},id,type);

    if(future.result()){
        // 刷新JSON
        getQuestionsByTcp();

        emit deleteSuceeded();

        return;
    }
    emit  deleteFailed();
    //    p->deleteLater();

}

void QmlMediator::testModel(QJsonObject a)
{
    qInfo() << a;
}

void QmlMediator::commitQuestons()
{

    qInfo() <<"qm:commitQuestons";


    auto *p =&Singleton<TcpClient>::GetInstance();

    //    QFuture<bool> future = QtConcurrent::run(&Singleton<TcpClient>::GetInstance(),&TcpClient::commmitQuestions);
    QFuture<bool> future = QtConcurrent::run([p]{return p->commmitQuestions();});

    if(future.result()){
        // 刷新JSON
        //        getQuestionsByTcp();

        //        emit deleteSuceeded();

        qInfo() <<"sussssssss";
        //        return;
    }
    //        emit  deleteFailed();
    //        p->deleteLater();
}

void QmlMediator::createNewUser(QString username, qint32 cxid)
{
    qInfo() <<"createNewUser";
    auto *p = &Singleton<TcpClient>::GetInstance();
    QFuture<void> future = QtConcurrent::run([p](QString username, qint32 cxid){p->createNewUser(username,cxid);},username,cxid);

}

QString QmlMediator::uploadPicture(QUrl path)
{
    qInfo() <<"上传图片";
    auto *p = &Singleton<TcpClient>::GetInstance();
    QFuture<QString> future = QtConcurrent::run([p](QUrl path){ return p->uploadPicture(path);},path);
    //    qInfo() << future.result();
    return future.result();
}

void QmlMediator::upload(QUrl path)
{
    qInfo() << path;

    emit uploadResource(path);
    qInfo() <<"uploadResource信号发射";
}

void QmlMediator::submitPost(QString title, QString text, qint32 cxid, QString username,qint32 type)
{
    auto *p = &Singleton<TcpClient>::GetInstance();
    QFuture<bool> future = QtConcurrent::run([p](QString title, QString text, qint32 cxid, QString username,qint32 type){ return p->submitPost(title,text,cxid,username,type);},title,text,cxid,username,type);
    qInfo() << "发帖："<< future.result();
    //    return future.result();

}

void QmlMediator::selectPosts()
{
    auto *p = &Singleton<TcpClient>::GetInstance();
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



