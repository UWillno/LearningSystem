#ifndef POST_H
#define POST_H

#include <QObject>
#include <QDateTime>
#include <QJsonArray>

class Post : public QObject
{
    Q_OBJECT
public:
    explicit Post(QObject *parent = nullptr);

    qint32 id;
    qint32 cxid;
    QString username;
    QString title;
    QString text;
    QDateTime datetime;
    qint32 type;
    QJsonArray comments;

signals:

};

#endif // POST_H
