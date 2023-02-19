#ifndef SETTINGS_H
#define SETTINGS_H

#include <QObject>
#include <QSettings>
class Settings : public QObject
{
    Q_OBJECT
public:
    explicit Settings(QObject *parent = nullptr);

    QString username() const;
    void setUsername(const QString &newUsername);

    qint32 cxid() const;
    void setCxid(qint32 newCxid);

    qint64 phone() const;
    void setPhone(qint64 newPhone);

    QString password() const;
    void setPassword(const QString &newPassword);

    QString cookie() const;
    void setCookie(const QString &newCookie);

    QString fileName() const;
    void setFileName(const QString &newFileName);

    Q_PROPERTY(QString username READ username WRITE setUsername NOTIFY usernameChanged)
    Q_PROPERTY(qint32 cxid READ cxid WRITE setCxid NOTIFY cxidChanged)
    Q_PROPERTY(qint64 phone READ phone WRITE setPhone NOTIFY phoneChanged)
    Q_PROPERTY(QString password READ password WRITE setPassword NOTIFY passwordChanged)
    Q_PROPERTY(QString cookie READ cookie WRITE setCookie NOTIFY cookieChanged)
    Q_PROPERTY(QString fileName READ fileName WRITE setFileName NOTIFY fileNameChanged)


signals:

    void usernameChanged();

    void cxidChanged();

    void phoneChanged();

    void passwordChanged();

    void cookieChanged();

    void fileNameChanged();

public slots:
       void save();
       void init();

private:
    QSettings *m_settings;
    QString m_username;

    qint32 m_cxid;
    qint64 m_phone;
    QString m_password;
    QString m_cookie;
    QString m_fileName;


    //        property int cxid
    //        property double phone
    //        property string password
    //        property var cookie
    //        //         fileName:""



  };

#endif // SETTINGS_H
