#ifndef FILLINTHEBLANKSQUESTION_H
#define FILLINTHEBLANKSQUESTION_H

#include "interface/iQuestion.h"
#include <QObject>

class FillInTheBlanksQuestion : public QObject, public iQuestion
{
    Q_OBJECT
public:
    explicit FillInTheBlanksQuestion(QObject *parent = nullptr);

signals:

};

#endif // FILLINTHEBLANKSQUESTION_H
