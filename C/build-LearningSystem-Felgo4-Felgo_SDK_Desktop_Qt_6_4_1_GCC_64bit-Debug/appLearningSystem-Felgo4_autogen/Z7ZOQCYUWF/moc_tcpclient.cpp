/****************************************************************************
** Meta object code from reading C++ file 'tcpclient.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.4.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../assets/tcpclient.h"
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'tcpclient.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 68
#error "This file was generated using the moc from 6.4.1. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

#ifndef Q_CONSTINIT
#define Q_CONSTINIT
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
namespace {
struct qt_meta_stringdata_TcpClient_t {
    uint offsetsAndSizes[36];
    char stringdata0[10];
    char stringdata1[8];
    char stringdata2[1];
    char stringdata3[13];
    char stringdata4[5];
    char stringdata5[15];
    char stringdata6[5];
    char stringdata7[15];
    char stringdata8[8];
    char stringdata9[3];
    char stringdata10[15];
    char stringdata11[13];
    char stringdata12[5];
    char stringdata13[17];
    char stringdata14[14];
    char stringdata15[9];
    char stringdata16[9];
    char stringdata17[5];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(sizeof(qt_meta_stringdata_TcpClient_t::offsetsAndSizes) + ofs), len 
Q_CONSTINIT static const qt_meta_stringdata_TcpClient_t qt_meta_stringdata_TcpClient = {
    {
        QT_MOC_LITERAL(0, 9),  // "TcpClient"
        QT_MOC_LITERAL(10, 7),  // "toLogin"
        QT_MOC_LITERAL(18, 0),  // ""
        QT_MOC_LITERAL(19, 12),  // "QStringList*"
        QT_MOC_LITERAL(32, 4),  // "list"
        QT_MOC_LITERAL(37, 14),  // "insertQuestion"
        QT_MOC_LITERAL(52, 4),  // "type"
        QT_MOC_LITERAL(57, 14),  // "deleteQuestion"
        QT_MOC_LITERAL(72, 7),  // "qint32&"
        QT_MOC_LITERAL(80, 2),  // "id"
        QT_MOC_LITERAL(83, 14),  // "updateQuestion"
        QT_MOC_LITERAL(98, 12),  // "QJsonObject&"
        QT_MOC_LITERAL(111, 4),  // "json"
        QT_MOC_LITERAL(116, 16),  // "commmitQuestions"
        QT_MOC_LITERAL(133, 13),  // "createNewUser"
        QT_MOC_LITERAL(147, 8),  // "QString&"
        QT_MOC_LITERAL(156, 8),  // "username"
        QT_MOC_LITERAL(165, 4)   // "cxid"
    },
    "TcpClient",
    "toLogin",
    "",
    "QStringList*",
    "list",
    "insertQuestion",
    "type",
    "deleteQuestion",
    "qint32&",
    "id",
    "updateQuestion",
    "QJsonObject&",
    "json",
    "commmitQuestions",
    "createNewUser",
    "QString&",
    "username",
    "cxid"
};
#undef QT_MOC_LITERAL
} // unnamed namespace

Q_CONSTINIT static const uint qt_meta_data_TcpClient[] = {

 // content:
      10,       // revision
       0,       // classname
       0,    0, // classinfo
       6,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags, initial metatype offsets
       1,    1,   50,    2, 0x0a,    1 /* Public */,
       5,    2,   53,    2, 0x0a,    3 /* Public */,
       7,    2,   58,    2, 0x0a,    6 /* Public */,
      10,    2,   63,    2, 0x0a,    9 /* Public */,
      13,    0,   68,    2, 0x0a,   12 /* Public */,
      14,    2,   69,    2, 0x0a,   13 /* Public */,

 // slots: parameters
    QMetaType::Bool, 0x80000000 | 3,    4,
    QMetaType::Bool, 0x80000000 | 3, QMetaType::Int,    4,    6,
    QMetaType::Bool, 0x80000000 | 8, 0x80000000 | 8,    9,    6,
    QMetaType::Bool, 0x80000000 | 11, 0x80000000 | 8,   12,    6,
    QMetaType::Bool,
    QMetaType::Void, 0x80000000 | 15, 0x80000000 | 8,   16,   17,

       0        // eod
};

Q_CONSTINIT const QMetaObject TcpClient::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_TcpClient.offsetsAndSizes,
    qt_meta_data_TcpClient,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_stringdata_TcpClient_t,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<TcpClient, std::true_type>,
        // method 'toLogin'
        QtPrivate::TypeAndForceComplete<bool, std::false_type>,
        QtPrivate::TypeAndForceComplete<QStringList *, std::false_type>,
        // method 'insertQuestion'
        QtPrivate::TypeAndForceComplete<bool, std::false_type>,
        QtPrivate::TypeAndForceComplete<QStringList *, std::false_type>,
        QtPrivate::TypeAndForceComplete<qint32, std::false_type>,
        // method 'deleteQuestion'
        QtPrivate::TypeAndForceComplete<bool, std::false_type>,
        QtPrivate::TypeAndForceComplete<qint32 &, std::false_type>,
        QtPrivate::TypeAndForceComplete<qint32 &, std::false_type>,
        // method 'updateQuestion'
        QtPrivate::TypeAndForceComplete<bool, std::false_type>,
        QtPrivate::TypeAndForceComplete<QJsonObject &, std::false_type>,
        QtPrivate::TypeAndForceComplete<qint32 &, std::false_type>,
        // method 'commmitQuestions'
        QtPrivate::TypeAndForceComplete<bool, std::false_type>,
        // method 'createNewUser'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QString &, std::false_type>,
        QtPrivate::TypeAndForceComplete<qint32 &, std::false_type>
    >,
    nullptr
} };

void TcpClient::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<TcpClient *>(_o);
        (void)_t;
        switch (_id) {
        case 0: { bool _r = _t->toLogin((*reinterpret_cast< std::add_pointer_t<QStringList*>>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 1: { bool _r = _t->insertQuestion((*reinterpret_cast< std::add_pointer_t<QStringList*>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<qint32>>(_a[2])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 2: { bool _r = _t->deleteQuestion((*reinterpret_cast< std::add_pointer_t<qint32&>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<qint32&>>(_a[2])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 3: { bool _r = _t->updateQuestion((*reinterpret_cast< std::add_pointer_t<QJsonObject&>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<qint32&>>(_a[2])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 4: { bool _r = _t->commmitQuestions();
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 5: _t->createNewUser((*reinterpret_cast< std::add_pointer_t<QString&>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<qint32&>>(_a[2]))); break;
        default: ;
        }
    }
}

const QMetaObject *TcpClient::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *TcpClient::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_TcpClient.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int TcpClient::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 6)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 6)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 6;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
