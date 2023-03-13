#ifndef POST_H
#define POST_H

#include <QObject>

class Post : public QObject
{
    Q_OBJECT
public:
    explicit Post(QObject *parent = nullptr);

signals:

};

#endif // POST_H
