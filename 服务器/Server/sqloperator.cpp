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
    if(!m_query.exec(sql)){
        qInfo() << "error";
        m_query.clear();
        return false;
    }
    if(m_query.next()){
        QByteArray true_pwd = m_query.value(0).toByteArray();
//        QCryptographicHash hash(QCryptographicHash::Sha256);
//        hash.addData(password.toUtf8());
        qInfo() << true_pwd;
        if(true_pwd == password.toUtf8()){
            qInfo() << "登陆成功";
            m_query.clear();
            return true;
        }
    }
    m_query.clear();
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
        qInfo() << "连接数据库失败";
        return false;
    }
    m_query =QSqlQuery(m_db);
    qInfo() << "连接成功";
    return true;
}
