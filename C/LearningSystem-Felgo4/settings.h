#ifndef SETTINGS_H
#define SETTINGS_H

#include <QObject>
#include <QSettings>
//#include <QSet>
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


    QSet<qint32> wrongCQ() const;
    void setWrongCQ(const QSet<qint32> &newWrongCQ);

    QSet<qint32> wrongTQ() const;
    void setWrongTQ(const QSet<qint32> &newWrongTQ);

    QSet<qint32> wrongFQ() const;
    void setWrongFQ(const QSet<qint32> &newWrongFQ);

    QSet<qint32> rightCQ() const;
    void setRightCQ(const QSet<qint32> &newRightCQ);

    QSet<qint32> rightTQ() const;
    void setRightTQ(const QSet<qint32> &newRightTQ);

    QSet<qint32> rightFQ() const;
    void setRightFQ(const QSet<qint32> &newRightFQ);

    Q_PROPERTY(QSet<qint32> wrongCQ READ wrongCQ WRITE setWrongCQ NOTIFY wrongCQChanged)
    Q_PROPERTY(QSet<qint32> wrongTQ READ wrongTQ WRITE setWrongTQ NOTIFY wrongTQChanged)
    Q_PROPERTY(QSet<qint32> wrongFQ READ wrongFQ WRITE setWrongFQ NOTIFY wrongFQChanged)
    Q_PROPERTY(QSet<qint32> rightCQ READ rightCQ WRITE setRightCQ NOTIFY rightCQChanged)
    Q_PROPERTY(QSet<qint32> rightTQ READ rightTQ WRITE setRightTQ NOTIFY rightTQChanged)
    Q_PROPERTY(QSet<qint32> rightFQ READ rightFQ WRITE setRightFQ NOTIFY rightFQChanged)

signals:

    void changed();

    void usernameChanged();

    void cxidChanged();

    void phoneChanged();

    void passwordChanged();

    void cookieChanged();

    void fileNameChanged();

    void wrongCQChanged();

    void wrongTQChanged();

    void wrongFQChanged();

    void rightCQChanged();

    void rightTQChanged();

    void rightFQChanged();

public slots:
    void save();
    void init();
    void insertW(qint32 id,qint32 type);
    void insertR(qint32 id,qint32 type);

    bool isWrong(qint32 id,qint32 type);
    bool isRight(qint32 id,qint32 type);

    bool removeW(qint32 id,qint32 type);

private:
    QSettings *m_settings;
    QString m_username;

    qint32 m_cxid;
    qint64 m_phone;
    QString m_password;
    QString m_cookie;
    QString m_fileName;

    QSet<qint32> m_wrongCQ;
    QSet<qint32> m_wrongTQ;
    QSet<qint32> m_wrongFQ;

    QSet<qint32> m_rightCQ;
    QSet<qint32> m_rightTQ;
    QSet<qint32> m_rightFQ;


};

#endif // SETTINGS_H
