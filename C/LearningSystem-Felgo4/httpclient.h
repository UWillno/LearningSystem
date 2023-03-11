#ifndef HTTPCLIENT_H
#define HTTPCLIENT_H

#include <QObject>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>
#include <QFile>
#include <QtConcurrent>
#include <QFuture>
#include <QHttpMultiPart>
class HttpClient : public QObject
{
    Q_OBJECT
public:
    explicit HttpClient(QObject *parent = nullptr);



signals:
    void getFilenameFailed();
    void getFilenameSucceed(QString url);
    void uploadXxtSucceed(QString objectId);
    void decodeSucceed(QString url);
    void decodeFailed();

public slots:
    void uploadFile(QUrl &path);
    void uploadXxt(QUrl &path);

    void getFilename(QNetworkReply *r);

    void uploadQrCode(QUrl &path);

private:
    //     QString qhost = "http://127.0.0.1:4444/";
    //     QString ahost = "http://127.0.0.1/";
    //     QString host ="http://192.168.1.107:4444/";
    QString qhost = "http://192.168.1.244:4444/";
    QString ahost = "http://192.168.1.244/";

    QNetworkAccessManager *manager;

    QMetaObject::Connection xxtCon;

    QMetaObject::Connection qrScan;
};

#endif // HTTPCLIENT_H
