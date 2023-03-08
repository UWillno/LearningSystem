#ifndef USER_H
#define USER_H

#include <QObject>
#include <QJsonArray>
#include <QJsonObject>

class User : public QObject
{
    Q_OBJECT
public:
    explicit User(QObject *parent = nullptr);

    QString username;
    qint32 cxid;
    // 错题
    QJsonObject questions;
    // 考试
    QJsonArray exams;


signals:



};

#endif // USER_H
