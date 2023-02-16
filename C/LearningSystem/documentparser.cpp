#include "documentparser.h"

DocumentParser::DocumentParser(QObject *parent)
    : QObject{parent}
{

}

QVariantList DocumentParser::parserInfo(QString &html)
{
     QDomDocument doc;
     doc.setContent(html);


}
