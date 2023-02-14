#ifndef SQLOPERATOR_H
#define SQLOPERATOR_H

#include <QObject>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QCryptographicHash>
#include <QDebug>
#include <QSqlTableModel>
#include "interface/iQuestion.h"
#include "choicequestion.h"
#include "trueorfalsequestion.h"
#include "fillintheblanksquestion.h"
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
    enum question_type{choice,trueOrFalse,fill};
signals:

public slots:
    bool insertQuestion(iQuestion * question);
//    QList<iQuestion*> selectAllQuestion();
    void selectAllQuestion();

    bool modifyQuestion(iQuestion * question);
    bool deleteQuestion(qint64 &id , int &type);

    QList<QSharedPointer<ChoiceQuestion>> selectAllCQuestion();
    QList<QSharedPointer<TrueOrFalseQuestion>> selectAllTQuestion();
    QList<QSharedPointer<FillInTheBlanksQuestion>> selectAllFQuestion();



private:
    QSqlDatabase m_db;

    //    QSqlQuery m_query;
};

#endif // SQLOPERATOR_H
