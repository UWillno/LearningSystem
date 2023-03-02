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
#include <QHttpMultiPart>
#include <QHttpServerResponse>

class HttpServer : public QObject
{
    Q_OBJECT
public:
    explicit HttpServer(QObject *parent = nullptr);




signals:

private :
    QHttpServer server;
    //删除帖子
    void routeDeletePost();
    // 获取帖子
    void routeGetPosts();
    //提交评论
    void routeSubmitComment();
    // 获取评论
    void routeGetComments();
    // 资源文件上传
    void routeUpload();
    // 资源提交入库
    void routeSubmitResource();
    // 获取全部资源文件
    void routeGetAllResources();
    // 更新资源
    void routeUpdateResource();
    // 删除资源
    void routeDeleteResource();

};

#endif // HTTPSERVER_H
