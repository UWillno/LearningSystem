#ifndef TRUEORFALSEQUESTION_H
#define TRUEORFALSEQUESTION_H

#include "interface/iQuestion.h"
#include <QObject>

class TrueOrFalseQuestion : public iQuestion
{
    Q_OBJECT
public:
    explicit TrueOrFalseQuestion(QObject *parent = nullptr);
    bool answer;
signals:


};

#endif // TRUEORFALSEQUESTION_H
