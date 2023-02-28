#include "httpserver.h"

HttpServer::HttpServer(QObject *parent)
    : QObject{parent}
{
    //    QHttpServer httpServer; //    此模块处于“技术预览”状态。
    server.route("/selectAllPosts",[]{ return QtConcurrent::run([]{return Singleton<SqlOperator>::GetInstance().selectPosts();}).result();});




    routeDeletePost();
    routeGetPosts();
    routeSubmitComment();
    routeGetComments();
    //    http://127.0.0.1:4444/test/1
//    server.route("/test/", [] (const int page, const int sd) {
//        qInfo()<< page;
//        qInfo()<< sd;


//        return "asdasd"; });




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

void HttpServer::routeGetPosts()
{
    server.route("/getPosts/",[](const qint32 page,const QHttpServerRequest &request){

        //        auto p = &Singleton<SqlOperator>::GetInstance();
        return QtConcurrent::run([](qint32 page){ return Singleton<SqlOperator>::GetInstance().selectPosts(page);},page).result();
    });
}

void HttpServer::routeSubmitComment()
{
    server.route("/submitComment",[](const QHttpServerRequest &request){
        if (request.method() == QHttpServerRequest::Method::Post){
            qInfo() << request.body();
            QJsonObject object = QJsonDocument::fromJson(request.body()).object();
            qInfo() << object;
            //            bool insertComment(qint32 &postId,qint32 &cxid,QString &username,QString &text);

            bool ok =  QtConcurrent::run([&](){
                Comment comment;
                comment.postId = object.value("postId").toInt();
                comment.cxid = object.value("cxid").toInt();
                comment.username = object.value("username").toString();
                comment.text = object.value("text").toString();
                return (Singleton<SqlOperator>::GetInstance().insertComment(comment));
            }).result();

            return ok ?   "success" :  "error";
            //            //            object.value
        }
        return "error";
    });
}

void HttpServer::routeGetComments()
{
    server.route("/getComments/<arg>/<arg>",[](const qint32 postId,const qint32 page,const QHttpServerRequest &request){

        return QtConcurrent::run([&](qint32 postId,qint32 page){ return Singleton<SqlOperator>::GetInstance().selectComments(postId,page);},postId,page).result();
    });
}
