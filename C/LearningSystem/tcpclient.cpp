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

bool TcpClient::deleteQuestion(qint64 &id, qint32 &type)
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
        stream << QString::number(json["id"].toDouble()).toLongLong();
        stream << json["question"].toString() << json["option1"].toString()
                <<json["option2"].toString() << json["option3"].toString()
                << json["option4"].toString() << json["answer"].toString();

        break;
    }
    case trueOrFalse:{
        stream << updateT;
        stream << QString::number(json["id"].toDouble()).toLongLong();
        stream << json["question"].toString();
        qInfo() << "bool?" <<  json["answer"].toBool();
        stream <<  json["answer"].toBool();
        //        stream << m_date;
        break;
    }
    case fill:{
        stream << updateF;
        stream << QString::number(json["id"].toDouble()).toLongLong();
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
                data = p->readAll();

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



