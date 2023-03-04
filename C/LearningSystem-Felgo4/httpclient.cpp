#include "httpclient.h"

HttpClient::HttpClient(QObject *parent)
    : QObject{parent}
{
    manager = new QNetworkAccessManager(this);
}

void HttpClient::uploadFile(QUrl &path)
{
    //    manager->clearConnectionCache();
    qInfo()<<"httpclient:"<< path;
    qInfo()<<"upload by http";
    qInfo() <<path.toLocalFile();
    QFile file(path.toLocalFile());
    //    qInfo() << path.toLocalFile().split(".").back();
    if(file.open(QIODevice::ReadOnly)){
        qInfo() <<" file open";
        QNetworkRequest request(QUrl(qhost + "upload"));
        request.setHeader(QNetworkRequest::ContentTypeHeader, "application/octet-stream");
        request.setHeader(QNetworkRequest::ContentLengthHeader, QByteArray::number(file.size()));
        request.setRawHeader("Hz",path.toLocalFile().split(".").back().toUtf8());
        manager->post(request, file.readAll());
        QObject::connect(manager,&QNetworkAccessManager::finished,this,&HttpClient::getFilename);
        file.close();
    }

}

void HttpClient::getFilename(QNetworkReply *r)
{
    QObject::disconnect(manager,&QNetworkAccessManager::finished,this,&HttpClient::getFilename);
    QString result =  r->readAll();
    if(result == "error" || result == ""){
        emit getFilenameFailed();
        return;
    }
    qInfo() << ahost+"resources/"+result;
    emit getFilenameSucceed(ahost+"resources/"+result);

}

//void HttpClient::uploadFile()
//{
////    QFile file("/home/uwillno/Downloads/[Lilith-Raws] Dungeon ni Deai wo Motomeru no wa Machigatteiru Darou ka S04 - 19 [Baha][WEB-DL][1080p][AVC AAC][CHT][MP4].mp4");
////    if (!file.open(QIODevice::ReadOnly)) {
////        qInfo() << "Failed to open file";
////        return;
////    }
////    QNetworkAccessManager manager;
////    QNetworkRequest request(QUrl("http://127.0.0.1:4444/upload"));
////    request.setHeader(QNetworkRequest::ContentTypeHeader, "application/octet-stream");
////    QNetworkReply *reply = manager.post(request, file.readAll());
////    file.close();
//}
