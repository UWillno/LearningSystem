#ifndef SQLOPERATOR_H
#define SQLOPERATOR_H

#include <QObject>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QCryptographicHash>
#include <QDebug>
#include <QFile>
#include <QDir>
#include <QJsonArray>
#include <QJsonObject>
#include <QSqlTableModel>
#include "interface/iQuestion.h"
#include "choicequestion.h"
#include "trueorfalsequestion.h"
#include "fillintheblanksquestion.h"
#include <QJsonDocument>
#include <QtConcurrent>
#include "post.h"
#include "comment.h"
#include "resource.h"
#include "user.h"

//#include "
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

    bool updateQuestion(iQuestion * question);
    bool deleteQuestion(qint32 &id , int &type);

    QList<QSharedPointer<ChoiceQuestion>> selectAllCQuestion();
    QList<QSharedPointer<TrueOrFalseQuestion>> selectAllTQuestion();
    QList<QSharedPointer<FillInTheBlanksQuestion>> selectAllFQuestion();

    void commitQuestions();

    // 弃用
    bool submitPost(QString &title, QString &text, qint32 &cxid, QString &username,qint32 &type);

    QJsonArray selectPosts();

    QJsonArray selectComments(qint32 &postId);

    bool deletePost(qint32 &id);

    bool deleteComments(qint32 &id);

    bool deleteComment(qint32 &id);

    QJsonArray selectPosts(qint32 &page);

    bool insertComment(Comment &comment);

    //查询评论的评论
    QJsonArray select2Comments(qint32 &replyId);


    QJsonArray selectComments(qint32 &postId,const qint32 &page);

    qint32 selectCommentsCount(qint32 &postId);

    bool insertResource(Resource &res);

    QJsonArray selectAllResources();

    bool updateResource(Resource &res);

    bool deleteResource(qint32 &id);

    QJsonArray selectResources(qint32 &type);

    bool submitPost(Post &post);

    bool createUser(User &user);

    bool userExists(const qint32 &cxid);

    bool updateUserData(User &user);

    QJsonObject getUserData(const qint32 &cxid);

private:
    QSqlDatabase m_db;

    //    QSqlQuery m_query;
};

#endif // SQLOPERATOR_H
