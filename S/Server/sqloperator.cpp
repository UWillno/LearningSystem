#include "sqloperator.h"



SqlOperator::SqlOperator(QObject *parent): QObject{parent}{
    //    Q_UNUSED(parent);
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
    //自动重连
    m_db.setConnectOptions("MYSQL_OPT_RECONNECT=1");
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
        sql = "INSERT INTO torf_questions VALUES (NULL,'%1',%2)";
        qint16 tinyint = 0;
        if(tq->answer) tinyint = 1;
        qInfo() << tq->answer;
        sql = sql.arg(tq->question,QString::number(tinyint));
        qInfo() << sql;
        query.exec(sql);
        if(commitDB(&query)){return true;};
        return false;
    }
    ChoiceQuestion *cq = qobject_cast<ChoiceQuestion*>(question);
    if(cq){
        qInfo() << "选择题";
        sql = "INSERT INTO choice_questions VALUES "
              "(NULL,'%1','%2','%3','%4','%5','%6')";
        //        sql = sql.arg(cq->question).arg(cq->option1).arg(cq->option2).arg(cq->option3).arg(cq->option4)
        //                .arg(cq->answer);
        sql = sql.arg(cq->question,cq->option1,cq->option2,cq->option3,cq->option4,cq->answer);
        qInfo() << query.executedQuery();
        query.exec(sql);
        if(commitDB(&query)){return true;};
        return false;
    }
    FillInTheBlanksQuestion *fq = qobject_cast<FillInTheBlanksQuestion*>(question);
    if(fq){
        qInfo() << "填空题";
        sql = "INSERT INTO fill_in_the_blanks_questions VALUES (NULL,'%1','%2');";
        //        sql = sql.arg(fq->question).arg(fq->answer);
        sql = sql.arg(fq->question,fq->answer);
        qInfo() << sql;
        qInfo() << query.executedQuery();
        query.exec(sql);
        if(commitDB(&query)){return true;};
        return false;
    }
    //    m_query.clear();
    return false;
}

//QList<iQuestion*> SqlOperator::selectAllQuestion()
void SqlOperator::selectAllQuestion()
{
    qInfo() <<"test!!!!";

    //    QStringList sqls;
    //    QList<iQuestion *> questionlist;
    //    sqls.append("SELECT * FROM `choice_questions`;");
    //    sqls.append("SELECT * FROM `torf_questions`;");
    //    sqls.append("SELECT * FROM `fill_in_the_blanks_questions`;");
    QSqlTableModel *model = new QSqlTableModel(this,m_db);
    //    model.database();
    model->setTable("choice_questions");

    qInfo()<<model->select();
    //    foreach (QSqlTableModel a, model->data()) {

    //    }
    qInfo() << model;
    for(int i=0;i<model->rowCount(); i++){
        for(int j=0;j<model->columnCount(); j++){
            qInfo() << model->index(i,j).data();
        }
    }
    //    qInfo() << model->data();
    model->deleteLater();
    //   for(i)
    //    return
    //    qInfo() << model.record(1).value("question").toString();
}

bool SqlOperator::updateQuestion(iQuestion *question)
{
    if(!question) return false;
    QSqlQuery query = QSqlQuery(m_db);
    ChoiceQuestion *cq = qobject_cast<ChoiceQuestion*>(question);
    if(cq){
        query.prepare("UPDATE choice_questions SET question = :question,"
                      "option1 = :option1,option2 = :option2,option3 = :option3,"
                      "option4 = :option4,answer = :answer WHERE id = :id;");

        query.bindValue(":id",cq->id);
        query.bindValue(":question",cq->question);
        query.bindValue(":option1",cq->option1);
        query.bindValue(":option2",cq->option2);
        query.bindValue(":option3",cq->option3);
        query.bindValue(":option4",cq->option4);
        query.bindValue(":answer",cq->answer);
        query.exec();
        return commitDB(&query);
    }
    TrueOrFalseQuestion *tq = qobject_cast<TrueOrFalseQuestion*>(question);
    if(tq){
        query.prepare("UPDATE torf_questions SET question = :question, answer = :answer WHERE id = :id;");
        if(tq->answer){
            query.bindValue(":answer",1);
        }else{
            query.bindValue(":answer",0);
        }
        query.bindValue(":id",tq->id);
        query.bindValue(":question",tq->question);

        query.exec();
        return commitDB(&query);
    }
    FillInTheBlanksQuestion *fq = qobject_cast<FillInTheBlanksQuestion*>(question);
    if(fq){
        query.prepare("UPDATE fill_in_the_blanks_questions SET question = :question, answer = :answer WHERE id = :id;");
        query.bindValue(":id",fq->id);
        query.bindValue(":question",fq->question);
        query.bindValue(":answer",fq->answer);
        query.exec();
        return commitDB(&query);
    }
    return false;
}

bool SqlOperator::deleteQuestion(qint64 &id, qint32 &type)
{
    QSqlQuery query = QSqlQuery(m_db);
    //    QString sql;
    qInfo() << id << type;
    switch (type) {
    case choice:
    {
        query.prepare("DELETE FROM choice_questions WHERE id = :id;");
        query.bindValue(":id",id);
        query.exec();
        return commitDB(&query);
        break;
    }
    case trueOrFalse:
    {
        query.prepare("DELETE FROM torf_questions WHERE id = :id;");
        query.bindValue(":id",id);
        query.exec();
        return commitDB(&query);
        break;
    }
    case fill:{
        query.prepare("DELETE FROM fill_in_the_blanks_questions WHERE id = :id;");
        query.bindValue(":id",id);
        query.exec();
        return commitDB(&query);
        break;
    }
    default:
        break;
    }

    return false;
}

QList<QSharedPointer<ChoiceQuestion>> SqlOperator::selectAllCQuestion()
{
    QList<QSharedPointer<ChoiceQuestion>> list;
    QSqlQuery query =QSqlQuery(m_db);
    QString sql = "SELECT * FROM `choice_questions`;";
    query.exec(sql);
    while (query.next()) {
        QSharedPointer<ChoiceQuestion> p(new ChoiceQuestion());
        //        list.append(p);
        p->id = query.value(0).toLongLong();
        p->question = query.value(1).toString();
        p->option1 = query.value(2).toString();
        p->option2 = query.value(3).toString();
        p->option3 = query.value(4).toString();
        p->option4 = query.value(5).toString();
        p->answer = query.value(6).toString();
        list.append(p);
    }
    return list;
}

QList<QSharedPointer<TrueOrFalseQuestion>> SqlOperator::selectAllTQuestion()
{

    QList<QSharedPointer<TrueOrFalseQuestion>> list;
    QSqlQuery query =QSqlQuery(m_db);
    QString sql = "SELECT * FROM `torf_questions`;";
    query.exec(sql);
    while (query.next()) {
        QSharedPointer<TrueOrFalseQuestion> p(new TrueOrFalseQuestion());
        //        list.append(p);
        p->id = query.value(0).toLongLong();
        p->question = query.value(1).toString();
        p->answer = query.value(2).toBool();
        list.append(p);
    }
    return list;
}

QList<QSharedPointer<FillInTheBlanksQuestion>> SqlOperator::selectAllFQuestion()
{
    QList<QSharedPointer<FillInTheBlanksQuestion>> list;
    QSqlQuery query =QSqlQuery(m_db);
    QString sql = "SELECT * FROM `fill_in_the_blanks_questions`;";
    query.exec(sql);
    while (query.next()) {
        QSharedPointer<FillInTheBlanksQuestion> p(new FillInTheBlanksQuestion());
        //        list.append(p);
        p->id = query.value(0).toLongLong();
        p->question = query.value(1).toString();
        p->answer = query.value(2).toString();
        list.append(p);
    }
    return list;

}
