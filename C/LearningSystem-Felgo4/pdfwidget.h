#ifndef PDFWIDGET_H
#define PDFWIDGET_H

#include <QWidget>

namespace Ui {
class PdfWidget;
}

class PdfWidget : public QWidget
{
    Q_OBJECT

public:
    explicit PdfWidget(QWidget *parent = nullptr);
    ~PdfWidget();

private:
    Ui::PdfWidget *ui;
};

#endif // PDFWIDGET_H
