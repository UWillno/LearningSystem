#ifndef CHOICEQUESTION_H
#define CHOICEQUESTION_H

#include "interface/iQuestion.h"
#include <QObject>

class ChoiceQuestion : public QObject,public iQuestion
{
    Q_OBJECT
public:
    explicit ChoiceQuestion(QObject *parent = nullptr);
    QString option1;
    QString option2;
    QString option3;
    QString option4;
signals:



};

#endif // CHOICEQUESTION_H
