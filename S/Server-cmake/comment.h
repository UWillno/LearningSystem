#ifndef COMMENT_H
#define COMMENT_H

#include <QObject>
#include <QDateTime>

class Comment : public QObject
{
    Q_OBJECT
public:
    explicit Comment(QObject *parent = nullptr);
    qint32 id;
    qint32 postId;
    qint32 cxid;
    QString username;
    QString text;
    QDateTime datetime;
    qint32 replyId;

signals:

};

#endif // COMMENT_H
