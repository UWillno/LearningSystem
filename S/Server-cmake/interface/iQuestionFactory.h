#ifndef IQUESTIONFACTORY_H
#define IQUESTIONFACTORY_H
#include "iQuestion.h"
//#include "../choicequestion.h"
//#include "../fillintheblanksquestion.h"
//#include "../trueorfalsequestion.h"

class iQuestionFactory{
public:
    virtual iQuestion* createChoiceQuestion() = 0;
    virtual iQuestion* createTrueOrFalseQuestion() = 0;
    virtual iQuestion* createFillInTheBlanksQuestion() = 0;
    virtual ~iQuestionFactory(){};
};

#endif // IQUESTIONFACTORY_H
