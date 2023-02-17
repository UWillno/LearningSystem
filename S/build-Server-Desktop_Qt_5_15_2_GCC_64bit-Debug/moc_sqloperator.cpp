/****************************************************************************
** Meta object code from reading C++ file 'sqloperator.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../Server/sqloperator.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'sqloperator.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.2. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_SqlOperator_t {
    QByteArrayData data[19];
    char stringdata0[321];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_SqlOperator_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_SqlOperator_t qt_meta_stringdata_SqlOperator = {
    {
QT_MOC_LITERAL(0, 0, 11), // "SqlOperator"
QT_MOC_LITERAL(1, 12, 14), // "insertQuestion"
QT_MOC_LITERAL(2, 27, 0), // ""
QT_MOC_LITERAL(3, 28, 10), // "iQuestion*"
QT_MOC_LITERAL(4, 39, 8), // "question"
QT_MOC_LITERAL(5, 48, 17), // "selectAllQuestion"
QT_MOC_LITERAL(6, 66, 14), // "updateQuestion"
QT_MOC_LITERAL(7, 81, 14), // "deleteQuestion"
QT_MOC_LITERAL(8, 96, 7), // "qint32&"
QT_MOC_LITERAL(9, 104, 2), // "id"
QT_MOC_LITERAL(10, 107, 4), // "int&"
QT_MOC_LITERAL(11, 112, 4), // "type"
QT_MOC_LITERAL(12, 117, 18), // "selectAllCQuestion"
QT_MOC_LITERAL(13, 136, 38), // "QList<QSharedPointer<ChoiceQu..."
QT_MOC_LITERAL(14, 175, 18), // "selectAllTQuestion"
QT_MOC_LITERAL(15, 194, 43), // "QList<QSharedPointer<TrueOrFa..."
QT_MOC_LITERAL(16, 238, 18), // "selectAllFQuestion"
QT_MOC_LITERAL(17, 257, 47), // "QList<QSharedPointer<FillInTh..."
QT_MOC_LITERAL(18, 305, 15) // "commitQuestions"

    },
    "SqlOperator\0insertQuestion\0\0iQuestion*\0"
    "question\0selectAllQuestion\0updateQuestion\0"
    "deleteQuestion\0qint32&\0id\0int&\0type\0"
    "selectAllCQuestion\0"
    "QList<QSharedPointer<ChoiceQuestion> >\0"
    "selectAllTQuestion\0"
    "QList<QSharedPointer<TrueOrFalseQuestion> >\0"
    "selectAllFQuestion\0"
    "QList<QSharedPointer<FillInTheBlanksQuestion> >\0"
    "commitQuestions"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_SqlOperator[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       8,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags
       1,    1,   54,    2, 0x0a /* Public */,
       5,    0,   57,    2, 0x0a /* Public */,
       6,    1,   58,    2, 0x0a /* Public */,
       7,    2,   61,    2, 0x0a /* Public */,
      12,    0,   66,    2, 0x0a /* Public */,
      14,    0,   67,    2, 0x0a /* Public */,
      16,    0,   68,    2, 0x0a /* Public */,
      18,    0,   69,    2, 0x0a /* Public */,

 // slots: parameters
    QMetaType::Bool, 0x80000000 | 3,    4,
    QMetaType::Void,
    QMetaType::Bool, 0x80000000 | 3,    4,
    QMetaType::Bool, 0x80000000 | 8, 0x80000000 | 10,    9,   11,
    0x80000000 | 13,
    0x80000000 | 15,
    0x80000000 | 17,
    QMetaType::Void,

       0        // eod
};

void SqlOperator::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<SqlOperator *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: { bool _r = _t->insertQuestion((*reinterpret_cast< iQuestion*(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 1: _t->selectAllQuestion(); break;
        case 2: { bool _r = _t->updateQuestion((*reinterpret_cast< iQuestion*(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 3: { bool _r = _t->deleteQuestion((*reinterpret_cast< qint32(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 4: { QList<QSharedPointer<ChoiceQuestion> > _r = _t->selectAllCQuestion();
            if (_a[0]) *reinterpret_cast< QList<QSharedPointer<ChoiceQuestion> >*>(_a[0]) = std::move(_r); }  break;
        case 5: { QList<QSharedPointer<TrueOrFalseQuestion> > _r = _t->selectAllTQuestion();
            if (_a[0]) *reinterpret_cast< QList<QSharedPointer<TrueOrFalseQuestion> >*>(_a[0]) = std::move(_r); }  break;
        case 6: { QList<QSharedPointer<FillInTheBlanksQuestion> > _r = _t->selectAllFQuestion();
            if (_a[0]) *reinterpret_cast< QList<QSharedPointer<FillInTheBlanksQuestion> >*>(_a[0]) = std::move(_r); }  break;
        case 7: _t->commitQuestions(); break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 0:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< iQuestion* >(); break;
            }
            break;
        case 2:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< iQuestion* >(); break;
            }
            break;
        }
    }
}

QT_INIT_METAOBJECT const QMetaObject SqlOperator::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_SqlOperator.data,
    qt_meta_data_SqlOperator,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *SqlOperator::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *SqlOperator::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_SqlOperator.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int SqlOperator::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
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
            qt_static_metacall(this, _c, _id, _a);
        _id -= 8;
    }
    return _id;
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
