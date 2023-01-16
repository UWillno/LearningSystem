#ifndef QMLMEDIATOR_H
#define QMLMEDIATOR_H

#include <QObject>

class QmlMediator : public QObject
{
    Q_OBJECT
public:
    explicit QmlMediator(QObject *parent = nullptr);

signals:

};

#endif // QMLMEDIATOR_H
