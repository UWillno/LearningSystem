/****************************************************************************
** Meta object code from reading C++ file 'sqloperator.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.4.2)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../../Server-cmake/sqloperator.h"
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'sqloperator.h' doesn't include <QObject>."
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
struct qt_meta_stringdata_SqlOperator_t {
    uint offsetsAndSizes[38];
    char stringdata0[12];
    char stringdata1[15];
    char stringdata2[1];
    char stringdata3[11];
    char stringdata4[9];
    char stringdata5[18];
    char stringdata6[15];
    char stringdata7[15];
    char stringdata8[8];
    char stringdata9[3];
    char stringdata10[5];
    char stringdata11[5];
    char stringdata12[19];
    char stringdata13[38];
    char stringdata14[19];
    char stringdata15[43];
    char stringdata16[19];
    char stringdata17[47];
    char stringdata18[16];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(sizeof(qt_meta_stringdata_SqlOperator_t::offsetsAndSizes) + ofs), len 
Q_CONSTINIT static const qt_meta_stringdata_SqlOperator_t qt_meta_stringdata_SqlOperator = {
    {
        QT_MOC_LITERAL(0, 11),  // "SqlOperator"
        QT_MOC_LITERAL(12, 14),  // "insertQuestion"
        QT_MOC_LITERAL(27, 0),  // ""
        QT_MOC_LITERAL(28, 10),  // "iQuestion*"
        QT_MOC_LITERAL(39, 8),  // "question"
        QT_MOC_LITERAL(48, 17),  // "selectAllQuestion"
        QT_MOC_LITERAL(66, 14),  // "updateQuestion"
        QT_MOC_LITERAL(81, 14),  // "deleteQuestion"
        QT_MOC_LITERAL(96, 7),  // "qint32&"
        QT_MOC_LITERAL(104, 2),  // "id"
        QT_MOC_LITERAL(107, 4),  // "int&"
        QT_MOC_LITERAL(112, 4),  // "type"
        QT_MOC_LITERAL(117, 18),  // "selectAllCQuestion"
        QT_MOC_LITERAL(136, 37),  // "QList<QSharedPointer<ChoiceQu..."
        QT_MOC_LITERAL(174, 18),  // "selectAllTQuestion"
        QT_MOC_LITERAL(193, 42),  // "QList<QSharedPointer<TrueOrFa..."
        QT_MOC_LITERAL(236, 18),  // "selectAllFQuestion"
        QT_MOC_LITERAL(255, 46),  // "QList<QSharedPointer<FillInTh..."
        QT_MOC_LITERAL(302, 15)   // "commitQuestions"
    },
    "SqlOperator",
    "insertQuestion",
    "",
    "iQuestion*",
    "question",
    "selectAllQuestion",
    "updateQuestion",
    "deleteQuestion",
    "qint32&",
    "id",
    "int&",
    "type",
    "selectAllCQuestion",
    "QList<QSharedPointer<ChoiceQuestion>>",
    "selectAllTQuestion",
    "QList<QSharedPointer<TrueOrFalseQuestion>>",
    "selectAllFQuestion",
    "QList<QSharedPointer<FillInTheBlanksQuestion>>",
    "commitQuestions"
};
#undef QT_MOC_LITERAL
} // unnamed namespace

Q_CONSTINIT static const uint qt_meta_data_SqlOperator[] = {

 // content:
      10,       // revision
       0,       // classname
       0,    0, // classinfo
       8,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       0,       // signalCount

 // slots: name, argc, parameters, tag, flags, initial metatype offsets
       1,    1,   62,    2, 0x0a,    1 /* Public */,
       5,    0,   65,    2, 0x0a,    3 /* Public */,
       6,    1,   66,    2, 0x0a,    4 /* Public */,
       7,    2,   69,    2, 0x0a,    6 /* Public */,
      12,    0,   74,    2, 0x0a,    9 /* Public */,
      14,    0,   75,    2, 0x0a,   10 /* Public */,
      16,    0,   76,    2, 0x0a,   11 /* Public */,
      18,    0,   77,    2, 0x0a,   12 /* Public */,

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

Q_CONSTINIT const QMetaObject SqlOperator::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_SqlOperator.offsetsAndSizes,
    qt_meta_data_SqlOperator,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_stringdata_SqlOperator_t,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<SqlOperator, std::true_type>,
        // method 'insertQuestion'
        QtPrivate::TypeAndForceComplete<bool, std::false_type>,
        QtPrivate::TypeAndForceComplete<iQuestion *, std::false_type>,
        // method 'selectAllQuestion'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'updateQuestion'
        QtPrivate::TypeAndForceComplete<bool, std::false_type>,
        QtPrivate::TypeAndForceComplete<iQuestion *, std::false_type>,
        // method 'deleteQuestion'
        QtPrivate::TypeAndForceComplete<bool, std::false_type>,
        QtPrivate::TypeAndForceComplete<qint32 &, std::false_type>,
        QtPrivate::TypeAndForceComplete<int &, std::false_type>,
        // method 'selectAllCQuestion'
        QtPrivate::TypeAndForceComplete<QList<QSharedPointer<ChoiceQuestion>>, std::false_type>,
        // method 'selectAllTQuestion'
        QtPrivate::TypeAndForceComplete<QList<QSharedPointer<TrueOrFalseQuestion>>, std::false_type>,
        // method 'selectAllFQuestion'
        QtPrivate::TypeAndForceComplete<QList<QSharedPointer<FillInTheBlanksQuestion>>, std::false_type>,
        // method 'commitQuestions'
        QtPrivate::TypeAndForceComplete<void, std::false_type>
    >,
    nullptr
} };

void SqlOperator::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<SqlOperator *>(_o);
        (void)_t;
        switch (_id) {
        case 0: { bool _r = _t->insertQuestion((*reinterpret_cast< std::add_pointer_t<iQuestion*>>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 1: _t->selectAllQuestion(); break;
        case 2: { bool _r = _t->updateQuestion((*reinterpret_cast< std::add_pointer_t<iQuestion*>>(_a[1])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 3: { bool _r = _t->deleteQuestion((*reinterpret_cast< std::add_pointer_t<qint32&>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<int&>>(_a[2])));
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 4: { QList<QSharedPointer<ChoiceQuestion>> _r = _t->selectAllCQuestion();
            if (_a[0]) *reinterpret_cast< QList<QSharedPointer<ChoiceQuestion>>*>(_a[0]) = std::move(_r); }  break;
        case 5: { QList<QSharedPointer<TrueOrFalseQuestion>> _r = _t->selectAllTQuestion();
            if (_a[0]) *reinterpret_cast< QList<QSharedPointer<TrueOrFalseQuestion>>*>(_a[0]) = std::move(_r); }  break;
        case 6: { QList<QSharedPointer<FillInTheBlanksQuestion>> _r = _t->selectAllFQuestion();
            if (_a[0]) *reinterpret_cast< QList<QSharedPointer<FillInTheBlanksQuestion>>*>(_a[0]) = std::move(_r); }  break;
        case 7: _t->commitQuestions(); break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
        case 0:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
            case 0:
                *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType::fromType< iQuestion* >(); break;
            }
            break;
        case 2:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType(); break;
            case 0:
                *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType::fromType< iQuestion* >(); break;
            }
            break;
        }
    }
}

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
