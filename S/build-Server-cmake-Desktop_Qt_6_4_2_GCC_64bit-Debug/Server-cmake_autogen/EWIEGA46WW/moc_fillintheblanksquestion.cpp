/****************************************************************************
** Meta object code from reading C++ file 'fillintheblanksquestion.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.4.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../../Server-cmake/fillintheblanksquestion.h"
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'fillintheblanksquestion.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 68
#error "This file was generated using the moc from 6.4.2. It"
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
struct qt_meta_stringdata_FillInTheBlanksQuestion_t {
    uint offsetsAndSizes[2];
    char stringdata0[24];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(sizeof(qt_meta_stringdata_FillInTheBlanksQuestion_t::offsetsAndSizes) + ofs), len 
Q_CONSTINIT static const qt_meta_stringdata_FillInTheBlanksQuestion_t qt_meta_stringdata_FillInTheBlanksQuestion = {
    {
        QT_MOC_LITERAL(0, 23)   // "FillInTheBlanksQuestion"
    },
    "FillInTheBlanksQuestion"
};
#undef QT_MOC_LITERAL
} // unnamed namespace

Q_CONSTINIT static const uint qt_meta_data_FillInTheBlanksQuestion[] = {

 // content:
      10,       // revision
       0,       // classname
       0,    0, // classinfo
       0,    0, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

       0        // eod
};

Q_CONSTINIT const QMetaObject FillInTheBlanksQuestion::staticMetaObject = { {
    QMetaObject::SuperData::link<iQuestion::staticMetaObject>(),
    qt_meta_stringdata_FillInTheBlanksQuestion.offsetsAndSizes,
    qt_meta_data_FillInTheBlanksQuestion,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_stringdata_FillInTheBlanksQuestion_t,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<FillInTheBlanksQuestion, std::true_type>
    >,
    nullptr
} };

void FillInTheBlanksQuestion::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    (void)_o;
    (void)_id;
    (void)_c;
    (void)_a;
}

const QMetaObject *FillInTheBlanksQuestion::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *FillInTheBlanksQuestion::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_FillInTheBlanksQuestion.stringdata0))
        return static_cast<void*>(this);
    return iQuestion::qt_metacast(_clname);
}

int FillInTheBlanksQuestion::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = iQuestion::qt_metacall(_c, _id, _a);
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
