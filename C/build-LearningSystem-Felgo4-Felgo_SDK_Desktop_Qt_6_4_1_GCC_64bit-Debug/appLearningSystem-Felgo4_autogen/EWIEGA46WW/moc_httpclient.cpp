/****************************************************************************
** Meta object code from reading C++ file 'httpclient.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.4.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../../LearningSystem-Felgo4/httpclient.h"
#include <QtNetwork/QSslError>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'httpclient.h' doesn't include <QObject>."
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
struct qt_meta_stringdata_HttpClient_t {
    uint offsetsAndSizes[34];
    char stringdata0[11];
    char stringdata1[18];
    char stringdata2[1];
    char stringdata3[19];
    char stringdata4[4];
    char stringdata5[17];
    char stringdata6[9];
    char stringdata7[14];
    char stringdata8[13];
    char stringdata9[11];
    char stringdata10[6];
    char stringdata11[5];
    char stringdata12[10];
    char stringdata13[12];
    char stringdata14[15];
    char stringdata15[2];
    char stringdata16[13];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(sizeof(qt_meta_stringdata_HttpClient_t::offsetsAndSizes) + ofs), len 
Q_CONSTINIT static const qt_meta_stringdata_HttpClient_t qt_meta_stringdata_HttpClient = {
    {
        QT_MOC_LITERAL(0, 10),  // "HttpClient"
        QT_MOC_LITERAL(11, 17),  // "getFilenameFailed"
        QT_MOC_LITERAL(29, 0),  // ""
        QT_MOC_LITERAL(30, 18),  // "getFilenameSucceed"
        QT_MOC_LITERAL(49, 3),  // "url"
        QT_MOC_LITERAL(53, 16),  // "uploadXxtSucceed"
        QT_MOC_LITERAL(70, 8),  // "objectId"
        QT_MOC_LITERAL(79, 13),  // "decodeSucceed"
        QT_MOC_LITERAL(93, 12),  // "decodeFailed"
        QT_MOC_LITERAL(106, 10),  // "uploadFile"
        QT_MOC_LITERAL(117, 5),  // "QUrl&"
        QT_MOC_LITERAL(123, 4),  // "path"
        QT_MOC_LITERAL(128, 9),  // "uploadXxt"
        QT_MOC_LITERAL(138, 11),  // "getFilename"
        QT_MOC_LITERAL(150, 14),  // "QNetworkReply*"
        QT_MOC_LITERAL(165, 1),  // "r"
        QT_MOC_LITERAL(167, 12)   // "uploadQrCode"
    },
    "HttpClient",
    "getFilenameFailed",
    "",
    "getFilenameSucceed",
    "url",
    "uploadXxtSucceed",
    "objectId",
    "decodeSucceed",
    "decodeFailed",
    "uploadFile",
    "QUrl&",
    "path",
    "uploadXxt",
    "getFilename",
    "QNetworkReply*",
    "r",
    "uploadQrCode"
};
#undef QT_MOC_LITERAL
} // unnamed namespace

Q_CONSTINIT static const uint qt_meta_data_HttpClient[] = {

 // content:
      10,       // revision
       0,       // classname
       0,    0, // classinfo
       9,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       5,       // signalCount

 // signals: name, argc, parameters, tag, flags, initial metatype offsets
       1,    0,   68,    2, 0x06,    1 /* Public */,
       3,    1,   69,    2, 0x06,    2 /* Public */,
       5,    1,   72,    2, 0x06,    4 /* Public */,
       7,    1,   75,    2, 0x06,    6 /* Public */,
       8,    0,   78,    2, 0x06,    8 /* Public */,

 // slots: name, argc, parameters, tag, flags, initial metatype offsets
       9,    1,   79,    2, 0x0a,    9 /* Public */,
      12,    1,   82,    2, 0x0a,   11 /* Public */,
      13,    1,   85,    2, 0x0a,   13 /* Public */,
      16,    1,   88,    2, 0x0a,   15 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,    4,
    QMetaType::Void, QMetaType::QString,    6,
    QMetaType::Void, QMetaType::QString,    4,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void, 0x80000000 | 10,   11,
    QMetaType::Void, 0x80000000 | 10,   11,
    QMetaType::Void, 0x80000000 | 14,   15,
    QMetaType::Void, 0x80000000 | 10,   11,

       0        // eod
};

Q_CONSTINIT const QMetaObject HttpClient::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_HttpClient.offsetsAndSizes,
    qt_meta_data_HttpClient,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_stringdata_HttpClient_t,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<HttpClient, std::true_type>,
        // method 'getFilenameFailed'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'getFilenameSucceed'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        // method 'uploadXxtSucceed'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        // method 'decodeSucceed'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        // method 'decodeFailed'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'uploadFile'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QUrl &, std::false_type>,
        // method 'uploadXxt'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QUrl &, std::false_type>,
        // method 'getFilename'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QNetworkReply *, std::false_type>,
        // method 'uploadQrCode'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QUrl &, std::false_type>
    >,
    nullptr
} };

void HttpClient::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<HttpClient *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->getFilenameFailed(); break;
        case 1: _t->getFilenameSucceed((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1]))); break;
        case 2: _t->uploadXxtSucceed((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1]))); break;
        case 3: _t->decodeSucceed((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1]))); break;
        case 4: _t->decodeFailed(); break;
        case 5: _t->uploadFile((*reinterpret_cast< std::add_pointer_t<QUrl&>>(_a[1]))); break;
        case 6: _t->uploadXxt((*reinterpret_cast< std::add_pointer_t<QUrl&>>(_a[1]))); break;
        case 7: _t->getFilename((*reinterpret_cast< std::add_pointer_t<QNetworkReply*>>(_a[1]))); break;
        case 8: _t->uploadQrCode((*reinterpret_cast< std::add_pointer_t<QUrl&>>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
        case 7:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
            case 0:
                *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType::fromType< QNetworkReply* >(); break;
            }
            break;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (HttpClient::*)();
            if (_t _q_method = &HttpClient::getFilenameFailed; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (HttpClient::*)(QString );
            if (_t _q_method = &HttpClient::getFilenameSucceed; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (HttpClient::*)(QString );
            if (_t _q_method = &HttpClient::uploadXxtSucceed; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (HttpClient::*)(QString );
            if (_t _q_method = &HttpClient::decodeSucceed; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (HttpClient::*)();
            if (_t _q_method = &HttpClient::decodeFailed; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 4;
                return;
            }
        }
    }
}

const QMetaObject *HttpClient::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *HttpClient::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_HttpClient.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int HttpClient::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 9)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 9;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 9)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 9;
    }
    return _id;
}

// SIGNAL 0
void HttpClient::getFilenameFailed()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void HttpClient::getFilenameSucceed(QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void HttpClient::uploadXxtSucceed(QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 2, _a);
}

// SIGNAL 3
void HttpClient::decodeSucceed(QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}

// SIGNAL 4
void HttpClient::decodeFailed()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
