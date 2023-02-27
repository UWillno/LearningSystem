#ifndef HTTPSERVER_H
#define HTTPSERVER_H

#include <QObject>
#include <QHttpServer>
#include <QtConcurrent>
#include "sqloperator.h"
#include "singleton.h"
#include <QFuture>
#include <QJsonObject>
#include <QJsonArray>
#include <QJsonDocument>

class HttpServer : public QObject
{
    Q_OBJECT
public:
    explicit HttpServer(QObject *parent = nullptr);




signals:

private :
    QHttpServer server;
    void routeDeletePost();

    void routeGetPosts();

    void routeSubmitComment();

};

#endif // HTTPSERVER_H
