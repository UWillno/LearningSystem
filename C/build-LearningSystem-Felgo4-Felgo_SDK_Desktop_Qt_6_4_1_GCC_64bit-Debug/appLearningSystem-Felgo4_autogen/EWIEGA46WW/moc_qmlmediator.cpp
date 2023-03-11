/****************************************************************************
** Meta object code from reading C++ file 'qmlmediator.h'
**
** Created by: The Qt Meta Object Compiler version 68 (Qt 6.4.1)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../../LearningSystem-Felgo4/qmlmediator.h"
#include <QtNetwork/QSslError>
#include <QtCore/qmetatype.h>
#include <QtCore/QList>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'qmlmediator.h' doesn't include <QObject>."
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
struct qt_meta_stringdata_QmlMediator_t {
    uint offsetsAndSizes[116];
    char stringdata0[12];
    char stringdata1[15];
    char stringdata2[1];
    char stringdata3[12];
    char stringdata4[16];
    char stringdata5[13];
    char stringdata6[15];
    char stringdata7[13];
    char stringdata8[20];
    char stringdata9[15];
    char stringdata10[13];
    char stringdata11[16];
    char stringdata12[13];
    char stringdata13[15];
    char stringdata14[6];
    char stringdata15[5];
    char stringdata16[10];
    char stringdata17[22];
    char stringdata18[4];
    char stringdata19[17];
    char stringdata20[9];
    char stringdata21[9];
    char stringdata22[14];
    char stringdata23[13];
    char stringdata24[8];
    char stringdata25[9];
    char stringdata26[9];
    char stringdata27[9];
    char stringdata28[19];
    char stringdata29[9];
    char stringdata30[8];
    char stringdata31[8];
    char stringdata32[8];
    char stringdata33[8];
    char stringdata34[7];
    char stringdata35[24];
    char stringdata36[28];
    char stringdata37[18];
    char stringdata38[15];
    char stringdata39[5];
    char stringdata40[5];
    char stringdata41[15];
    char stringdata42[3];
    char stringdata43[10];
    char stringdata44[2];
    char stringdata45[15];
    char stringdata46[14];
    char stringdata47[5];
    char stringdata48[14];
    char stringdata49[7];
    char stringdata50[11];
    char stringdata51[6];
    char stringdata52[5];
    char stringdata53[12];
    char stringdata54[17];
    char stringdata55[14];
    char stringdata56[13];
    char stringdata57[18];
};
#define QT_MOC_LITERAL(ofs, len) \
    uint(sizeof(qt_meta_stringdata_QmlMediator_t::offsetsAndSizes) + ofs), len 
Q_CONSTINIT static const qt_meta_stringdata_QmlMediator_t qt_meta_stringdata_QmlMediator = {
    {
        QT_MOC_LITERAL(0, 11),  // "QmlMediator"
        QT_MOC_LITERAL(12, 14),  // "loginSucceeded"
        QT_MOC_LITERAL(27, 0),  // ""
        QT_MOC_LITERAL(28, 11),  // "loginFailed"
        QT_MOC_LITERAL(40, 15),  // "submitSucceeded"
        QT_MOC_LITERAL(56, 12),  // "submitFailed"
        QT_MOC_LITERAL(69, 14),  // "selectSuceeded"
        QT_MOC_LITERAL(84, 12),  // "selectFailed"
        QT_MOC_LITERAL(97, 19),  // "tcpQuestionsChanged"
        QT_MOC_LITERAL(117, 14),  // "deleteSuceeded"
        QT_MOC_LITERAL(132, 12),  // "deleteFailed"
        QT_MOC_LITERAL(145, 15),  // "updateSucceeded"
        QT_MOC_LITERAL(161, 12),  // "updateFailed"
        QT_MOC_LITERAL(174, 14),  // "uploadResource"
        QT_MOC_LITERAL(189, 5),  // "QUrl&"
        QT_MOC_LITERAL(195, 4),  // "path"
        QT_MOC_LITERAL(200, 9),  // "uploadXxt"
        QT_MOC_LITERAL(210, 21),  // "uploadResourceSucceed"
        QT_MOC_LITERAL(232, 3),  // "url"
        QT_MOC_LITERAL(236, 16),  // "uploadXxtSucceed"
        QT_MOC_LITERAL(253, 8),  // "objectId"
        QT_MOC_LITERAL(262, 8),  // "uploadQr"
        QT_MOC_LITERAL(271, 13),  // "decodeSucceed"
        QT_MOC_LITERAL(285, 12),  // "decodeFailed"
        QT_MOC_LITERAL(298, 7),  // "tologin"
        QT_MOC_LITERAL(306, 8),  // "username"
        QT_MOC_LITERAL(315, 8),  // "password"
        QT_MOC_LITERAL(324, 8),  // "usertype"
        QT_MOC_LITERAL(333, 18),  // "sendChoiceQuestion"
        QT_MOC_LITERAL(352, 8),  // "question"
        QT_MOC_LITERAL(361, 7),  // "option1"
        QT_MOC_LITERAL(369, 7),  // "option2"
        QT_MOC_LITERAL(377, 7),  // "option3"
        QT_MOC_LITERAL(385, 7),  // "option4"
        QT_MOC_LITERAL(393, 6),  // "answer"
        QT_MOC_LITERAL(400, 23),  // "sendTrueOrFalseQuestion"
        QT_MOC_LITERAL(424, 27),  // "sendFillInTheBlanksQuestion"
        QT_MOC_LITERAL(452, 17),  // "getQuestionsByTcp"
        QT_MOC_LITERAL(470, 14),  // "updateQuestion"
        QT_MOC_LITERAL(485, 4),  // "json"
        QT_MOC_LITERAL(490, 4),  // "type"
        QT_MOC_LITERAL(495, 14),  // "deleteQuestion"
        QT_MOC_LITERAL(510, 2),  // "id"
        QT_MOC_LITERAL(513, 9),  // "testModel"
        QT_MOC_LITERAL(523, 1),  // "a"
        QT_MOC_LITERAL(525, 14),  // "commitQuestons"
        QT_MOC_LITERAL(540, 13),  // "createNewUser"
        QT_MOC_LITERAL(554, 4),  // "cxid"
        QT_MOC_LITERAL(559, 13),  // "uploadPicture"
        QT_MOC_LITERAL(573, 6),  // "upload"
        QT_MOC_LITERAL(580, 10),  // "submitPost"
        QT_MOC_LITERAL(591, 5),  // "title"
        QT_MOC_LITERAL(597, 4),  // "text"
        QT_MOC_LITERAL(602, 11),  // "selectPosts"
        QT_MOC_LITERAL(614, 16),  // "uploadPhotoToXxt"
        QT_MOC_LITERAL(631, 13),  // "uploadQrPhoto"
        QT_MOC_LITERAL(645, 12),  // "tcpQuestions"
        QT_MOC_LITERAL(658, 17)   // "QList<QJsonArray>"
    },
    "QmlMediator",
    "loginSucceeded",
    "",
    "loginFailed",
    "submitSucceeded",
    "submitFailed",
    "selectSuceeded",
    "selectFailed",
    "tcpQuestionsChanged",
    "deleteSuceeded",
    "deleteFailed",
    "updateSucceeded",
    "updateFailed",
    "uploadResource",
    "QUrl&",
    "path",
    "uploadXxt",
    "uploadResourceSucceed",
    "url",
    "uploadXxtSucceed",
    "objectId",
    "uploadQr",
    "decodeSucceed",
    "decodeFailed",
    "tologin",
    "username",
    "password",
    "usertype",
    "sendChoiceQuestion",
    "question",
    "option1",
    "option2",
    "option3",
    "option4",
    "answer",
    "sendTrueOrFalseQuestion",
    "sendFillInTheBlanksQuestion",
    "getQuestionsByTcp",
    "updateQuestion",
    "json",
    "type",
    "deleteQuestion",
    "id",
    "testModel",
    "a",
    "commitQuestons",
    "createNewUser",
    "cxid",
    "uploadPicture",
    "upload",
    "submitPost",
    "title",
    "text",
    "selectPosts",
    "uploadPhotoToXxt",
    "uploadQrPhoto",
    "tcpQuestions",
    "QList<QJsonArray>"
};
#undef QT_MOC_LITERAL
} // unnamed namespace

Q_CONSTINIT static const uint qt_meta_data_QmlMediator[] = {

 // content:
      10,       // revision
       0,       // classname
       0,    0, // classinfo
      34,   14, // methods
       1,  322, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
      18,       // signalCount

 // signals: name, argc, parameters, tag, flags, initial metatype offsets
       1,    0,  218,    2, 0x06,    2 /* Public */,
       3,    0,  219,    2, 0x06,    3 /* Public */,
       4,    0,  220,    2, 0x06,    4 /* Public */,
       5,    0,  221,    2, 0x06,    5 /* Public */,
       6,    0,  222,    2, 0x06,    6 /* Public */,
       7,    0,  223,    2, 0x06,    7 /* Public */,
       8,    0,  224,    2, 0x06,    8 /* Public */,
       9,    0,  225,    2, 0x06,    9 /* Public */,
      10,    0,  226,    2, 0x06,   10 /* Public */,
      11,    0,  227,    2, 0x06,   11 /* Public */,
      12,    0,  228,    2, 0x06,   12 /* Public */,
      13,    1,  229,    2, 0x06,   13 /* Public */,
      16,    1,  232,    2, 0x06,   15 /* Public */,
      17,    1,  235,    2, 0x06,   17 /* Public */,
      19,    1,  238,    2, 0x06,   19 /* Public */,
      21,    1,  241,    2, 0x06,   21 /* Public */,
      22,    1,  244,    2, 0x06,   23 /* Public */,
      23,    0,  247,    2, 0x06,   25 /* Public */,

 // slots: name, argc, parameters, tag, flags, initial metatype offsets
      24,    3,  248,    2, 0x0a,   26 /* Public */,
      28,    6,  255,    2, 0x0a,   30 /* Public */,
      35,    2,  268,    2, 0x0a,   37 /* Public */,
      36,    2,  273,    2, 0x0a,   40 /* Public */,
      37,    0,  278,    2, 0x0a,   43 /* Public */,
      38,    2,  279,    2, 0x0a,   44 /* Public */,
      41,    2,  284,    2, 0x0a,   47 /* Public */,
      43,    1,  289,    2, 0x0a,   50 /* Public */,
      45,    0,  292,    2, 0x0a,   52 /* Public */,
      46,    2,  293,    2, 0x0a,   53 /* Public */,
      48,    1,  298,    2, 0x0a,   56 /* Public */,
      49,    1,  301,    2, 0x0a,   58 /* Public */,
      50,    5,  304,    2, 0x0a,   60 /* Public */,
      53,    0,  315,    2, 0x0a,   66 /* Public */,
      54,    1,  316,    2, 0x0a,   67 /* Public */,
      55,    1,  319,    2, 0x0a,   69 /* Public */,

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
    QMetaType::Void, 0x80000000 | 14,   15,
    QMetaType::Void, 0x80000000 | 14,   15,
    QMetaType::Void, QMetaType::QString,   18,
    QMetaType::Void, QMetaType::QString,   20,
    QMetaType::Void, 0x80000000 | 14,   15,
    QMetaType::Void, QMetaType::QString,   18,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::Int,   25,   26,   27,
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::QString,   29,   30,   31,   32,   33,   34,
    QMetaType::Void, QMetaType::QString, QMetaType::Bool,   29,   34,
    QMetaType::Void, QMetaType::QString, QMetaType::QString,   29,   34,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QJsonObject, QMetaType::Int,   39,   40,
    QMetaType::Void, QMetaType::Int, QMetaType::Int,   42,   40,
    QMetaType::Void, QMetaType::QJsonObject,   44,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString, QMetaType::Int,   25,   47,
    QMetaType::QString, QMetaType::QUrl,   15,
    QMetaType::Void, QMetaType::QUrl,   15,
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::Int, QMetaType::QString, QMetaType::Int,   51,   52,   47,   25,   40,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QUrl,   15,
    QMetaType::Void, QMetaType::QUrl,   15,

 // properties: name, type, flags
      56, 0x80000000 | 57, 0x0001510f, uint(6), 0,

       0        // eod
};

Q_CONSTINIT const QMetaObject QmlMediator::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_QmlMediator.offsetsAndSizes,
    qt_meta_data_QmlMediator,
    qt_static_metacall,
    nullptr,
    qt_incomplete_metaTypeArray<qt_meta_stringdata_QmlMediator_t,
        // property 'tcpQuestions'
        QtPrivate::TypeAndForceComplete<QList<QJsonArray>, std::true_type>,
        // Q_OBJECT / Q_GADGET
        QtPrivate::TypeAndForceComplete<QmlMediator, std::true_type>,
        // method 'loginSucceeded'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'loginFailed'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'submitSucceeded'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'submitFailed'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'selectSuceeded'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'selectFailed'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'tcpQuestionsChanged'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'deleteSuceeded'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'deleteFailed'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'updateSucceeded'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'updateFailed'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'uploadResource'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QUrl &, std::false_type>,
        // method 'uploadXxt'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QUrl &, std::false_type>,
        // method 'uploadResourceSucceed'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        // method 'uploadXxtSucceed'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        // method 'uploadQr'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QUrl &, std::false_type>,
        // method 'decodeSucceed'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        // method 'decodeFailed'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'tologin'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        QtPrivate::TypeAndForceComplete<const int, std::false_type>,
        // method 'sendChoiceQuestion'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        // method 'sendTrueOrFalseQuestion'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        QtPrivate::TypeAndForceComplete<bool, std::false_type>,
        // method 'sendFillInTheBlanksQuestion'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        // method 'getQuestionsByTcp'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'updateQuestion'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QJsonObject, std::false_type>,
        QtPrivate::TypeAndForceComplete<qint32, std::false_type>,
        // method 'deleteQuestion'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<qint32, std::false_type>,
        QtPrivate::TypeAndForceComplete<qint32, std::false_type>,
        // method 'testModel'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QJsonObject, std::false_type>,
        // method 'commitQuestons'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'createNewUser'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        QtPrivate::TypeAndForceComplete<qint32, std::false_type>,
        // method 'uploadPicture'
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        QtPrivate::TypeAndForceComplete<QUrl, std::false_type>,
        // method 'upload'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QUrl, std::false_type>,
        // method 'submitPost'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        QtPrivate::TypeAndForceComplete<qint32, std::false_type>,
        QtPrivate::TypeAndForceComplete<QString, std::false_type>,
        QtPrivate::TypeAndForceComplete<qint32, std::false_type>,
        // method 'selectPosts'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        // method 'uploadPhotoToXxt'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QUrl, std::false_type>,
        // method 'uploadQrPhoto'
        QtPrivate::TypeAndForceComplete<void, std::false_type>,
        QtPrivate::TypeAndForceComplete<QUrl, std::false_type>
    >,
    nullptr
} };

void QmlMediator::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<QmlMediator *>(_o);
        (void)_t;
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
        case 11: _t->uploadResource((*reinterpret_cast< std::add_pointer_t<QUrl&>>(_a[1]))); break;
        case 12: _t->uploadXxt((*reinterpret_cast< std::add_pointer_t<QUrl&>>(_a[1]))); break;
        case 13: _t->uploadResourceSucceed((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1]))); break;
        case 14: _t->uploadXxtSucceed((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1]))); break;
        case 15: _t->uploadQr((*reinterpret_cast< std::add_pointer_t<QUrl&>>(_a[1]))); break;
        case 16: _t->decodeSucceed((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1]))); break;
        case 17: _t->decodeFailed(); break;
        case 18: _t->tologin((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<QString>>(_a[2])),(*reinterpret_cast< std::add_pointer_t<int>>(_a[3]))); break;
        case 19: _t->sendChoiceQuestion((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<QString>>(_a[2])),(*reinterpret_cast< std::add_pointer_t<QString>>(_a[3])),(*reinterpret_cast< std::add_pointer_t<QString>>(_a[4])),(*reinterpret_cast< std::add_pointer_t<QString>>(_a[5])),(*reinterpret_cast< std::add_pointer_t<QString>>(_a[6]))); break;
        case 20: _t->sendTrueOrFalseQuestion((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<bool>>(_a[2]))); break;
        case 21: _t->sendFillInTheBlanksQuestion((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<QString>>(_a[2]))); break;
        case 22: _t->getQuestionsByTcp(); break;
        case 23: _t->updateQuestion((*reinterpret_cast< std::add_pointer_t<QJsonObject>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<qint32>>(_a[2]))); break;
        case 24: _t->deleteQuestion((*reinterpret_cast< std::add_pointer_t<qint32>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<qint32>>(_a[2]))); break;
        case 25: _t->testModel((*reinterpret_cast< std::add_pointer_t<QJsonObject>>(_a[1]))); break;
        case 26: _t->commitQuestons(); break;
        case 27: _t->createNewUser((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<qint32>>(_a[2]))); break;
        case 28: { QString _r = _t->uploadPicture((*reinterpret_cast< std::add_pointer_t<QUrl>>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 29: _t->upload((*reinterpret_cast< std::add_pointer_t<QUrl>>(_a[1]))); break;
        case 30: _t->submitPost((*reinterpret_cast< std::add_pointer_t<QString>>(_a[1])),(*reinterpret_cast< std::add_pointer_t<QString>>(_a[2])),(*reinterpret_cast< std::add_pointer_t<qint32>>(_a[3])),(*reinterpret_cast< std::add_pointer_t<QString>>(_a[4])),(*reinterpret_cast< std::add_pointer_t<qint32>>(_a[5]))); break;
        case 31: _t->selectPosts(); break;
        case 32: _t->uploadPhotoToXxt((*reinterpret_cast< std::add_pointer_t<QUrl>>(_a[1]))); break;
        case 33: _t->uploadQrPhoto((*reinterpret_cast< std::add_pointer_t<QUrl>>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (QmlMediator::*)();
            if (_t _q_method = &QmlMediator::loginSucceeded; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (QmlMediator::*)();
            if (_t _q_method = &QmlMediator::loginFailed; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (QmlMediator::*)();
            if (_t _q_method = &QmlMediator::submitSucceeded; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (QmlMediator::*)();
            if (_t _q_method = &QmlMediator::submitFailed; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (QmlMediator::*)();
            if (_t _q_method = &QmlMediator::selectSuceeded; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 4;
                return;
            }
        }
        {
            using _t = void (QmlMediator::*)();
            if (_t _q_method = &QmlMediator::selectFailed; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 5;
                return;
            }
        }
        {
            using _t = void (QmlMediator::*)();
            if (_t _q_method = &QmlMediator::tcpQuestionsChanged; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 6;
                return;
            }
        }
        {
            using _t = void (QmlMediator::*)();
            if (_t _q_method = &QmlMediator::deleteSuceeded; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 7;
                return;
            }
        }
        {
            using _t = void (QmlMediator::*)();
            if (_t _q_method = &QmlMediator::deleteFailed; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 8;
                return;
            }
        }
        {
            using _t = void (QmlMediator::*)();
            if (_t _q_method = &QmlMediator::updateSucceeded; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 9;
                return;
            }
        }
        {
            using _t = void (QmlMediator::*)();
            if (_t _q_method = &QmlMediator::updateFailed; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 10;
                return;
            }
        }
        {
            using _t = void (QmlMediator::*)(QUrl & );
            if (_t _q_method = &QmlMediator::uploadResource; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 11;
                return;
            }
        }
        {
            using _t = void (QmlMediator::*)(QUrl & );
            if (_t _q_method = &QmlMediator::uploadXxt; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 12;
                return;
            }
        }
        {
            using _t = void (QmlMediator::*)(QString );
            if (_t _q_method = &QmlMediator::uploadResourceSucceed; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 13;
                return;
            }
        }
        {
            using _t = void (QmlMediator::*)(QString );
            if (_t _q_method = &QmlMediator::uploadXxtSucceed; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 14;
                return;
            }
        }
        {
            using _t = void (QmlMediator::*)(QUrl & );
            if (_t _q_method = &QmlMediator::uploadQr; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 15;
                return;
            }
        }
        {
            using _t = void (QmlMediator::*)(QString );
            if (_t _q_method = &QmlMediator::decodeSucceed; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 16;
                return;
            }
        }
        {
            using _t = void (QmlMediator::*)();
            if (_t _q_method = &QmlMediator::decodeFailed; *reinterpret_cast<_t *>(_a[1]) == _q_method) {
                *result = 17;
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
else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<QmlMediator *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< QList<QJsonArray>*>(_v) = _t->tcpQuestions(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<QmlMediator *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setTcpQuestions(*reinterpret_cast< QList<QJsonArray>*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
        auto *_t = static_cast<QmlMediator *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->resetTcpQuestions(); break;
        default: break;
        }
    } else if (_c == QMetaObject::BindableProperty) {
    }
}

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
        if (_id < 34)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 34;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 34)
            *reinterpret_cast<QMetaType *>(_a[0]) = QMetaType();
        _id -= 34;
    }else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::BindableProperty
            || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 1;
    }
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

// SIGNAL 11
void QmlMediator::uploadResource(QUrl & _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 11, _a);
}

// SIGNAL 12
void QmlMediator::uploadXxt(QUrl & _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 12, _a);
}

// SIGNAL 13
void QmlMediator::uploadResourceSucceed(QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 13, _a);
}

// SIGNAL 14
void QmlMediator::uploadXxtSucceed(QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 14, _a);
}

// SIGNAL 15
void QmlMediator::uploadQr(QUrl & _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 15, _a);
}

// SIGNAL 16
void QmlMediator::decodeSucceed(QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 16, _a);
}

// SIGNAL 17
void QmlMediator::decodeFailed()
{
    QMetaObject::activate(this, &staticMetaObject, 17, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
