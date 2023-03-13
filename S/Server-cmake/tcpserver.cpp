
#include "singleton.h"
#include "sqloperator.h"
#include "tcpserver.h"

TcpServer::TcpServer(QObject *parent): QTcpServer(parent)
{
    //    Singleton<SqlOperator>::GetInstance().connect("192.168.1.9",3306,"learning","root","123456");
    //    Singleton<SqlOperator>::GetInstance().connect("192.168.1.3",3306,"learning","root","123456");
    //    Singleton<SqlOperator>::GetInstance().connect("101.43.173.108",3306,"learning","root","44910244");
    //    Singleton<SqlOperator>::GetInstance().connect("www.uwillno.icu",3306,"learning","root","44910244");
    Singleton<SqlOperator>::GetInstance().connect("127.0.0.1",3306,"learning","root","UW1224222099");
    QObject::connect(this,&TcpServer::commitQuestionSignal,&Singleton<SqlOperator>::GetInstance(),&SqlOperator::commitQuestions);
}

TcpServer::~TcpServer()
{
    qInfo() << "de";
    QTcpServer::close();
}

void TcpServer::incomingConnection(qintptr handle)
{
    qInfo() << "incoming";
    QFuture<void> future = QtConcurrent::run([=](qintptr handle){handleClient(handle);},handle);
    //qt6不再支持传递成员函数指针和信号 下面是qt5写法 无法编译
    //    QFuture<void> future =QtConcurrent::run(this,&TcpServer::handleClient,handle);
}


void TcpServer::sendQuestions(QTcpSocket *s)
{
    QList<QSharedPointer<ChoiceQuestion>> cQuestions = Singleton<SqlOperator>::GetInstance().selectAllCQuestion();
    QList<QSharedPointer<TrueOrFalseQuestion>> tQuestions = Singleton<SqlOperator>::GetInstance().selectAllTQuestion();
    QList<QSharedPointer<FillInTheBlanksQuestion>> fQuestions = Singleton<SqlOperator>::GetInstance().selectAllFQuestion();
    QByteArray byte;
    QDataStream stream(&byte,QIODevice::WriteOnly);
    foreach (QSharedPointer<ChoiceQuestion> cq, cQuestions) {
        stream << cq->id << cq->question << cq->option1 << cq->option2 << cq->option3 << cq->option4 << cq->answer;
    }
    stream << "UWTypeFinished";
    cQuestions.clear();
    foreach (QSharedPointer<TrueOrFalseQuestion> tq, tQuestions) {
        stream << tq->id << tq->question << tq -> answer;
    }
    stream << "UWTypeFinished";
    tQuestions.clear();
    foreach (QSharedPointer<FillInTheBlanksQuestion> fq, fQuestions) {
        stream << fq->id << fq->question << fq -> answer;
    }
    fQuestions.clear();
    s->write(byte);
    s->waitForBytesWritten();

}



void TcpServer::sendQuestionsJson(QTcpSocket *s)
{
    QList<QSharedPointer<ChoiceQuestion>> cQuestions = Singleton<SqlOperator>::GetInstance().selectAllCQuestion();
    QList<QSharedPointer<TrueOrFalseQuestion>> tQuestions = Singleton<SqlOperator>::GetInstance().selectAllTQuestion();
    QList<QSharedPointer<FillInTheBlanksQuestion>> fQuestions = Singleton<SqlOperator>::GetInstance().selectAllFQuestion();
    QByteArray byte;
    QDataStream stream(&byte,QIODevice::WriteOnly);
    QJsonArray cJsonArray,tJsonArray,fJsonArray;
    foreach (QSharedPointer<ChoiceQuestion> cq, cQuestions) {
        QJsonObject question ;
        //        question << cq->id;
        question.insert("id",cq->id);
        question.insert("question",cq->question);
        question.insert("option1",cq->option1);
        question.insert("option2",cq->option2);
        question.insert("option3",cq->option3);
        question.insert("option4",cq->option4);
        question.insert("answer",cq->answer);
        cJsonArray.append(question);
    }
    //    qInfo() << cJsonArray;
    foreach (QSharedPointer<TrueOrFalseQuestion> tq, tQuestions) {
        QJsonObject question ;
        //        question << cq->id;
        question.insert("id",tq->id);
        question.insert("question",tq->question);
        question.insert("answer",tq->answer);
        tJsonArray.append(question);
    }
    foreach (QSharedPointer<FillInTheBlanksQuestion> fq, fQuestions) {
        QJsonObject question ;
        //        question << cq->id;
        question.insert("id",fq->id);
        question.insert("question",fq->question);
        question.insert("answer",fq->answer);
        fJsonArray.append(question);
    }

    stream << cJsonArray << tJsonArray << fJsonArray;
    qInfo() << fJsonArray;
    //数据过大可能需要分块传，直接传本机测试可以，局域网虚拟机测试可能收不到数据？？
    qint64 size = byte.size();
//    qInfo()<<size;
    //即使分块了，还是有概率收不到...可能是校园网不太行？？
    qint64 send = 0;
    qint64 chunk = 4096;
    qint32 time=0;
    forever{
        qInfo() << time;
        time++;
        qInfo()<<"全部" << size <<"已发"<< send;
        if(size <= (send + chunk)){
            s->write(byte.sliced(send));
            s->waitForBytesWritten();
            qInfo() << "发完";
            break;
        }
        s->write(byte.sliced(send,chunk),chunk);
        s->waitForBytesWritten();
        send += chunk;

    }
//    s->write("finished");
//    s->waitForBytesWritten();

}

void TcpServer::toLogin(QStringList *list,QTcpSocket *s)
{
    s->flush();
    qInfo() << list->at(0) << list->at(1);
    if(Singleton<SqlOperator>::GetInstance().login(list->at(0),list->at(1))){
        m_date=QDateTime::currentSecsSinceEpoch();
        s->write(QString("ok#"+QString::number(m_date)).toUtf8());
        qInfo() << m_date;
    }else{
        s->write("error\r\n");
    }
    s->waitForBytesWritten();
}

void TcpServer::uploadPicture(QTcpSocket *s, QDataStream &stream)
{

    qInfo() << "图片上传";
    QString filename;
    stream >> filename;
    qint64 size;
    stream >> size;
    if(size > 0 ){
        s->flush();
        s->write("ready!!");
        s->waitForBytesWritten();
        QFile file("/srv/http/images/"+filename);
        if (file.open(QIODevice::WriteOnly)) {
            forever {
                if(s->waitForReadyRead())
                    file.write(s->readAll());
                else{
                    break;
                }
            }
            file.close();
        }
    }
}



void TcpServer::handleClient(qintptr &handle)
{
    QScopedPointer<QTcpSocket> p(new QTcpSocket());
    p->setSocketDescriptor(handle);
    qInfo() << handle;
    //    p->waitForConnected();
    //    p->waitForConnected();
    p->waitForReadyRead();
    QByteArray byte = p->readAll();
    QDataStream stream(&byte,QIODevice::ReadOnly);
    qint32 currentTask;
    qint64 date;

    if(byte.isEmpty()){
        qInfo() << "数据异常";
        p->close();
        return;
    }
    //    try {
    stream >> currentTask;
    qInfo() << "currentTask" << currentTask;
    switch (currentTask) {
    case login:
    {
        QByteArray username;
        QByteArray password;
        stream >> username;
        stream >> password;
        qInfo() << QString(username);
        QStringList list;
        list.append(QString(username));
        list.append(QString(password));
        //        list.append(stream)
        toLogin(&list,p.data());
        break;
    }

    case insertC:
    {
        //添加选择题
        //        dynamic_cast
        QScopedPointer<ChoiceQuestion> q(qobject_cast<ChoiceQuestion*>(factory.createChoiceQuestion()));
        stream >> q->question;
        stream >> q->option1 >> q->option2 >> q->option3 >> q->option4 >> q->answer;
        stream >> date;
        //        if(date != m_date){return;}

        if(Singleton<SqlOperator>::GetInstance().insertQuestion(q.data())){
            p->write("ok");
            p->waitForBytesWritten();
        }
        break;
    }
    case insertT:
    {
        QScopedPointer<TrueOrFalseQuestion> q(qobject_cast<TrueOrFalseQuestion*>(factory.createTrueOrFalseQuestion()));
        stream >> q->question;
        QString answer;
        stream >> answer;
        QVariant temp = answer;
        q->answer = temp.toBool();
        //        bool ok;
        //        q->answer = answer.toShort(&ok);
        //        if(!ok) return;
        //        q->answer;
        stream >> date;
        //        if(date != m_date){return;}
        if(Singleton<SqlOperator>::GetInstance().insertQuestion(q.data())){
            p->write("ok");
            p->waitForBytesWritten();
        }
        break;
    }
    case insertF:
    {
        QScopedPointer<FillInTheBlanksQuestion> q(qobject_cast<FillInTheBlanksQuestion*>(factory.createFillInTheBlanksQuestion()));
        stream >> q->question >> q->answer >> date;
        //        if(date != m_date){return;}
        if(Singleton<SqlOperator>::GetInstance().insertQuestion(q.data())){
            p->write("ok");
            p->waitForBytesWritten();
        }
        break;
    }
    case getQuestions:{
        stream  >> date;
        //        if(date != m_date){return;}
        //        sendQuestions(p.data());
        sendQuestionsJson(p.data());
        break;
    }

    case deleteQ: {
        qint32 id;
        qint32 type;
        stream  >> id >> type >> date;
        qInfo() << id << type ;
        //        if(date != m_date){return;}
        if(Singleton<SqlOperator>::GetInstance().deleteQuestion(id,type)){
            p->write("ok");
            p->waitForBytesWritten();
        }
        break;
    }
    case updateC:{
        QScopedPointer<ChoiceQuestion> q(qobject_cast<ChoiceQuestion*>(factory.createChoiceQuestion()));
        stream >>q->id >> q->question;
        stream >> q->option1 >> q->option2 >> q->option3 >> q->option4 >> q->answer;
        stream >> date;
        qInfo() << q->id <<  q->option1 << q->option2 <<
                   q->option3 << q->option4 << q->answer;

        //        if(date != m_date){return;}

        if(Singleton<SqlOperator>::GetInstance().updateQuestion(q.data())){
            p->write("ok");
            p->waitForBytesWritten();
        }
        break;
    }
    case updateT:{
        QScopedPointer<TrueOrFalseQuestion> q(qobject_cast<TrueOrFalseQuestion*>(factory.createTrueOrFalseQuestion()));
        stream >> q->id >> q->question >>q->answer;
        //        QString answer;
        //        stream >> answer;
        //        QVariant temp = answer;
        //        q->answer = temp.toBool();
        //        bool ok;
        //        q->answer = answer.toShort(&ok);
        //        if(!ok) return;
        //        q->answer;
        qInfo() << q->answer;
        stream >> date;
        //        if(date != m_date){return;}
        if(Singleton<SqlOperator>::GetInstance().updateQuestion(q.data())){
            p->write("ok");
            p->waitForBytesWritten();
        }
        break;
        //        break;
    }
    case updateF:{
        QScopedPointer<FillInTheBlanksQuestion> q(qobject_cast<FillInTheBlanksQuestion*>(factory.createFillInTheBlanksQuestion()));
        stream >> q->id >> q->question >> q->answer >> date;
        //        if(date != m_date){return;}
        if(Singleton<SqlOperator>::GetInstance().updateQuestion(q.data())){
            p->write("ok");
            p->waitForBytesWritten();
        }
        break;
        //        break;
    }
    case commitQ: {
        qInfo() <<"题库提交";
        stream >> date;
        //        if(date != m_date){return;}
        emit commitQuestionSignal();
        p->write("ok");
        p->waitForBytesWritten();
        break;
    }
    case isNewUser: {
        qInfo() << "新用户登录";
        User user;
        stream >> user.username >> user.cxid;
        createUserDir(user);
        p->write("ok");
        p->waitForBytesWritten();
        break;
    }
    case uploadP: {
        uploadPicture(p.data(),stream);
        break;
    }
    case submitP:{
        QString title,text,username;
        qint32 cxid,type;
        stream >>title >> text >>cxid >>username >> type;
        if(Singleton<SqlOperator>::GetInstance().submitPost(title,text,cxid,username,type)){
            qInfo() <<"发帖成功";
            p->write("ok");
            p->waitForBytesWritten();
        }else{
            qInfo() << "发帖失败";
            p->write("error");
            p->waitForBytesWritten();
        }

        break;
    }
    default:
        break;
    }

    p->close();
}

void TcpServer::createUserDir(User &user)
{
    qInfo() <<"createUserDir";
    qInfo() << user.cxid;
    QDir httpdir;
    if(httpdir.mkdir("/srv/http/"+QString::number(user.cxid))){
        httpdir.setPath("/srv/http/"+QString::number(user.cxid));
        QFile file(httpdir.filePath("info.json"));
        QJsonDocument doc;
        QJsonObject object;
        object.insert("username",user.username);
        object.insert("cxid",user.cxid);
        doc.setObject(object);
        if(file.open(QIODevice::WriteOnly)){
            QTextStream stream(&file);
            stream << doc.toJson(QJsonDocument::Compact);
        }
        file.close();
    }
}

