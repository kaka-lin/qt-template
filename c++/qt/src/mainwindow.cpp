#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);

    connect(ui->pushButton, &QPushButton::clicked, this, &MainWindow::btnClicked);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::btnClicked()
{
    ui->pushButton->setText(tr("Button clicked"));
}
