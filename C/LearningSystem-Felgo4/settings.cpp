#include "settings.h"

Settings::Settings(QObject *parent)
    : QObject{parent}
{
    qRegisterMetaType<QSet<qint32>>("QSet<qint32>");
    qInfo() <<"Settings !!!";
    m_settings = new QSettings("./config",QSettings::NativeFormat,this);
    qInfo() << m_settings->fileName();
    init();
    QObject::connect(this,&Settings::cookieChanged,this,[&]{
        save();
    });
    QObject::connect(this,&Settings::cxidChanged,this,[&]{
        save();
    });
    QObject::connect(this,&Settings::usernameChanged,this,[&]{
        save();
    });
    QObject::connect(this,&Settings::passwordChanged,this,[&]{
        save();
    });
    QObject::connect(this,&Settings::rightCQChanged,this,[&]{
        save();
    });
    QObject::connect(this,&Settings::rightTQChanged,this,[&]{
        save();
    });
    QObject::connect(this,&Settings::rightFQChanged,this,[&]{
        save();
    });
    QObject::connect(this,&Settings::wrongCQChanged,this,[&]{
        save();
    });

    QObject::connect(this,&Settings::wrongFQChanged,this,[&]{
        save();
    });
    QObject::connect(this,&Settings::wrongTQChanged,this,[&]{
        save();
    });
    QObject::connect(this,&Settings::phoneChanged,this,[&]{
        save();
    });
    QObject::connect(this,&Settings::changed,this,[&]{
        save();
    });
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
    m_settings->setValue("wrongCQ",QVariant::fromValue(wrongCQ()));
    m_settings->setValue("wrongTQ",QVariant::fromValue(wrongTQ()));
    m_settings->setValue("wrongFQ",QVariant::fromValue(wrongFQ()));
    m_settings->setValue("rightCQ",QVariant::fromValue(rightCQ()));
    m_settings->setValue("rightTQ",QVariant::fromValue(rightTQ()));
    m_settings->setValue("rightFQ",QVariant::fromValue(rightFQ()));

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
    setWrongCQ(m_settings->value("wrongCQ").value<QSet<qint32>>());
    setWrongTQ(m_settings->value("wrongTQ").value<QSet<qint32>>());
    setWrongFQ(m_settings->value("wrongFQ").value<QSet<qint32>>());
    setRightCQ(m_settings->value("rightCQ").value<QSet<qint32>>());
    setRightTQ(m_settings->value("rightTQ").value<QSet<qint32>>());
    setRightFQ(m_settings->value("rightFQ").value<QSet<qint32>>());

}

void Settings::insertW(qint32 id, qint32 type)
{
    switch (type) {
    case 0:{
        m_wrongCQ.insert(id);
        break;
    }
    case 1:{
        m_wrongTQ.insert(id);
        break;
    }
    case 2:
        m_wrongFQ.insert(id);
        break;
    }
    emit changed();
    //    save();
    //    emit wrongTQChanged()
}

void Settings::insertR(qint32 id, qint32 type)
{
    switch (type) {
    case 0:{
        m_rightCQ.insert(id);
        break;
    }
    case 1:{
        m_rightTQ.insert(id);
        break;
    }
    case 2:{
        m_rightFQ.insert(id);
        break;
    }
    }
    //    save();
    emit changed();
}

bool Settings::isWrong(qint32 id, qint32 type)
{
    switch (type) {
    case 0:{
        return m_wrongCQ.contains(id);
    } //        break;
    case 1:{
        return m_wrongTQ.contains(id);
    }//        break;
    case 2:{
        return m_wrongFQ.contains(id);
    }//        break;
    }
    return false;
}

bool Settings::isRight(qint32 id, qint32 type)
{
    switch (type) {
    case 0:{
        return m_rightCQ.contains(id);
        }//        break;
    case 1:{
        return m_rightTQ.contains(id);
        }//        break;
    case 2:{
        return m_rightFQ.contains(id);
        }//        break;
    }
    return false;
}

bool Settings::removeW(qint32 id, qint32 type)
{
    //    qInfo() << type;
    switch (type) {
    case 0:{
//        qInfo() << m_wrongCQ;
//        qInfo() << id;
        if(m_wrongCQ.remove(id))
        {
//            qInfo() << m_rightCQ;
            emit changed();
            return true;
        }
        else
        {
//            qInfo() <<m_wrongCQ;
            return false;
        }
        //        break;
    }
    case 1:{
        //        break;
        if(m_wrongTQ.remove(id))
        {
            emit changed();
            return true;
        }
        else
        {
            return false;
        }
    }
    case 2:
    {
        if(m_wrongFQ.remove(id))
        {
            emit changed();
            return true;
        }
        else
        {
            return false;
        }
    }
    }
    return false;
}

void Settings::clear()
{
    resetCookie();
    resetCxid();
    resetUsername();
    resetPassword();
    resetPhone();
//    resetRightCQ();
//    resetRightFQ();
//    resetRightTQ();
//    resetWrongCQ();
//    resetWrongFQ();
    //    resetWrongTQ();
}

void Settings::questionsClear()
{
    resetRightCQ();
    resetRightFQ();
    resetRightTQ();
    resetWrongCQ();
    resetWrongFQ();
    resetWrongTQ();

}

void Settings::resetRightFQ()
{
    setRightFQ({}); // TODO: Adapt to use your actual default value
}

void Settings::resetRightTQ()
{
    setRightTQ({}); // TODO: Adapt to use your actual default value
}

void Settings::resetRightCQ()
{
    setRightCQ({}); // TODO: Adapt to use your actual default value
}

void Settings::resetWrongFQ()
{
    setWrongFQ({}); // TODO: Adapt to use your actual default value
}

void Settings::resetWrongTQ()
{
    setWrongTQ({}); // TODO: Adapt to use your actual default value
}

void Settings::resetWrongCQ()
{
    setWrongCQ({}); // TODO: Adapt to use your actual default value
}

void Settings::resetFileName()
{
    setFileName({}); // TODO: Adapt to use your actual default value
}

void Settings::resetCookie()
{
    setCookie({}); // TODO: Adapt to use your actual default value
}

void Settings::resetPassword()
{
    setPassword({}); // TODO: Adapt to use your actual default value
}

void Settings::resetPhone()
{
    setPhone({}); // TODO: Adapt to use your actual default value
}

void Settings::resetCxid()
{
    setCxid({}); // TODO: Adapt to use your actual default value
}

void Settings::resetUsername()
{
    setUsername({}); // TODO: Adapt to use your actual default value
}

QSet<qint32> Settings::rightFQ() const
{
    return m_rightFQ;
}

void Settings::setRightFQ(const QSet<qint32> &newRightFQ)
{
    if (m_rightFQ == newRightFQ)
        return;
    m_rightFQ = newRightFQ;
    emit rightFQChanged();
}

QSet<qint32> Settings::rightTQ() const
{
    return m_rightTQ;
}

void Settings::setRightTQ(const QSet<qint32> &newRightTQ)
{
    if (m_rightTQ == newRightTQ)
        return;
    m_rightTQ = newRightTQ;
    emit rightTQChanged();
}

QSet<qint32> Settings::rightCQ() const
{
    return m_rightCQ;
}

void Settings::setRightCQ(const QSet<qint32> &newRightCQ)
{
    if (m_rightCQ == newRightCQ)
        return;
    m_rightCQ = newRightCQ;
    emit rightCQChanged();
}

QSet<qint32> Settings::wrongFQ() const
{
    return m_wrongFQ;
}

void Settings::setWrongFQ(const QSet<qint32> &newWrongFQ)
{
    if (m_wrongFQ == newWrongFQ)
        return;
    m_wrongFQ = newWrongFQ;
    emit wrongFQChanged();
}

QSet<qint32> Settings::wrongTQ() const
{
    return m_wrongTQ;
}

void Settings::setWrongTQ(const QSet<qint32> &newWrongTQ)
{
    if (m_wrongTQ == newWrongTQ)
        return;
    m_wrongTQ = newWrongTQ;
    emit wrongTQChanged();
}

QSet<qint32> Settings::wrongCQ() const
{
    return m_wrongCQ;
}

void Settings::setWrongCQ(const QSet<qint32> &newWrongCQ)
{
    if (m_wrongCQ == newWrongCQ)
        return;
    m_wrongCQ = newWrongCQ;
    emit wrongCQChanged();
}
