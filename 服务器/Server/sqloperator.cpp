#include "sqloperator.h"



SqlOperator::SqlOperator(QObject *parent){
    Q_UNUSED(parent);
}

SqlOperator::~SqlOperator()
{
    m_db.close();
}

bool SqlOperator::login(QString username, QString password)
{
    qInfo() << "开始登陆";
    QString sql="select password from administrator WHERE username = \""+username+"\";";
    QSqlQuery query;
    query =QSqlQuery(m_db);
    if(!query.exec(sql)){
        qInfo() << "error";
        return false;
    }
    if(query.next()){
        QByteArray true_pwd = query.value(0).toByteArray();
        //        QCryptographicHash hash(QCryptographicHash::Sha256);
        //        hash.addData(password.toUtf8());
        qInfo() << true_pwd;
        if(true_pwd == password.toUtf8()){
            qInfo() << "登陆成功";
            query.clear();
            return true;
        }
    }
    query.clear();
    return false;
}

bool SqlOperator::connect(QString hostname,int port,QString databasename,QString username,QString password)
{
    m_db=QSqlDatabase::addDatabase("QMYSQL");
    m_db.setHostName(hostname);
    m_db.setPort(port);
    m_db.setDatabaseName(databasename);
    m_db.setUserName(username);
    m_db.setPassword(password);
    if(!m_db.open()){
        qInfo() << "数据库未开启";
        return false;
    }
    qInfo() << "连接成功";
    return true;
}

bool SqlOperator::commitDB(QSqlQuery *query)
{

    if (query->isActive())
    {
        m_db.commit();
        return true;
    }
    else
    {
        m_db.rollback();
        return false;
    }

}

bool SqlOperator::insertQuestion(iQuestion * question)
{
    if(!question) return false;
    QSqlQuery query =QSqlQuery(m_db);
    QString sql;
    TrueOrFalseQuestion *tq =qobject_cast<TrueOrFalseQuestion*>(question);
    if(tq){
        qInfo() <<"判断题";

        //        return;
    }
    ChoiceQuestion *cq = qobject_cast<ChoiceQuestion*>(question);
    if(cq){
        qInfo() << "选择题";
        sql = "INSERT INTO choice_questions VALUES "
              "(NULL,\"%1\",\"%2\",\"%3\",\"%4\",\"%5\",\"%6\")";
        sql = sql.arg(cq->question).arg(cq->option1).arg(cq->option2).arg(cq->option3).arg(cq->option4)
                .arg(cq->answer);
        qInfo() << query.executedQuery();
        query.exec(sql);
        if(commitDB(&query)){return true;};
    }
    //    m_query.clear();
    return false;
}
