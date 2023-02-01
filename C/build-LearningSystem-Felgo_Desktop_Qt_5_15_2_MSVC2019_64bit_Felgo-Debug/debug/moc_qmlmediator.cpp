/****************************************************************************
** Meta object code from reading C++ file 'qmlmediator.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../LearningSystem/qmlmediator.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#include <QtCore/QList>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'qmlmediator.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_QmlMediator_t {
    QByteArrayData data[22];
    char stringdata0[279];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_QmlMediator_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_QmlMediator_t qt_meta_stringdata_QmlMediator = {
    {
QT_MOC_LITERAL(0, 0, 11), // "QmlMediator"
QT_MOC_LITERAL(1, 12, 14), // "loginSucceeded"
QT_MOC_LITERAL(2, 27, 0), // ""
QT_MOC_LITERAL(3, 28, 11), // "loginFailed"
QT_MOC_LITERAL(4, 40, 15), // "submitSucceeded"
QT_MOC_LITERAL(5, 56, 19), // "tcpQuestionsChanged"
QT_MOC_LITERAL(6, 76, 7), // "tologin"
QT_MOC_LITERAL(7, 84, 8), // "username"
QT_MOC_LITERAL(8, 93, 8), // "password"
QT_MOC_LITERAL(9, 102, 8), // "usertype"
QT_MOC_LITERAL(10, 111, 18), // "sendChoiceQuestion"
QT_MOC_LITERAL(11, 130, 8), // "question"
QT_MOC_LITERAL(12, 139, 7), // "option1"
QT_MOC_LITERAL(13, 147, 7), // "option2"
QT_MOC_LITERAL(14, 155, 7), // "option3"
QT_MOC_LITERAL(15, 163, 7), // "option4"
QT_MOC_LITERAL(16, 171, 6), // "answer"
QT_MOC_LITERAL(17, 178, 23), // "sendTrueOrFalseQuestion"
QT_MOC_LITERAL(18, 202, 27), // "sendFillInTheBlanksQuestion"
QT_MOC_LITERAL(19, 230, 17), // "getQuestionsByTcp"
QT_MOC_LITERAL(20, 248, 12), // "tcpQuestions"
QT_MOC_LITERAL(21, 261, 17) // "QList<QJsonArray>"

    },
    "QmlMediator\0loginSucceeded\0\0loginFailed\0"
    "submitSucceeded\0tcpQuestionsChanged\0"
    "tologin\0username\0password\0usertype\0"
    "sendChoiceQuestion\0question\0option1\0"
    "option2\0option3\0option4\0answer\0"
    "sendTrueOrFalseQuestion\0"
    "sendFillInTheBlanksQuestion\0"
    "getQuestionsByTcp\0tcpQuestions\0"
    "QList<QJsonArray>"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_QmlMediator[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       9,   14, // methods
       1,   94, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       4,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   59,    2, 0x06 /* Public */,
       3,    0,   60,    2, 0x06 /* Public */,
       4,    0,   61,    2, 0x06 /* Public */,
       5,    0,   62,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       6,    3,   63,    2, 0x0a /* Public */,
      10,    6,   70,    2, 0x0a /* Public */,
      17,    2,   83,    2, 0x0a /* Public */,
      18,    2,   88,    2, 0x0a /* Public */,
      19,    0,   93,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::Int,    7,    8,    9,
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::QString,   11,   12,   13,   14,   15,   16,
    QMetaType::Void, QMetaType::QString, QMetaType::Bool,   11,   16,
    QMetaType::Void, QMetaType::QString, QMetaType::QString,   11,   16,
    QMetaType::Void,

 // properties: name, type, flags
      20, 0x80000000 | 21, 0x0049510f,

 // properties: notify_signal_id
       3,

       0        // eod
};

void QmlMediator::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<QmlMediator *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->loginSucceeded(); break;
        case 1: _t->loginFailed(); break;
        case 2: _t->submitSucceeded(); break;
        case 3: _t->tcpQuestionsChanged(); break;
        case 4: _t->tologin((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< int(*)>(_a[3]))); break;
        case 5: _t->sendChoiceQuestion((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< QString(*)>(_a[3])),(*reinterpret_cast< QString(*)>(_a[4])),(*reinterpret_cast< QString(*)>(_a[5])),(*reinterpret_cast< QString(*)>(_a[6]))); break;
        case 6: _t->sendTrueOrFalseQuestion((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2]))); break;
        case 7: _t->sendFillInTheBlanksQuestion((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2]))); break;
        case 8: _t->getQuestionsByTcp(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (QmlMediator::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&QmlMediator::loginSucceeded)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (QmlMediator::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&QmlMediator::loginFailed)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (QmlMediator::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&QmlMediator::submitSucceeded)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (QmlMediator::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&QmlMediator::tcpQuestionsChanged)) {
                *result = 3;
                return;
            }
        }
    } else if (_c == QMetaObject::RegisterPropertyMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 0:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QList<QJsonArray> >(); break;
        }
    }

#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<QmlMediator *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QList<QJsonArray>*>(_v) = _t->tcpQuestions(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<QmlMediator *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setTcpQuestions(*reinterpret_cast< QList<QJsonArray>*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
        QmlMediator *_t = static_cast<QmlMediator *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->resetTcpQuestions(); break;
        default: break;
        }
    }
#endif // QT_NO_PROPERTIES
}

QT_INIT_METAOBJECT const QMetaObject QmlMediator::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_QmlMediator.data,
    qt_meta_data_QmlMediator,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *QmlMediator::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *QmlMediator::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_QmlMediator.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int QmlMediator::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 9;
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 1;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 1;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void QmlMediator::loginSucceeded()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void QmlMediator::loginFailed()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void QmlMediator::submitSucceeded()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void QmlMediator::tcpQuestionsChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
