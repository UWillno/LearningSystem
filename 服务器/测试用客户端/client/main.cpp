#include <QCoreApplication>
//#include  "tcpclient.h"
//#include <QtConcurrent>
//#include <QFuture>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QEventLoop>
#include <QQmlNetworkAccessManagerFactory>
#include <QQmlImageProviderBase>
#include <QFile>
int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);


    //    TcpClient t;
    //    t.setHost("127.0.0.1");
    //    t.setPort(4444);
    //    QFuture<void> f=QtConcurrent::run(&t,&TcpClient::handle_task,0);
    QNetworkAccessManager manager;
    QNetworkRequest request(QUrl("http://p.ananas.chaoxing.com/star3/80_80c/09d05f59e53250e3e680aa96881d4b9d.png"));
    request.setRawHeader("user-agent","Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/107.0.0.0 Mobile Safari/537.36 Edg/107.0.1418.52");
    request.setHeader(QNetworkRequest::ContentTypeHeader,"application/x-www-form-urlencoded");
    QNetworkReply *reply =  manager.get(request);
    QEventLoop loop;
    QObject::connect(reply,&QNetworkReply::readyRead,&loop,&QEventLoop::quit);
    loop.exec();
//    reply->waitForReadyRead(50000);
    qInfo() << reply->errorString();
//    qInfo() << reply->readAll();

    QFile file("a.png");
    if(file.open(QIODevice::WriteOnly)){
        QByteArray byte = reply->readAll();
        file.write(byte);
        file.waitForBytesWritten();
        file.close();
    }



    return a.exec();
}
