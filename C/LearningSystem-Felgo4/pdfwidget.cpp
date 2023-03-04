#include "pdfwidget.h"
#include "ui_pdfwidget.h"

PdfWidget::PdfWidget(QWidget *parent) :
    QWidget(parent),
    ui(new Ui::PdfWidget)
{
    ui->setupUi(this);
}

PdfWidget::~PdfWidget()
{
    delete ui;
}
