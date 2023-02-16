#ifndef DOCUMENTPARSER_H
#define DOCUMENTPARSER_H

#include <QObject>
#include <QDomDocument>
#include <QDomElement>
#include <QJsonArray>
class DocumentParser : public QObject
{
    Q_OBJECT
public:
    explicit DocumentParser(QObject *parent = nullptr);

    QVariantList parserInfo(QString &html);

signals:

//public slots:

};

#endif // DOCUMENTPARSER_H
