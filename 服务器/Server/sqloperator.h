#ifndef SQLOPERATOR_H
#define SQLOPERATOR_H

#include <QObject>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QCryptographicHash>
#include <QDebug>
#include "interface/iQuestion.h"
#include "choicequestion.h"
#include "trueorfalsequestion.h"

class SqlOperator : public QObject
{
    Q_OBJECT
public:
    explicit SqlOperator(QObject *parent = nullptr);
    ~SqlOperator();

    bool login(QString username,QString password);
    bool connect(QString hostname="",
                 int port=3306,
                 QString databasename="",
                 QString username="",
                 QString password="");

    bool commitDB(QSqlQuery *query);
signals:

public slots:
    bool insertQuestion(iQuestion * question);

private:
    QSqlDatabase m_db;

//    QSqlQuery m_query;
};

#endif // SQLOPERATOR_H
