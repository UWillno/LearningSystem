#ifndef RESOURCE_H
#define RESOURCE_H

#include <QObject>

class Resource : public QObject
{
    Q_OBJECT
public:
    explicit Resource(QObject *parent = nullptr);
    qint32 id;
    QString name;
    QString info;
    QString url;
    qint32 type;

signals:



};

#endif // RESOURCE_H
