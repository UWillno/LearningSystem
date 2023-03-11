#include "httpclient.h"



HttpClient::HttpClient(QObject *parent)
    : QObject{parent}
{
    manager = new QNetworkAccessManager(this);
    QObject::connect(this,&HttpClient::uploadXxtSucceed,this,[this]{
        QObject::disconnect(xxtCon);
    });
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

void HttpClient::uploadXxt(QUrl &path)
{


    QString url = "https://pan-yz.chaoxing.com/upload?_token=5d2e8d0aaa92e3701398035f530c4155";
    qInfo() <<path.toLocalFile();
    QFile file(path.toLocalFile());
    if(file.open(QIODevice::ReadOnly)){
        qInfo() <<" file open";
        QNetworkRequest request((QUrl(url)));
        request.setRawHeader("Cookie", "route=0a371e20663fc5318adffbeed948add0");
        QHttpMultiPart *multiPart = new QHttpMultiPart(QHttpMultiPart::FormDataType,this);
        QHttpPart puidPart;
        puidPart.setHeader(QNetworkRequest::ContentDispositionHeader, QVariant("form-data; name=\"puid\""));
        puidPart.setBody("80421235");
        QHttpPart filePart;
        filePart.setHeader(QNetworkRequest::ContentDispositionHeader, QVariant("form-data; name=\"file\";filename=\"123.jpg\""));
        //        filePart.setHeader(QNetworkRequest::ContentTypeHeader, QVariant("image/jpeg"));
        filePart.setBody(file.readAll());
        multiPart->append(puidPart);
        multiPart->append(filePart);
        //        qInfo() << filePart;
        manager->post(request,multiPart);
        xxtCon =  QObject::connect(manager,&QNetworkAccessManager::finished,this,[&,this](QNetworkReply *r){
            QJsonObject object = QJsonDocument::fromJson(r->readAll()).object();
            if(object.value("result").toBool()){
                emit this->uploadXxtSucceed(object.value("objectId").toString());
            }
        });

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

void HttpClient::uploadQrCode(QUrl &path)
{
    QString url ="https://www.devtool.top/api/qrcode/decode";
    QFile file(path.toLocalFile());
    if(file.open(QIODevice::ReadOnly)){
        qInfo() <<" file open";
        QNetworkRequest request((QUrl(url)));
        QHttpMultiPart *multiPart = new QHttpMultiPart(QHttpMultiPart::FormDataType);
        QHttpPart filePart;
        filePart.setHeader(QNetworkRequest::ContentDispositionHeader, QVariant("form-data; name=\"file\";filename=\"asd.jpg\""));
        filePart.setBody(file.readAll());
        multiPart->append(filePart);
        QNetworkReply *reply = manager->post(request,multiPart);
        multiPart->setParent(reply);
        qrScan = QObject::connect(manager,&QNetworkAccessManager::finished,this,[=](){
            QJsonObject object = QJsonDocument::fromJson(reply->readAll()).object();
            if(object.value("code").toInt() ==200){
                qInfo() << "解码成功";
//                qInfo() << object;
               emit decodeSucceed(object["data"].toObject()["text"].toString());
            }else{
                emit decodeFailed();
                qInfo() << "解码失败";
            }
            QObject::disconnect(qrScan);
        });

        file.close();
    }

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
