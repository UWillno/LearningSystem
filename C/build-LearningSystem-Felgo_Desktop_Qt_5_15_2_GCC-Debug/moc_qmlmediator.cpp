/****************************************************************************
** Meta object code from reading C++ file 'qmlmediator.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../LearningSystem/qmlmediator.h"
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
    QByteArrayData data[37];
    char stringdata0[447];
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
QT_MOC_LITERAL(5, 56, 12), // "submitFailed"
QT_MOC_LITERAL(6, 69, 14), // "selectSuceeded"
QT_MOC_LITERAL(7, 84, 12), // "selectFailed"
QT_MOC_LITERAL(8, 97, 19), // "tcpQuestionsChanged"
QT_MOC_LITERAL(9, 117, 14), // "deleteSuceeded"
QT_MOC_LITERAL(10, 132, 12), // "deleteFailed"
QT_MOC_LITERAL(11, 145, 15), // "updateSucceeded"
QT_MOC_LITERAL(12, 161, 12), // "updateFailed"
QT_MOC_LITERAL(13, 174, 7), // "tologin"
QT_MOC_LITERAL(14, 182, 8), // "username"
QT_MOC_LITERAL(15, 191, 8), // "password"
QT_MOC_LITERAL(16, 200, 8), // "usertype"
QT_MOC_LITERAL(17, 209, 18), // "sendChoiceQuestion"
QT_MOC_LITERAL(18, 228, 8), // "question"
QT_MOC_LITERAL(19, 237, 7), // "option1"
QT_MOC_LITERAL(20, 245, 7), // "option2"
QT_MOC_LITERAL(21, 253, 7), // "option3"
QT_MOC_LITERAL(22, 261, 7), // "option4"
QT_MOC_LITERAL(23, 269, 6), // "answer"
QT_MOC_LITERAL(24, 276, 23), // "sendTrueOrFalseQuestion"
QT_MOC_LITERAL(25, 300, 27), // "sendFillInTheBlanksQuestion"
QT_MOC_LITERAL(26, 328, 17), // "getQuestionsByTcp"
QT_MOC_LITERAL(27, 346, 14), // "updateQuestion"
QT_MOC_LITERAL(28, 361, 4), // "json"
QT_MOC_LITERAL(29, 366, 4), // "type"
QT_MOC_LITERAL(30, 371, 14), // "deleteQuestion"
QT_MOC_LITERAL(31, 386, 2), // "id"
QT_MOC_LITERAL(32, 389, 9), // "testModel"
QT_MOC_LITERAL(33, 399, 1), // "a"
QT_MOC_LITERAL(34, 401, 14), // "commitQuestons"
QT_MOC_LITERAL(35, 416, 12), // "tcpQuestions"
QT_MOC_LITERAL(36, 429, 17) // "QList<QJsonArray>"

    },
    "QmlMediator\0loginSucceeded\0\0loginFailed\0"
    "submitSucceeded\0submitFailed\0"
    "selectSuceeded\0selectFailed\0"
    "tcpQuestionsChanged\0deleteSuceeded\0"
    "deleteFailed\0updateSucceeded\0updateFailed\0"
    "tologin\0username\0password\0usertype\0"
    "sendChoiceQuestion\0question\0option1\0"
    "option2\0option3\0option4\0answer\0"
    "sendTrueOrFalseQuestion\0"
    "sendFillInTheBlanksQuestion\0"
    "getQuestionsByTcp\0updateQuestion\0json\0"
    "type\0deleteQuestion\0id\0testModel\0a\0"
    "commitQuestons\0tcpQuestions\0"
    "QList<QJsonArray>"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_QmlMediator[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      20,   14, // methods
       1,  170, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
      11,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,  114,    2, 0x06 /* Public */,
       3,    0,  115,    2, 0x06 /* Public */,
       4,    0,  116,    2, 0x06 /* Public */,
       5,    0,  117,    2, 0x06 /* Public */,
       6,    0,  118,    2, 0x06 /* Public */,
       7,    0,  119,    2, 0x06 /* Public */,
       8,    0,  120,    2, 0x06 /* Public */,
       9,    0,  121,    2, 0x06 /* Public */,
      10,    0,  122,    2, 0x06 /* Public */,
      11,    0,  123,    2, 0x06 /* Public */,
      12,    0,  124,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
      13,    3,  125,    2, 0x0a /* Public */,
      17,    6,  132,    2, 0x0a /* Public */,
      24,    2,  145,    2, 0x0a /* Public */,
      25,    2,  150,    2, 0x0a /* Public */,
      26,    0,  155,    2, 0x0a /* Public */,
      27,    2,  156,    2, 0x0a /* Public */,
      30,    2,  161,    2, 0x0a /* Public */,
      32,    1,  166,    2, 0x0a /* Public */,
      34,    0,  169,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::Int,   14,   15,   16,
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::QString,   18,   19,   20,   21,   22,   23,
    QMetaType::Void, QMetaType::QString, QMetaType::Bool,   18,   23,
    QMetaType::Void, QMetaType::QString, QMetaType::QString,   18,   23,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QJsonObject, QMetaType::Int,   28,   29,
    QMetaType::Void, QMetaType::LongLong, QMetaType::Int,   31,   29,
    QMetaType::Void, QMetaType::QJsonObject,   33,
    QMetaType::Void,

 // properties: name, type, flags
      35, 0x80000000 | 36, 0x0049510f,

 // properties: notify_signal_id
       6,

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
        case 3: _t->submitFailed(); break;
        case 4: _t->selectSuceeded(); break;
        case 5: _t->selectFailed(); break;
        case 6: _t->tcpQuestionsChanged(); break;
        case 7: _t->deleteSuceeded(); break;
        case 8: _t->deleteFailed(); break;
        case 9: _t->updateSucceeded(); break;
        case 10: _t->updateFailed(); break;
        case 11: _t->tologin((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< const int(*)>(_a[3]))); break;
        case 12: _t->sendChoiceQuestion((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2])),(*reinterpret_cast< QString(*)>(_a[3])),(*reinterpret_cast< QString(*)>(_a[4])),(*reinterpret_cast< QString(*)>(_a[5])),(*reinterpret_cast< QString(*)>(_a[6]))); break;
        case 13: _t->sendTrueOrFalseQuestion((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< bool(*)>(_a[2]))); break;
        case 14: _t->sendFillInTheBlanksQuestion((*reinterpret_cast< QString(*)>(_a[1])),(*reinterpret_cast< QString(*)>(_a[2]))); break;
        case 15: _t->getQuestionsByTcp(); break;
        case 16: _t->updateQuestion((*reinterpret_cast< QJsonObject(*)>(_a[1])),(*reinterpret_cast< qint32(*)>(_a[2]))); break;
        case 17: _t->deleteQuestion((*reinterpret_cast< qint64(*)>(_a[1])),(*reinterpret_cast< qint32(*)>(_a[2]))); break;
        case 18: _t->testModel((*reinterpret_cast< QJsonObject(*)>(_a[1]))); break;
        case 19: _t->commitQuestons(); break;
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
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&QmlMediator::submitFailed)) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (QmlMediator::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&QmlMediator::selectSuceeded)) {
                *result = 4;
                return;
            }
        }
        {
            using _t = void (QmlMediator::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&QmlMediator::selectFailed)) {
                *result = 5;
                return;
            }
        }
        {
            using _t = void (QmlMediator::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&QmlMediator::tcpQuestionsChanged)) {
                *result = 6;
                return;
            }
        }
        {
            using _t = void (QmlMediator::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&QmlMediator::deleteSuceeded)) {
                *result = 7;
                return;
            }
        }
        {
            using _t = void (QmlMediator::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&QmlMediator::deleteFailed)) {
                *result = 8;
                return;
            }
        }
        {
            using _t = void (QmlMediator::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&QmlMediator::updateSucceeded)) {
                *result = 9;
                return;
            }
        }
        {
            using _t = void (QmlMediator::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&QmlMediator::updateFailed)) {
                *result = 10;
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
        if (_id < 20)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 20;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 20)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 20;
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
void QmlMediator::submitFailed()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void QmlMediator::selectSuceeded()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void QmlMediator::selectFailed()
{
    QMetaObject::activate(this, &staticMetaObject, 5, nullptr);
}

// SIGNAL 6
void QmlMediator::tcpQuestionsChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 6, nullptr);
}

// SIGNAL 7
void QmlMediator::deleteSuceeded()
{
    QMetaObject::activate(this, &staticMetaObject, 7, nullptr);
}

// SIGNAL 8
void QmlMediator::deleteFailed()
{
    QMetaObject::activate(this, &staticMetaObject, 8, nullptr);
}

// SIGNAL 9
void QmlMediator::updateSucceeded()
{
    QMetaObject::activate(this, &staticMetaObject, 9, nullptr);
}

// SIGNAL 10
void QmlMediator::updateFailed()
{
    QMetaObject::activate(this, &staticMetaObject, 10, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
