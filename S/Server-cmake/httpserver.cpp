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
    routeUpload();
    routeSubmitResource();
    routeGetAllResources();
    routeUpdateResource();
    routeDeleteResource();
    routeGetResourcesByType();
    routeDeleteComment();
    routeSubmitPost();
    routeCreateUser();
    routeGetUserData();
    routeUpdateUserData();
    routeUserUploadImage();
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
                          comment.replyId = object.value("replyId").toInt();
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
    server.route("/getComments/<arg>",[](const qint32 page,const QHttpServerRequest &request){
        return QtConcurrent::run([&](){ return Singleton<SqlOperator>::GetInstance().selectCommentsA2(page);}).result();
    });
}

void HttpServer::routeUpload()
{
    server.route("/upload",[](const QHttpServerRequest &request){
        //        qInfo() << request.body();
        if(request.method() == QHttpServerRequest::Method::Post){
            qInfo() <<"上传"<< request.headers();
                                       QString hz="";
            foreach (std::pair pair, request.headers()) {
                if(pair.first == "Hz"){
                    hz = pair.second;
                    break;
                }
            }
            if(hz!="")
                return  QtConcurrent::run([&]{
                           QString filename = QUuid::createUuid().toString();
                           QFile file("/srv/http/resources/"+filename +"."+hz);
                           if(file.open(QIODevice::WriteOnly)){
                               file.write(request.body());
                               file.waitForBytesWritten(-1);
                           }
                           file.close();
                           return filename +"."+hz;
                       }).result();
        }

        return QString("error");
        //        return QtConcurrent::run([&](qint32 postId,qint32 page){ return Singleton<SqlOperator>::GetInstance().selectComments(postId,page);},postId,page).result();
    });
}

void HttpServer::routeSubmitResource()
{
    server.route("/submitResource",[](const QHttpServerRequest &request){

        if(request.method() == QHttpServerRequest::Method::Post){
            //            qInfo() << request.body();
            QJsonObject object = QJsonDocument::fromJson(request.body()).object();
            qInfo() << object;
            bool ok =  QtConcurrent::run([&](){
                          Resource res;
                          res.name = object.value("name").toString();
                          res.info = object.value("info").toString();
                          res.url = object.value("url").toString();
                          res.type = object.value("type").toInt();
                          return (Singleton<SqlOperator>::GetInstance().insertResource(res));
                      }).result();

            return ok ?   "success" :  "error";
        }
        return "error";
    });
}

void HttpServer::routeGetAllResources()
{
    server.route("/selectAllResources",[]{ return QtConcurrent::run([]{return Singleton<SqlOperator>::GetInstance().selectAllResources();}).result();});
}

void HttpServer::routeUpdateResource()
{
    server.route("/updateResource",[](const QHttpServerRequest &request){

        if(request.method() == QHttpServerRequest::Method::Post){
            //            qInfo() << request.body();
            QJsonObject object = QJsonDocument::fromJson(request.body()).object();
            qInfo() << object;
            bool ok =  QtConcurrent::run([&](){
                          Resource res;
                          res.id = object.value("id").toInt();
                          res.name = object.value("name").toString();
                          res.info = object.value("info").toString();
                          res.url = object.value("url").toString();
                          res.type = object.value("type").toInt();
                          return (Singleton<SqlOperator>::GetInstance().updateResource(res));
                      }).result();

            return ok ?   "success" :  "error";
        }
        return "error";
    });}

void HttpServer::routeDeleteResource()
{
    server.route("/deleteResource",[](const QHttpServerRequest &request){

        if (request.method() == QHttpServerRequest::Method::Post){
            QJsonObject object = QJsonDocument::fromJson(request.body()).object();
            qInfo() << object;
            bool ok =  QtConcurrent::run([&](){
                          qint32 id = object.value("id").toInt();
                          return (Singleton<SqlOperator>::GetInstance().deleteResource(id));
                      }).result();

            return ok ?   "success" :  "error";

        }else{
            return "error";
        }

        return "error";
    });
}

void HttpServer::routeGetResourcesByType()
{
    server.route("/getResourcesByType/",[](const qint32 type){ return QtConcurrent::run([](qint32 type){return Singleton<SqlOperator>::GetInstance().selectResources(type);},type).result();});
}

void HttpServer::routeDeleteComment()
{
    server.route("/deleteComment",[](const QHttpServerRequest &request){
        if (request.method() == QHttpServerRequest::Method::Post){
            QJsonObject object = QJsonDocument::fromJson(request.body()).object();
            qInfo() << object;
            bool ok =  QtConcurrent::run([&](){
                          qint32 id = object.value("id").toInt();
                          return (Singleton<SqlOperator>::GetInstance().deleteComment(id));
                      }).result();

            return ok ?   "success" :  "error";

        }else{
            return "error";
        }

        return "error";
    });
}

void HttpServer::routeSubmitPost()
{
    server.route("/submitPost",[](const QHttpServerRequest &request){

        if(request.method() == QHttpServerRequest::Method::Post){
            //            qInfo() << request.body();
            QJsonObject object = QJsonDocument::fromJson(request.body()).object();
            qInfo() << object;
            //            title,text,ss.cxid,ss.username,type
            bool ok =  QtConcurrent::run([&](){
                          Post post;
                          post.title = object.value("title").toString();
                          post.text = object.value("text").toString();
                          post.cxid = object.value("cxid").toInt();
                          post.username = object.value("username").toString();
                          post.type = object.value("type").toInt();
                          return (Singleton<SqlOperator>::GetInstance().submitPost(post));
                      }).result();

            return ok ?   "success" :  "error";
        }
        return "error";
    });
}

void HttpServer::routeCreateUser()
{
    server.route("/userExists/",[](const qint32 cxid){
        return QtConcurrent::run([&]{return Singleton<SqlOperator>::GetInstance().userExists(cxid);}).result() ? "exist" : "new";
    });

    server.route("/createUser",[](const QHttpServerRequest &request){

        if(request.method() == QHttpServerRequest::Method::Post){
            //            qInfo() << request.body();
            QJsonObject object = QJsonDocument::fromJson(request.body()).object();
            qInfo() << object;
            //            title,text,ss.cxid,ss.username,type
            //            bool ok = false;
            bool ok =  QtConcurrent::run([&](){
                          User user;
                          user.cxid = object.value("cxid").toInt();
                          user.username = object.value("username").toString();
                          return (Singleton<SqlOperator>::GetInstance().createUser(user));
                      }).result();

            return ok ?   "success" :  "error";
        }
        return "error";
    });
}

void HttpServer::routeGetUserData()
{
    server.route("/userData/",[](const qint32 cxid){
        return QtConcurrent::run([&]{return Singleton<SqlOperator>::GetInstance().getUserData(cxid);}).result();
        //        return Singleton<SqlOperator>::GetInstance().getUserData(cxid);
    });
}

void HttpServer::routeUpdateUserData()
{
    server.route("/uploadUserData",[](const QHttpServerRequest &request){

        if(request.method() == QHttpServerRequest::Method::Post){
            //            qInfo() << request.body();
            QJsonObject object = QJsonDocument::fromJson(request.body()).object();
            qInfo() << object;
            if(object.value("cxid").isNull()) return "error";
            if(!object.value("questions").isObject() || !object.value("exams").isArray()){
                return "error";
            }

            bool ok = QtConcurrent::run([&]{
                          User user;
                          user.cxid = object.value("cxid").toInt();
                          user.questions = object.value("questions").toObject();
                          user.exams = object.value("exams").toArray();
                          return (Singleton<SqlOperator>::GetInstance().updateUserData(user));
                      }).result();

            return ok ?   "success" :  "error";
        }
        return "error";
    });
}

void HttpServer::routeUserUploadImage()
{
    server.route("/userUploadImage",[](const QHttpServerRequest &request){
        if(request.method() == QHttpServerRequest::Method::Post){
            qInfo() <<"上传"<< request.headers();
                                       QString hz="";
            foreach (std::pair pair, request.headers()) {
                if(pair.first == "Hz"){
                    hz = pair.second;
                    break;
                }
            }
            //            qInfo() << hz;
            //            qInfo() << request.body();
            if(hz!="")
                return  QtConcurrent::run([&]{
                           QString filename = QUuid::createUuid().toString();
                           QFile file("/srv/http/images/"+filename +"."+hz);
                           if(file.open(QIODevice::WriteOnly)){
                               file.write(request.body());
                               file.waitForBytesWritten(-1);
                               qInfo() << file.fileName();
                           }
                           file.close();
                           return filename +"."+hz;
                       }).result();
        }
        return QString("error");

    });
}
