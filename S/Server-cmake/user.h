#ifndef USER_H
#define USER_H

#include <QObject>
#include <QJsonArray>

class User : public QObject
{
    Q_OBJECT
public:
    explicit User(QObject *parent = nullptr);

    QString username;
    qint32 cxid;
    // 错题
    QJsonArray questions;
    // 考试
    QJsonArray exams;


signals:



};

#endif // USER_H
