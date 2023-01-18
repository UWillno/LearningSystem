#include "tcpclient.h"

TcpClient::TcpClient(QObject *parent)
    : QObject{parent}
{

}

QString TcpClient::host() const
{
    return m_host;
}

void TcpClient::setHost(const QString &newHost)
{
    m_host = newHost;
}

quint16 TcpClient::port() const
{
    return m_port;
}

void TcpClient::setPort(quint16 newPort)
{
    m_port = newPort;
}

void TcpClient::init(QString host,quint16 port)
{
    setPort(port);
    setHost(host);
}

bool TcpClient::toLogin(QStringList *list)
{
    //    Q_UNUSED(list);
    //测试用
    //    QStringList l;
    //    l.append("UWillno");
    //    l.append("44910244");

    QScopedPointer<QTcpSocket> p(new QTcpSocket());
    p->connectToHost(this->m_host,this->port());
    p->waitForConnected();
    QByteArray byte;
    QDataStream stream(&byte,QIODevice::WriteOnly);

    stream << login;
    stream << list->at(0).toUtf8();
    //    qInfo() << passwordCryptographicHash(list->at(1).toUtf8());
    stream << passwordCryptographicHash(list->at(1).toUtf8());
    qInfo() << byte;
    p->write(byte);
    //    p->write(list->at(0).toUtf8()+"#"+passwordCryptographicHash(list->at(1).toUtf8())+"#0");
    p->waitForBytesWritten();


    p->waitForReadyRead();
    QString data = QString(p->readAll()).simplified();
    qInfo() << data;
    if(data.contains("#")){
        bool ok;
        qint64 temp = data.split('#').at(1).toLongLong(&ok);
        if(ok){
            m_date = temp;
            qInfo() << "登陆成功!";
            p->close();
            return true;
        }
    }
    p->close();
    return false;
}

bool TcpClient::insertQuestion(QStringList *list, qint32 type)
{
    QScopedPointer<QTcpSocket> p(new QTcpSocket());
    p->connectToHost(this->m_host,this->port());
    p->waitForConnected();
    QByteArray byte;
    QDataStream stream(&byte,QIODevice::WriteOnly);
    stream << type;
    foreach(QString s,*list){
        stream << s;
    }
    stream << m_date;
    p->write(byte);
    p->waitForBytesWritten();
    p->waitForReadyRead();
    if(QString(p->readAll()).contains("ok")){
         p->close();
        return true;
    }
    p->close();
    return false;
}



QByteArray TcpClient::passwordCryptographicHash(QByteArray password)
{
    QCryptographicHash hash(QCryptographicHash::Sha256);
    hash.addData(password);
    return hash.result().toBase64();
}



