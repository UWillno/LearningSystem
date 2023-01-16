#include "server.h"

Server::Server(QObject *parent) : QTcpServer(parent)
{

}

Server::~Server()
{
    close();
}

void Server::close()
{
    foreach(QTcpSocket *socket, m_clients)
    {
        socket->close();
    }

    qDeleteAll(m_clients);
    m_clients.clear();

    QTcpServer::close();
}


void Server::incomingConnection(qintptr handle)
{
    QTcpSocket *socket = new QTcpSocket(this);
    m_clients.append(socket);

    connect(socket,&QTcpSocket::connected,this,&Server::connected);
    connect(socket,&QTcpSocket::readyRead,this,&Server::readyRead);
    connect(socket,&QTcpSocket::disconnected,this,&Server::disconnected);

    socket->setSocketDescriptor(handle);
    emit socket->connected();
}

void Server::connected()
{
    QTcpSocket *socket = qobject_cast<QTcpSocket*>(sender());
    if(!socket) return;

}

void Server::readyRead()
{
    QTcpSocket *socket = qobject_cast<QTcpSocket*>(sender());
    if(!socket) return;

    //Check the socket for other possible issues

    QByteArray value = socket->readAll();
    qInfo() << value;


//    QString line(value.trimmed());

//    if(socket->objectName() == "")
//    {
//        socket->setObjectName(line);
//        QString data = clientName(socket);
//        data.append(" - connected");
//        sendAll(data);
//    }
//    else
//    {
//        QString data = clientName(socket);
//        data.append(" - ");
//        data.append(line);
//        sendAll(data);
//    }
}

void Server::disconnected()
{
    QTcpSocket *socket = qobject_cast<QTcpSocket*>(sender());
    if(!socket) return;
    m_clients.removeOne(socket);
    //socket is a memory leak
    socket->deleteLater();
}

void Server::sendAll(QString value)
{
    value.append("\r\n");
    QByteArray data = value.toUtf8();
    foreach(QTcpSocket *socket, m_clients)
    {
        //Check the socket for other possible issues
        if(socket) socket->write(data);
    }
}
