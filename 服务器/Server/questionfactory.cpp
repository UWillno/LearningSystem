#include "questionfactory.h"

QuestionFactory::QuestionFactory(QObject *parent)
    : QObject{parent}
{

}

ChoiceQuestion *QuestionFactory::createChoiceQuestion()
{
    return new ChoiceQuestion();
}

iQuestion *QuestionFactory::createTrueOrFalseQuestion()
{
    return new TrueOrFalseQuestion();
}

iQuestion *QuestionFactory::createFillInTheBlanksQuestion()
{
    return new FillInTheBlanksQuestion();
}
