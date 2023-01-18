#ifndef IQUESTION_H
#define IQUESTION_H

#include <QObject>

class iQuestion :public QObject{
    Q_OBJECT
public:
    qint64 id;
    QString question;
    QString answer;
    //    QString point;
    //    QString anlysis;
    virtual ~iQuestion(){};
};

#endif // IQUESTION_H
