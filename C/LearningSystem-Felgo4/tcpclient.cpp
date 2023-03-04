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
    QScopedPointer<QTcpSocket> p(new QTcpSocket());
    p->connectToHost(this->m_host,this->port());
    if(p->waitForConnected()){
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
    }else{
        qInfo() << "连接服务器失败！";
    }
    p->close();
    return false;
}

bool TcpClient::insertQuestion(QStringList *list, qint32 type)
{
    QScopedPointer<QTcpSocket> p(new QTcpSocket());
    p->connectToHost(this->m_host,this->port());
    QByteArray byte;
    QDataStream stream(&byte,QIODevice::WriteOnly);
    stream << type;
    foreach(QString s,*list){
        stream << s;
    }
    stream << m_date;
    if(p->waitForConnected()){
        p->write(byte);
        if(p->waitForBytesWritten()){
            if(p->waitForReadyRead()){
                if(QString(p->readAll()).contains("ok")){
                    p->close();
                    return true;
                }
            }
        }
    }else{
        qInfo() << "连接服务器失败！";
    }
    p->close();
    return false;
}

bool TcpClient::deleteQuestion(qint32 &id, qint32 &type)
{
    //    QByteArray data;
    //    qInfo() << "TCP开始删除";
    QScopedPointer<QTcpSocket> p(new QTcpSocket());
    QByteArray byte;
    QDataStream stream(&byte,QIODevice::WriteOnly);
    stream << deleteQ << id << type << m_date;
    p->connectToHost(this->m_host,this->port());
    if(p->waitForConnected()){
        p->write(byte);
        if(p->waitForBytesWritten()){
            if(p->waitForReadyRead()){
                if(QString(p->readAll()).contains("ok")){
                    p->close();
                    return true;
                }
            }
        }
    }else{
        qInfo() << "连接服务器失败！";
    }
    p->close();
    return false;
}

bool TcpClient::updateQuestion(QJsonObject &json, qint32 &type)
{
    QScopedPointer<QTcpSocket> p(new QTcpSocket());
    QByteArray byte;
    QDataStream stream(&byte,QIODevice::WriteOnly);
    switch (type) {
    case choice:{
        stream << updateC;
        //        stream << QString::number(json["id"].toDouble()).toLongLong();
        stream << json["id"].toInt();
        stream << json["question"].toString() << json["option1"].toString()
                <<json["option2"].toString() << json["option3"].toString()
                << json["option4"].toString() << json["answer"].toString();

        break;
    }
    case trueOrFalse:{
        stream << updateT;
        //        stream << QString::number(json["id"].toDouble()).toLongLong();
        stream << json["id"].toInt();
        stream << json["question"].toString();
        qInfo() << "bool?" <<  json["answer"].toBool();
        stream <<  json["answer"].toBool();
        //        stream << m_date;
        break;
    }
    case fill:{
        stream << updateF;
        //        stream << QString::number(json["id"].toDouble()).toLongLong();
        stream << json["id"].toInt();
        stream << json["question"].toString();
        stream <<  json["answer"].toString();
        break;
    }
    default:
    {
        qInfo() << "未知类型题目";
        return false;
        break;
    }

    }
    p->connectToHost(this->m_host,this->port());
    stream << m_date;
    if(p->waitForConnected()){
        p->write(byte);
        if(p->waitForBytesWritten()){
            if(p->waitForReadyRead()){
                if(QString(p->readAll()).contains("ok")){
                    p->close();
                    return true;
                }
            }
        }
    }else{
        qInfo() << "连接服务器失败！";
    }
    p->close();
    return false;

    //    stream << updateC << json["id"].toInt() << 1

}

bool TcpClient::commmitQuestions()
{
    QScopedPointer<QTcpSocket> p(new QTcpSocket());
    QByteArray byte;
    QDataStream stream(&byte,QIODevice::WriteOnly);
    stream << commitQ << m_date;
    p->connectToHost(this->m_host,this->port());
    if(p->waitForConnected()){
        p->write(byte);
        if(p->waitForBytesWritten()){
            if(p->waitForReadyRead()){
                if(QString(p->readAll()).contains("ok")){
                    p->close();
                    return true;
                }
            }
        }
    }else{
        qInfo() << "连接服务器失败！";
    }
    p->close();
    return false;
}

void TcpClient::createNewUser(QString &username, qint32 &cxid)
{
    QByteArray byte;
    QDataStream stream(&byte,QIODevice::WriteOnly);
    qInfo() << cxid;
    stream << isNewUser << username << cxid;
    QScopedPointer<QTcpSocket> p(new QTcpSocket());
    p->connectToHost(this->m_host,this->port());
    if(p->waitForConnected()){
        p->write(byte);
        if(p->waitForBytesWritten()){
            if(p->waitForReadyRead()){
                if(QString(p->readAll()).contains("ok")){
                    //                    p->close();
                    qInfo() << "createSuccess";
                    //                    return true;
                }
            }
        }
    }else{
        qInfo() << "连接服务器失败！";
    }
    p->close();
    //    return false;
}

QString TcpClient::uploadPicture(QUrl &path)
{

    QFile file = path.toLocalFile();
    if(file.exists()){
        qInfo() << "文件存在";
        if(file.open(QIODevice::ReadOnly))
        {
            QByteArray byte;
            QDataStream stream(&byte,QIODevice::WriteOnly);
            QString filename = QUuid::createUuid().toString();
            stream << uploadP << filename << file.size();
            QScopedPointer<QTcpSocket> p(new QTcpSocket());
            p->connectToHost(this->m_host,this->port());
            p->waitForConnected();
            p->write(byte);
            p->waitForBytesWritten();
            p->waitForReadyRead();
            //            qInfo() <<QString( p->readAll());
            //            forever
            if(QString( p->readAll()).contains("ready"))
            {
                //                p->write(data);
                qint64 send = 0;
                qint64 size = file.size();
                char buf[4*1024] = {0};
                forever{

                    //                    char buf[4*1024] = {0};
                    qint64 len = file.read(buf, sizeof(buf));
                    send+=len;
                    p->write(buf,len);
                    p->waitForBytesWritten();
                    if(send == size) {

                        qInfo() << "发完";
                        break;
                    }
                }
                file.close();
                p->disconnectFromHost();
                p->close();
                return filename;
            }




        }
    }else{
        qInfo() << "文件不存在";
        file.close();
        return "";
    }
    return "";
}

bool TcpClient::submitPost(QString &title, QString &text, qint32 &cxid, QString &username,qint32 &type)
{
    //    if(cxid)
    QByteArray byte;
    QDataStream stream(&byte,QIODevice::WriteOnly);
    stream << submitP << title << text <<cxid << username << type;
    QScopedPointer<QTcpSocket> p(new QTcpSocket());
    p->connectToHost(this->m_host,this->port());
    p->waitForConnected();
    if(p->waitForConnected()){
        p->write(byte);
        if(p->waitForBytesWritten()){
            if(p->waitForReadyRead()){
                if(QString(p->readAll()).contains("ok")){
                    p->disconnectFromHost();
                    p->close();
                    return true;
                }
            }else{
                qInfo() << "读取失败";}
        }else{
            qInfo() << "写入失败";
        }
    }else{
        qInfo() << "连接失败";
    }
    p->disconnectFromHost();
    p->close();
    return false;
}

bool TcpClient::selectPosts()
{

    return false;
}




// 弃用
QByteArray TcpClient::getQuestionsBytes()
{
    QByteArray data;
    QScopedPointer<QTcpSocket> p(new QTcpSocket());
    QByteArray byte;
    QDataStream stream(&byte,QIODevice::WriteOnly);
    stream << getQuestions << m_date;
    p->connectToHost(this->m_host,this->port());
    if(p->waitForConnected()){
        p->write(byte);
        if(p->waitForBytesWritten()){
            if(p->waitForReadyRead()){
                data = p->readAll();
            }else{
                qInfo() << "读取失败";}
        }else{
            qInfo() << "写入失败";
        }
    }else{
        qInfo() << "连接失败";
    }
    p->close();
    return data;
}

QList<QJsonArray> TcpClient::getQuestionsJson()
{
    QList<QJsonArray> list;
    QByteArray data;
    QScopedPointer<QTcpSocket> p(new QTcpSocket());
    QByteArray byte;
    QDataStream stream(&byte,QIODevice::WriteOnly);
    QDataStream questionsStream(&data,QIODevice::ReadOnly);
    QJsonArray c,t,f;

    p->connectToHost(this->m_host,this->port());
    if(p->waitForConnected()){

        stream << getQuestions << m_date;
        p->write(byte);
        if(p->waitForBytesWritten()){
            if(p->waitForReadyRead()){
                qint32 time=0;
                forever {
                    qInfo() << time;
                    time++;
                    if(p->waitForReadyRead()){
                        QByteArray temp = p->readAll();
                        data.append(temp);
                    }else{
                        qInfo() << "读完";
                        break;
                    }
                }

                questionsStream >> c;
                questionsStream >> t;
                questionsStream >> f;
                list.append(c);
                list.append(t);
                list.append(f);
            }else{
                qInfo() << "读取失败";}
        }else{
            qInfo() << "写入失败";
        }
    }else{
        qInfo() << "连接失败";
    }
    //    qInfo() << list;
    p->close();
    return list;
}



QByteArray TcpClient::passwordCryptographicHash(QByteArray password)
{
    QCryptographicHash hash(QCryptographicHash::Sha256);
    hash.addData(password);
    return hash.result().toBase64();
}



