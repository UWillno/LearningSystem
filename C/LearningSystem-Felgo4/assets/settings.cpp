#include "settings.h"

Settings::Settings(QObject *parent)
    : QObject{parent}
{

    qInfo() <<"Settings !!!";
    m_settings = new QSettings("./config",QSettings::NativeFormat,this);
    init();
}

QString Settings::username() const
{
    return m_username;
}

void Settings::setUsername(const QString &newUsername)
{
    if (m_username == newUsername)
        return;
    m_username = newUsername;
    emit usernameChanged();
}

qint32 Settings::cxid() const
{
    return m_cxid;
}

void Settings::setCxid(qint32 newCxid)
{
    if (m_cxid == newCxid)
        return;
    m_cxid = newCxid;
    emit cxidChanged();
}

qint64 Settings::phone() const
{
    return m_phone;
}

void Settings::setPhone(qint64 newPhone)
{
    if (m_phone == newPhone)
        return;
    m_phone = newPhone;
    emit phoneChanged();
}

QString Settings::password() const
{
    return m_password;
}

void Settings::setPassword(const QString &newPassword)
{
    if (m_password == newPassword)
        return;
    m_password = newPassword;
    emit passwordChanged();
}

QString Settings::cookie() const
{
    return m_cookie;
}

void Settings::setCookie(const QString &newCookie)
{
    if (m_cookie == newCookie)
        return;
    m_cookie = newCookie;
    emit cookieChanged();
}

QString Settings::fileName() const
{
    return m_fileName;
}

void Settings::setFileName(const QString &newFileName)
{
    if (m_fileName == newFileName)
        return;
    m_fileName = newFileName;
    emit fileNameChanged();
}

void Settings::save()
{
    //    m_settings->clear();
    qInfo() <<"Settings save!!!";
    m_settings->setValue("username",m_username);
    m_settings->setValue("phone",m_phone);
    m_settings->setValue("password",m_password);
    m_settings->setValue("cxid",m_cxid);
    m_settings->setValue("cookie",m_cookie);
    //    m_settings->sync();
}

void Settings::init()
{
//    qInfo() <<"Settings init !!!";
    setCxid(m_settings->value("cxid").toInt());
//    qInfo() <<"1" <<  m_settings->value("cxid").toInt() ;
    setUsername(m_settings->value("username").toString());
//    qInfo() <<"2" <<  m_settings->value("username").toString() ;
    setPassword(m_settings->value("password").toString());
//    qInfo() <<"3" << m_settings->value("password").toString() ;
    setCookie(m_settings->value("cookie").toString());
//    qInfo() <<"4" << m_settings->value("cookie").toString() ;
    setPhone(m_settings->value("phone").toLongLong());
//    qInfo() <<"5" << m_settings->value("phone").toLongLong() ;
}
