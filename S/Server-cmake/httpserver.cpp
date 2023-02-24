#include "httpserver.h"

HttpServer::HttpServer(QObject *parent)
    : QObject{parent}
{
    //    QHttpServer httpServer; //    此模块处于“技术预览”状态。
    server.route("/selectAllPosts",[]{ return QtConcurrent::run([]{return Singleton<SqlOperator>::GetInstance().selectPosts();}).result();});




    routeDeletePost();
    //    http://127.0.0.1:4444/test/1
    server.route("/test/", [] (const int page, const int sd) {
        qInfo()<< page;
        qInfo()<< sd;


        return "asdasd"; });




    //    server.route("/deletePost/",[](const qint32 id, const qint64 Verification))

    server.listen(QHostAddress::Any,4444);
}

void HttpServer::routeDeletePost()
{
    server.route("/deletePost",[](const QHttpServerRequest &request){

        if (request.method() == QHttpServerRequest::Method::Post){
            QJsonObject object = QJsonDocument::fromJson(request.body()).object();
            qInfo() << object;
            if(object.value("postId").isDouble()){
                qInfo() << object.value("postId").toInt();
                auto *p = &Singleton<SqlOperator>::GetInstance();
                QFuture<bool> future = QtConcurrent::run([&p](qint32 id){ return p->deletePost(id);},object.value("postId").toInt());

                if(future.result()){
                    return "success";
                }

            }

        }else{
            return "error";
        }

        return "error";
    });
}
