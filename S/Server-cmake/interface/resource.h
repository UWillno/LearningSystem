#ifndef RESOURCE_H
#define RESOURCE_H

#include <QObject>

class Resource : public QObject
{
    Q_OBJECT
public:
    explicit Resource(QObject *parent = nullptr);

signals:

};

#endif // RESOURCE_H
