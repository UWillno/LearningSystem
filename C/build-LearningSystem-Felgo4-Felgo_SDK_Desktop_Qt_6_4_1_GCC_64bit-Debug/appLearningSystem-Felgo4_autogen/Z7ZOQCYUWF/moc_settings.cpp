/****************************************************************************
** Meta object code from reading C++ file 'settings.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.4.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../assets/settings.h"
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'settings.h' doesn't include <QObject>."
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
struct qt_meta_stringdata_Settings_t {
    uint offsetsAndSizes[32];
    char stringdata0[9];
    char stringdata1[16];
    char stringdata2[1];
    char stringdata3[12];
    char stringdata4[13];
    char stringdata5[16];
    char stringdata6[14];
    char stringdata7[16];
    char stringdata8[5];
    char stringdata9[5];
    char stringdata10[9];
    char stringdata11[5];
    char stringdata12[6];
    char stringdata13[9];
    char stringdata14[7];
    char stringdata15[9];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(sizeof(qt_meta_stringdata_Settings_t::offsetsAndSizes) + ofs), len 
Q_CONSTINIT static const qt_meta_stringdata_Settings_t qt_meta_stringdata_Settings = {
    {
        QT_MOC_LITERAL(0, 8),  // "Settings"
        QT_MOC_LITERAL(9, 15),  // "usernameChanged"
        QT_MOC_LITERAL(25, 0),  // ""
        QT_MOC_LITERAL(26, 11),  // "cxidChanged"
        QT_MOC_LITERAL(38, 12),  // "phoneChanged"
        QT_MOC_LITERAL(51, 15),  // "passwordChanged"
        QT_MOC_LITERAL(67, 13),  // "cookieChanged"
        QT_MOC_LITERAL(81, 15),  // "fileNameChanged"
        QT_MOC_LITERAL(97, 4),  // "save"
        QT_MOC_LITERAL(102, 4),  // "init"
        QT_MOC_LITERAL(107, 8),  // "username"
        QT_MOC_LITERAL(116, 4),  // "cxid"
        QT_MOC_LITERAL(121, 5),  // "phone"
        QT_MOC_LITERAL(127, 8),  // "password"
        QT_MOC_LITERAL(136, 6),  // "cookie"
        QT_MOC_LITERAL(143, 8)   // "fileName"
    },
    "Settings",
    "usernameChanged",
    "",
    "cxidChanged",
    "phoneChanged",
    "passwordChanged",
    "cookieChanged",
    "fileNameChanged",
    "save",
    "init",
    "username",
    "cxid",
    "phone",
    "password",
    "cookie",
    "fileName"
};
#undef QT_MOC_LITERAL
} // unnamed namespace

Q_CONSTINIT static const uint qt_meta_data_Settings[] = {

 // content:
      10,       // revision
       0,       // classname
       0,    0, // classinfo
       8,   14, // methods
       6,   70, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       6,       // signalCount

 // signals: name, argc, parameters, tag, flags, initial metatype offsets
       1,    0,   62,    2, 0x06,    7 /* Public */,
       3,    0,   63,    2, 0x06,    8 /* Public */,
       4,    0,   64,    2, 0x06,    9 /* Public */,
       5,    0,   65,    2, 0x06,   10 /* Public */,
       6,    0,   66,    2, 0x06,   11 /* Public */,
       7,    0,   67,    2, 0x06,   12 /* Public */,

 // slots: name, argc, parameters, tag, flags, initial metatype offsets
       8,    0,   68,    2, 0x0a,   13 /* Public */,
       9,    0,   69,    2, 0x0a,   14 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void,

 // properties: name, type, flags
      10, QMetaType::QString, 0x00015103, uint(0), 0,
      11, QMetaType::Int, 0x00015103, uint(1), 0,
      12, QMetaType::LongLong, 0x00015103, uint(2), 0,
      13, QMetaType::QString, 0x00015103, uint(3), 0,
      14, QMetaType::QString, 0x00015103, uint(4), 0,
      15, QMetaType::QString, 0x00015103, uint(5), 0,

       0        // eod
};

Q_CONSTINIT const QMetaObject Settings::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_Settings.offsetsAndSizes,
    qt_meta_data_Settings,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_stringdata_Settings_t,
        // property 'username'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'cxid'
        QtPrivate::TypeAndForceComplete<qint32, std::true_type>,
        // property 'phone'
        QtPrivate::TypeAndForceComplete<qint64, std::true_type>,
        // property 'password'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'cookie'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // property 'fileName'
        QtPrivate::TypeAndForceComplete<QString, std::true_type>,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<Settings, std::true_type>,
        // method 'usernameChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'cxidChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'phoneChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'passwordChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'cookieChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'fileNameChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'save'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'init'
        QtPrivate::TypeAndForceComplete<void, std::false_type>
    >,
    nullptr
} };

void Settings::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<Settings *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->usernameChanged(); break;
        case 1: _t->cxidChanged(); break;
        case 2: _t->phoneChanged(); break;
        case 3: _t->passwordChanged(); break;
        case 4: _t->cookieChanged(); break;
        case 5: _t->fileNameChanged(); break;
        case 6: _t->save(); break;
        case 7: _t->init(); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (Settings::*)();
            if (_t _q_method = &Settings::usernameChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (Settings::*)();
            if (_t _q_method = &Settings::cxidChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (Settings::*)();
            if (_t _q_method = &Settings::phoneChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (Settings::*)();
            if (_t _q_method = &Settings::passwordChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (Settings::*)();
            if (_t _q_method = &Settings::cookieChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 4;
                return;
            }
        }
        {
            using _t = void (Settings::*)();
            if (_t _q_method = &Settings::fileNameChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 5;
                return;
            }
        }
    }else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<Settings *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QString*>(_v) = _t->username(); break;
        case 1: *reinterpret_cast< qint32*>(_v) = _t->cxid(); break;
        case 2: *reinterpret_cast< qint64*>(_v) = _t->phone(); break;
        case 3: *reinterpret_cast< QString*>(_v) = _t->password(); break;
        case 4: *reinterpret_cast< QString*>(_v) = _t->cookie(); break;
        case 5: *reinterpret_cast< QString*>(_v) = _t->fileName(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<Settings *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setUsername(*reinterpret_cast< QString*>(_v)); break;
        case 1: _t->setCxid(*reinterpret_cast< qint32*>(_v)); break;
        case 2: _t->setPhone(*reinterpret_cast< qint64*>(_v)); break;
        case 3: _t->setPassword(*reinterpret_cast< QString*>(_v)); break;
        case 4: _t->setCookie(*reinterpret_cast< QString*>(_v)); break;
        case 5: _t->setFileName(*reinterpret_cast< QString*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    } else if (_c == QMetaObject::BindableProperty) {
    }
    (void)_a;
}

const QMetaObject *Settings::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Settings::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_Settings.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int Settings::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 8)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 8;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 8)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 8;
    }else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    }
    return _id;
}

// SIGNAL 0
void Settings::usernameChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void Settings::cxidChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void Settings::phoneChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void Settings::passwordChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 3, nullptr);
}

// SIGNAL 4
void Settings::cookieChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 4, nullptr);
}

// SIGNAL 5
void Settings::fileNameChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 5, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
