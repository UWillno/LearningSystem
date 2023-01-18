#ifndef QUESTIONFACTORY_H
#define QUESTIONFACTORY_H

#include <QObject>
#include "interface/iQuestionFactory.h"
#include "trueorfalsequestion.h"
#include "choicequestion.h"
#include "fillintheblanksquestion.h"
class QuestionFactory : public QObject,public iQuestionFactory
{
    Q_OBJECT
public:
    explicit QuestionFactory(QObject *parent = nullptr);

signals:


    // iQuestionFactory interface
public:
    ChoiceQuestion *createChoiceQuestion();
    iQuestion *createTrueOrFalseQuestion();
    iQuestion *createFillInTheBlanksQuestion();


};

#endif // QUESTIONFACTORY_H
