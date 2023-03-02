#ifndef HTTPCLIENT_H
#define HTTPCLIENT_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QFile>
#include <QtConcurrent>
#include <QFuture>

class HttpClient : public QObject
{
    Q_OBJECT
public:
    explicit HttpClient(QObject *parent = nullptr);



signals:
    void getFilenameFailed();
    void getFilenameSucceed(QString url);


public slots:
     void uploadFile(QUrl &path);

     void getFilename(QNetworkReply *r);

private:
     QString qhost = "http://127.0.0.1:4444/";
     QString ahost = "http://127.0.0.1/";
//     QString host ="http://192.168.1.107:4444/";

     QNetworkAccessManager *manager;
};

#endif // HTTPCLIENT_H
