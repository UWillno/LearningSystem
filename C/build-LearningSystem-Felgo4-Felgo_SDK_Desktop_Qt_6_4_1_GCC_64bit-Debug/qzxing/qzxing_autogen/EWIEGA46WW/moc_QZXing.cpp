/****************************************************************************
** Meta object code from reading C++ file 'QZXing.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.15.8)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include <memory>
#include "../../../../LearningSystem-Felgo4/qzxing/QZXing.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'QZXing.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.15.8. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_QZXing_t {
    QByteArrayData data[67];
    char stringdata0[1065];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_QZXing_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_QZXing_t qt_meta_stringdata_QZXing = {
    {
QT_MOC_LITERAL(0, 0, 6), // "QZXing"
QT_MOC_LITERAL(1, 7, 15), // "decodingStarted"
QT_MOC_LITERAL(2, 23, 0), // ""
QT_MOC_LITERAL(3, 24, 16), // "decodingFinished"
QT_MOC_LITERAL(4, 41, 9), // "succeeded"
QT_MOC_LITERAL(5, 51, 21), // "enabledFormatsChanged"
QT_MOC_LITERAL(6, 73, 8), // "tagFound"
QT_MOC_LITERAL(7, 82, 3), // "tag"
QT_MOC_LITERAL(8, 86, 16), // "tagFoundAdvanced"
QT_MOC_LITERAL(9, 103, 6), // "format"
QT_MOC_LITERAL(10, 110, 7), // "charSet"
QT_MOC_LITERAL(11, 118, 4), // "rect"
QT_MOC_LITERAL(12, 123, 8), // "metadata"
QT_MOC_LITERAL(13, 132, 5), // "error"
QT_MOC_LITERAL(14, 138, 3), // "msg"
QT_MOC_LITERAL(15, 142, 11), // "decodeImage"
QT_MOC_LITERAL(16, 154, 5), // "image"
QT_MOC_LITERAL(17, 160, 8), // "maxWidth"
QT_MOC_LITERAL(18, 169, 9), // "maxHeight"
QT_MOC_LITERAL(19, 179, 20), // "smoothTransformation"
QT_MOC_LITERAL(20, 200, 19), // "decodeImageFromFile"
QT_MOC_LITERAL(21, 220, 13), // "imageFilePath"
QT_MOC_LITERAL(22, 234, 14), // "decodeImageQML"
QT_MOC_LITERAL(23, 249, 4), // "item"
QT_MOC_LITERAL(24, 254, 17), // "decodeSubImageQML"
QT_MOC_LITERAL(25, 272, 7), // "offsetX"
QT_MOC_LITERAL(26, 280, 7), // "offsetY"
QT_MOC_LITERAL(27, 288, 5), // "width"
QT_MOC_LITERAL(28, 294, 6), // "height"
QT_MOC_LITERAL(29, 301, 8), // "imageUrl"
QT_MOC_LITERAL(30, 310, 28), // "getProcessTimeOfLastDecoding"
QT_MOC_LITERAL(31, 339, 17), // "getEnabledFormats"
QT_MOC_LITERAL(32, 357, 10), // "setDecoder"
QT_MOC_LITERAL(33, 368, 4), // "hint"
QT_MOC_LITERAL(34, 373, 13), // "foundedFormat"
QT_MOC_LITERAL(35, 387, 14), // "processingTime"
QT_MOC_LITERAL(36, 402, 15), // "enabledDecoders"
QT_MOC_LITERAL(37, 418, 13), // "tryHarderType"
QT_MOC_LITERAL(38, 432, 17), // "imageSourceFilter"
QT_MOC_LITERAL(39, 450, 9), // "tryHarder"
QT_MOC_LITERAL(40, 460, 17), // "allowedExtensions"
QT_MOC_LITERAL(41, 478, 13), // "DecoderFormat"
QT_MOC_LITERAL(42, 492, 18), // "DecoderFormat_None"
QT_MOC_LITERAL(43, 511, 19), // "DecoderFormat_Aztec"
QT_MOC_LITERAL(44, 531, 21), // "DecoderFormat_CODABAR"
QT_MOC_LITERAL(45, 553, 21), // "DecoderFormat_CODE_39"
QT_MOC_LITERAL(46, 575, 21), // "DecoderFormat_CODE_93"
QT_MOC_LITERAL(47, 597, 22), // "DecoderFormat_CODE_128"
QT_MOC_LITERAL(48, 620, 25), // "DecoderFormat_DATA_MATRIX"
QT_MOC_LITERAL(49, 646, 19), // "DecoderFormat_EAN_8"
QT_MOC_LITERAL(50, 666, 20), // "DecoderFormat_EAN_13"
QT_MOC_LITERAL(51, 687, 17), // "DecoderFormat_ITF"
QT_MOC_LITERAL(52, 705, 22), // "DecoderFormat_MAXICODE"
QT_MOC_LITERAL(53, 728, 21), // "DecoderFormat_PDF_417"
QT_MOC_LITERAL(54, 750, 21), // "DecoderFormat_QR_CODE"
QT_MOC_LITERAL(55, 772, 20), // "DecoderFormat_RSS_14"
QT_MOC_LITERAL(56, 793, 26), // "DecoderFormat_RSS_EXPANDED"
QT_MOC_LITERAL(57, 820, 19), // "DecoderFormat_UPC_A"
QT_MOC_LITERAL(58, 840, 19), // "DecoderFormat_UPC_E"
QT_MOC_LITERAL(59, 860, 31), // "DecoderFormat_UPC_EAN_EXTENSION"
QT_MOC_LITERAL(60, 892, 26), // "DecoderFormat_CODE_128_GS1"
QT_MOC_LITERAL(61, 919, 18), // "TryHarderBehaviour"
QT_MOC_LITERAL(62, 938, 35), // "TryHarderBehaviour_ThoroughSc..."
QT_MOC_LITERAL(63, 974, 25), // "TryHarderBehaviour_Rotate"
QT_MOC_LITERAL(64, 1000, 12), // "SourceFilter"
QT_MOC_LITERAL(65, 1013, 24), // "SourceFilter_ImageNormal"
QT_MOC_LITERAL(66, 1038, 26) // "SourceFilter_ImageInverted"

    },
    "QZXing\0decodingStarted\0\0decodingFinished\0"
    "succeeded\0enabledFormatsChanged\0"
    "tagFound\0tag\0tagFoundAdvanced\0format\0"
    "charSet\0rect\0metadata\0error\0msg\0"
    "decodeImage\0image\0maxWidth\0maxHeight\0"
    "smoothTransformation\0decodeImageFromFile\0"
    "imageFilePath\0decodeImageQML\0item\0"
    "decodeSubImageQML\0offsetX\0offsetY\0"
    "width\0height\0imageUrl\0"
    "getProcessTimeOfLastDecoding\0"
    "getEnabledFormats\0setDecoder\0hint\0"
    "foundedFormat\0processingTime\0"
    "enabledDecoders\0tryHarderType\0"
    "imageSourceFilter\0tryHarder\0"
    "allowedExtensions\0DecoderFormat\0"
    "DecoderFormat_None\0DecoderFormat_Aztec\0"
    "DecoderFormat_CODABAR\0DecoderFormat_CODE_39\0"
    "DecoderFormat_CODE_93\0DecoderFormat_CODE_128\0"
    "DecoderFormat_DATA_MATRIX\0DecoderFormat_EAN_8\0"
    "DecoderFormat_EAN_13\0DecoderFormat_ITF\0"
    "DecoderFormat_MAXICODE\0DecoderFormat_PDF_417\0"
    "DecoderFormat_QR_CODE\0DecoderFormat_RSS_14\0"
    "DecoderFormat_RSS_EXPANDED\0"
    "DecoderFormat_UPC_A\0DecoderFormat_UPC_E\0"
    "DecoderFormat_UPC_EAN_EXTENSION\0"
    "DecoderFormat_CODE_128_GS1\0"
    "TryHarderBehaviour\0"
    "TryHarderBehaviour_ThoroughScanning\0"
    "TryHarderBehaviour_Rotate\0SourceFilter\0"
    "SourceFilter_ImageNormal\0"
    "SourceFilter_ImageInverted"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_QZXing[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
      33,   14, // methods
       6,  346, // properties
       3,  370, // enums/sets
       0,    0, // constructors
       0,       // flags
       8,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,  179,    2, 0x06 /* Public */,
       3,    1,  180,    2, 0x06 /* Public */,
       5,    0,  183,    2, 0x06 /* Public */,
       6,    1,  184,    2, 0x06 /* Public */,
       8,    3,  187,    2, 0x06 /* Public */,
       8,    4,  194,    2, 0x06 /* Public */,
       8,    4,  203,    2, 0x06 /* Public */,
      13,    1,  212,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
      15,    4,  215,    2, 0x0a /* Public */,
      15,    3,  224,    2, 0x2a /* Public | MethodCloned */,
      15,    2,  231,    2, 0x2a /* Public | MethodCloned */,
      15,    1,  236,    2, 0x2a /* Public | MethodCloned */,
      20,    4,  239,    2, 0x0a /* Public */,
      20,    3,  248,    2, 0x2a /* Public | MethodCloned */,
      20,    2,  255,    2, 0x2a /* Public | MethodCloned */,
      20,    1,  260,    2, 0x2a /* Public | MethodCloned */,
      22,    1,  263,    2, 0x0a /* Public */,
      24,    5,  266,    2, 0x0a /* Public */,
      24,    4,  277,    2, 0x2a /* Public | MethodCloned */,
      24,    3,  286,    2, 0x2a /* Public | MethodCloned */,
      24,    2,  293,    2, 0x2a /* Public | MethodCloned */,
      24,    1,  298,    2, 0x2a /* Public | MethodCloned */,
      22,    1,  301,    2, 0x0a /* Public */,
      24,    5,  304,    2, 0x0a /* Public */,
      24,    4,  315,    2, 0x2a /* Public | MethodCloned */,
      24,    3,  324,    2, 0x2a /* Public | MethodCloned */,
      24,    2,  331,    2, 0x2a /* Public | MethodCloned */,
      24,    1,  336,    2, 0x2a /* Public | MethodCloned */,
      30,    0,  339,    2, 0x0a /* Public */,
      31,    0,  340,    2, 0x0a /* Public */,
      32,    1,  341,    2, 0x0a /* Public */,

 // methods: name, argc, parameters, tag, flags
      34,    0,  344,    2, 0x02 /* Public */,
      10,    0,  345,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void, QMetaType::Bool,    4,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,    7,
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::QString,    7,    9,   10,
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::QRectF,    7,    9,   10,   11,
    QMetaType::Void, QMetaType::QString, QMetaType::QString, QMetaType::QString, QMetaType::QVariantMap,    7,    9,   10,   12,
    QMetaType::Void, QMetaType::QString,   14,

 // slots: parameters
    QMetaType::QString, QMetaType::QImage, QMetaType::Int, QMetaType::Int, QMetaType::Bool,   16,   17,   18,   19,
    QMetaType::QString, QMetaType::QImage, QMetaType::Int, QMetaType::Int,   16,   17,   18,
    QMetaType::QString, QMetaType::QImage, QMetaType::Int,   16,   17,
    QMetaType::QString, QMetaType::QImage,   16,
    QMetaType::QString, QMetaType::QString, QMetaType::Int, QMetaType::Int, QMetaType::Bool,   21,   17,   18,   19,
    QMetaType::QString, QMetaType::QString, QMetaType::Int, QMetaType::Int,   21,   17,   18,
    QMetaType::QString, QMetaType::QString, QMetaType::Int,   21,   17,
    QMetaType::QString, QMetaType::QString,   21,
    QMetaType::QString, QMetaType::QObjectStar,   23,
    QMetaType::QString, QMetaType::QObjectStar, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int,   23,   25,   26,   27,   28,
    QMetaType::QString, QMetaType::QObjectStar, QMetaType::Int, QMetaType::Int, QMetaType::Int,   23,   25,   26,   27,
    QMetaType::QString, QMetaType::QObjectStar, QMetaType::Int, QMetaType::Int,   23,   25,   26,
    QMetaType::QString, QMetaType::QObjectStar, QMetaType::Int,   23,   25,
    QMetaType::QString, QMetaType::QObjectStar,   23,
    QMetaType::QString, QMetaType::QUrl,   29,
    QMetaType::QString, QMetaType::QUrl, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int,   29,   25,   26,   27,   28,
    QMetaType::QString, QMetaType::QUrl, QMetaType::Int, QMetaType::Int, QMetaType::Int,   29,   25,   26,   27,
    QMetaType::QString, QMetaType::QUrl, QMetaType::Int, QMetaType::Int,   29,   25,   26,
    QMetaType::QString, QMetaType::QUrl, QMetaType::Int,   29,   25,
    QMetaType::QString, QMetaType::QUrl,   29,
    QMetaType::Int,
    QMetaType::UInt,
    QMetaType::Void, QMetaType::UInt,   33,

 // methods: parameters
    QMetaType::QString,
    QMetaType::QString,

 // properties: name, type, flags
      35, QMetaType::Int, 0x00095001,
      36, QMetaType::UInt, 0x00495003,
      37, QMetaType::UInt, 0x00095003,
      38, QMetaType::UInt, 0x00095003,
      39, QMetaType::Bool, 0x00095103,
      40, QMetaType::QVariantList, 0x00095103,

 // properties: notify_signal_id
       0,
       2,
       0,
       0,
       0,
       0,

 // enums: name, alias, flags, count, data
      41,   41, 0x0,   19,  385,
      61,   61, 0x0,    2,  423,
      64,   64, 0x0,    2,  427,

 // enum data: key, value
      42, uint(QZXing::DecoderFormat_None),
      43, uint(QZXing::DecoderFormat_Aztec),
      44, uint(QZXing::DecoderFormat_CODABAR),
      45, uint(QZXing::DecoderFormat_CODE_39),
      46, uint(QZXing::DecoderFormat_CODE_93),
      47, uint(QZXing::DecoderFormat_CODE_128),
      48, uint(QZXing::DecoderFormat_DATA_MATRIX),
      49, uint(QZXing::DecoderFormat_EAN_8),
      50, uint(QZXing::DecoderFormat_EAN_13),
      51, uint(QZXing::DecoderFormat_ITF),
      52, uint(QZXing::DecoderFormat_MAXICODE),
      53, uint(QZXing::DecoderFormat_PDF_417),
      54, uint(QZXing::DecoderFormat_QR_CODE),
      55, uint(QZXing::DecoderFormat_RSS_14),
      56, uint(QZXing::DecoderFormat_RSS_EXPANDED),
      57, uint(QZXing::DecoderFormat_UPC_A),
      58, uint(QZXing::DecoderFormat_UPC_E),
      59, uint(QZXing::DecoderFormat_UPC_EAN_EXTENSION),
      60, uint(QZXing::DecoderFormat_CODE_128_GS1),
      62, uint(QZXing::TryHarderBehaviour_ThoroughScanning),
      63, uint(QZXing::TryHarderBehaviour_Rotate),
      65, uint(QZXing::SourceFilter_ImageNormal),
      66, uint(QZXing::SourceFilter_ImageInverted),

       0        // eod
};

void QZXing::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<QZXing *>(_o);
        (void)_t;
        switch (_id) {
        case 0: _t->decodingStarted(); break;
        case 1: _t->decodingFinished((*reinterpret_cast< bool(*)>(_a[1]))); break;
        case 2: _t->enabledFormatsChanged(); break;
        case 3: _t->tagFound((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 4: _t->tagFoundAdvanced((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])),(*reinterpret_cast< const QString(*)>(_a[3]))); break;
        case 5: _t->tagFoundAdvanced((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])),(*reinterpret_cast< const QString(*)>(_a[3])),(*reinterpret_cast< const QRectF(*)>(_a[4]))); break;
        case 6: _t->tagFoundAdvanced((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< const QString(*)>(_a[2])),(*reinterpret_cast< const QString(*)>(_a[3])),(*reinterpret_cast< const QVariantMap(*)>(_a[4]))); break;
        case 7: _t->error((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 8: { QString _r = _t->decodeImage((*reinterpret_cast< const QImage(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])),(*reinterpret_cast< int(*)>(_a[3])),(*reinterpret_cast< bool(*)>(_a[4])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 9: { QString _r = _t->decodeImage((*reinterpret_cast< const QImage(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])),(*reinterpret_cast< int(*)>(_a[3])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 10: { QString _r = _t->decodeImage((*reinterpret_cast< const QImage(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 11: { QString _r = _t->decodeImage((*reinterpret_cast< const QImage(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 12: { QString _r = _t->decodeImageFromFile((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])),(*reinterpret_cast< int(*)>(_a[3])),(*reinterpret_cast< bool(*)>(_a[4])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 13: { QString _r = _t->decodeImageFromFile((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])),(*reinterpret_cast< int(*)>(_a[3])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 14: { QString _r = _t->decodeImageFromFile((*reinterpret_cast< const QString(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 15: { QString _r = _t->decodeImageFromFile((*reinterpret_cast< const QString(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 16: { QString _r = _t->decodeImageQML((*reinterpret_cast< QObject*(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 17: { QString _r = _t->decodeSubImageQML((*reinterpret_cast< QObject*(*)>(_a[1])),(*reinterpret_cast< const int(*)>(_a[2])),(*reinterpret_cast< const int(*)>(_a[3])),(*reinterpret_cast< const int(*)>(_a[4])),(*reinterpret_cast< const int(*)>(_a[5])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 18: { QString _r = _t->decodeSubImageQML((*reinterpret_cast< QObject*(*)>(_a[1])),(*reinterpret_cast< const int(*)>(_a[2])),(*reinterpret_cast< const int(*)>(_a[3])),(*reinterpret_cast< const int(*)>(_a[4])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 19: { QString _r = _t->decodeSubImageQML((*reinterpret_cast< QObject*(*)>(_a[1])),(*reinterpret_cast< const int(*)>(_a[2])),(*reinterpret_cast< const int(*)>(_a[3])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 20: { QString _r = _t->decodeSubImageQML((*reinterpret_cast< QObject*(*)>(_a[1])),(*reinterpret_cast< const int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 21: { QString _r = _t->decodeSubImageQML((*reinterpret_cast< QObject*(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 22: { QString _r = _t->decodeImageQML((*reinterpret_cast< const QUrl(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 23: { QString _r = _t->decodeSubImageQML((*reinterpret_cast< const QUrl(*)>(_a[1])),(*reinterpret_cast< const int(*)>(_a[2])),(*reinterpret_cast< const int(*)>(_a[3])),(*reinterpret_cast< const int(*)>(_a[4])),(*reinterpret_cast< const int(*)>(_a[5])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 24: { QString _r = _t->decodeSubImageQML((*reinterpret_cast< const QUrl(*)>(_a[1])),(*reinterpret_cast< const int(*)>(_a[2])),(*reinterpret_cast< const int(*)>(_a[3])),(*reinterpret_cast< const int(*)>(_a[4])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 25: { QString _r = _t->decodeSubImageQML((*reinterpret_cast< const QUrl(*)>(_a[1])),(*reinterpret_cast< const int(*)>(_a[2])),(*reinterpret_cast< const int(*)>(_a[3])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 26: { QString _r = _t->decodeSubImageQML((*reinterpret_cast< const QUrl(*)>(_a[1])),(*reinterpret_cast< const int(*)>(_a[2])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 27: { QString _r = _t->decodeSubImageQML((*reinterpret_cast< const QUrl(*)>(_a[1])));
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 28: { int _r = _t->getProcessTimeOfLastDecoding();
            if (_a[0]) *reinterpret_cast< int*>(_a[0]) = std::move(_r); }  break;
        case 29: { uint _r = _t->getEnabledFormats();
            if (_a[0]) *reinterpret_cast< uint*>(_a[0]) = std::move(_r); }  break;
        case 30: _t->setDecoder((*reinterpret_cast< const uint(*)>(_a[1]))); break;
        case 31: { QString _r = _t->foundedFormat();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        case 32: { QString _r = _t->charSet();
            if (_a[0]) *reinterpret_cast< QString*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (QZXing::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&QZXing::decodingStarted)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (QZXing::*)(bool );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&QZXing::decodingFinished)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (QZXing::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&QZXing::enabledFormatsChanged)) {
                *result = 2;
                return;
            }
        }
        {
            using _t = void (QZXing::*)(QString );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&QZXing::tagFound)) {
                *result = 3;
                return;
            }
        }
        {
            using _t = void (QZXing::*)(const QString & , const QString & , const QString & ) const;
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&QZXing::tagFoundAdvanced)) {
                *result = 4;
                return;
            }
        }
        {
            using _t = void (QZXing::*)(const QString & , const QString & , const QString & , const QRectF & ) const;
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&QZXing::tagFoundAdvanced)) {
                *result = 5;
                return;
            }
        }
        {
            using _t = void (QZXing::*)(const QString & , const QString & , const QString & , const QVariantMap & ) const;
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&QZXing::tagFoundAdvanced)) {
                *result = 6;
                return;
            }
        }
        {
            using _t = void (QZXing::*)(QString );
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&QZXing::error)) {
                *result = 7;
                return;
            }
        }
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<QZXing *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< int*>(_v) = _t->getProcessTimeOfLastDecoding(); break;
        case 1: *reinterpret_cast< uint*>(_v) = _t->getEnabledFormats(); break;
        case 2: *reinterpret_cast< uint*>(_v) = _t->getTryHarderBehaviour(); break;
        case 3: *reinterpret_cast< uint*>(_v) = _t->getSourceFilterType(); break;
        case 4: *reinterpret_cast< bool*>(_v) = _t->getTryHarder(); break;
        case 5: *reinterpret_cast< QVariantList*>(_v) = _t->getAllowedExtensions(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<QZXing *>(_o);
        (void)_t;
        void *_v = _a[0];
        switch (_id) {
        case 1: _t->setDecoder(*reinterpret_cast< uint*>(_v)); break;
        case 2: _t->setTryHarderBehaviour(*reinterpret_cast< uint*>(_v)); break;
        case 3: _t->setSourceFilterType(*reinterpret_cast< uint*>(_v)); break;
        case 4: _t->setTryHarder(*reinterpret_cast< bool*>(_v)); break;
        case 5: _t->setAllowedExtensions(*reinterpret_cast< QVariantList*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

QT_INIT_METAOBJECT const QMetaObject QZXing::staticMetaObject = { {
    QMetaObject::SuperData::link<QObject::staticMetaObject>(),
    qt_meta_stringdata_QZXing.data,
    qt_meta_data_QZXing,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *QZXing::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *QZXing::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_QZXing.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int QZXing::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 33)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 33;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 33)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 33;
    }
#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 6;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 6;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void QZXing::decodingStarted()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void QZXing::decodingFinished(bool _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}

// SIGNAL 2
void QZXing::enabledFormatsChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}

// SIGNAL 3
void QZXing::tagFound(QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 3, _a);
}

// SIGNAL 4
void QZXing::tagFoundAdvanced(const QString & _t1, const QString & _t2, const QString & _t3)const
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))), const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t2))), const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t3))) };
    QMetaObject::activate(const_cast< QZXing *>(this), &staticMetaObject, 4, _a);
}

// SIGNAL 5
void QZXing::tagFoundAdvanced(const QString & _t1, const QString & _t2, const QString & _t3, const QRectF & _t4)const
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))), const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t2))), const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t3))), const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t4))) };
    QMetaObject::activate(const_cast< QZXing *>(this), &staticMetaObject, 5, _a);
}

// SIGNAL 6
void QZXing::tagFoundAdvanced(const QString & _t1, const QString & _t2, const QString & _t3, const QVariantMap & _t4)const
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))), const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t2))), const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t3))), const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t4))) };
    QMetaObject::activate(const_cast< QZXing *>(this), &staticMetaObject, 6, _a);
}

// SIGNAL 7
void QZXing::error(QString _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(std::addressof(_t1))) };
    QMetaObject::activate(this, &staticMetaObject, 7, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
