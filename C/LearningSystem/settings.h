#ifndef SETTINGS_H
#define SETTINGS_H

#include <QObject>
#include <QNetworkCookieJar>

class Settings : public QObject
{
    Q_OBJECT
public:
    explicit Settings(QObject *parent = nullptr);


signals:

private:
    qint32 m_cxid;
    qint32 m_phone;
    QString m_password;
//    QNetworkAccessManager
    QNetworkCookieJar m_cookie;


};

#endif // SETTINGS_H
