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

void TcpClient::toLogin(QStringList *list)
{
    Q_UNUSED(list);
    //测试用
    QStringList l;
    l.append("UWillno");
    l.append("44910244");

    QScopedPointer<QTcpSocket> p(new QTcpSocket());
    p->connectToHost(this->m_host,this->port());
    p->waitForConnected();
    p->write(l.at(0).toUtf8()+"#"+passwordCryptographicHash(l.at(1).toUtf8())+"#0");
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
        }
    }
}

void TcpClient::handle_task(int t)
{
    switch (t) {
    case login:{
        QStringList *list=nullptr;
        toLogin(list);
        break;
    }
    default:
        break;
    }
}

QByteArray TcpClient::passwordCryptographicHash(QByteArray password)
{
    QCryptographicHash hash(QCryptographicHash::Sha256);
    hash.addData(password);
    return hash.result().toBase64();
}



