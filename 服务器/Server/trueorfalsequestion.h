#ifndef TRUEORFALSEQUESTION_H
#define TRUEORFALSEQUESTION_H

#include "interface/iQuestion.h"
#include <QObject>

class TrueOrFalseQuestion : public QObject, public iQuestion
{
    Q_OBJECT
public:
    explicit TrueOrFalseQuestion(QObject *parent = nullptr);

signals:

};

#endif // TRUEORFALSEQUESTION_H
