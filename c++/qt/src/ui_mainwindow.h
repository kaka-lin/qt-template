#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include<QtWidgets/QMainWindow>
#include<QtWidgets/QWidget>
#include<QtWidgets/QApplication>
#include <QtWidgets/QPushButton>

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QWidget *centralwidget;
    QPushButton *pushButton;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QStringLiteral("MainWindow"));
        MainWindow->resize(640, 480);

        centralwidget = new QWidget(MainWindow);
        centralwidget->setObjectName(QStringLiteral("centralwidget"));
        pushButton = new QPushButton(centralwidget);
        pushButton->setObjectName(QStringLiteral("pushButton"));
        pushButton->setGeometry(QRect(50, 220, 150, 60));
        MainWindow->setCentralWidget(centralwidget);

        retranslateUi(MainWindow);
    }

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QApplication::translate("MainWindow", "MainWindow", Q_NULLPTR));
        pushButton->setText(QApplication::translate("Mainwindow", "Button", Q_NULLPTR));
    }
};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
}

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
