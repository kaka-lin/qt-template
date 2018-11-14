from PyQt5 import QtCore, QtGui, QtWidgets
from PyQt5.QtWidgets import QFileDialog, QSizePolicy

class Ui_HelloBox(object):
    def setupUi(self, helloBox):
        helloBox.setObjectName("helloBox")

        self.gridLayout = QtWidgets.QGridLayout(helloBox)
        self.gridLayout.setHorizontalSpacing(12)
        self.gridLayout.setVerticalSpacing(12)

        self.button = QtWidgets.QPushButton(helloBox)
        self.button.setObjectName("button")
        self.label = QtWidgets.QLabel(helloBox)
        self.label.setObjectName("label")

        self.gridLayout.addWidget(self.label, 0, 0, 1, 1)
        self.gridLayout.addWidget(self.button, 0, 1, 1, 1)
        
        self.retranslateUi(helloBox)

        self.button.clicked.connect(helloBox.onClick)

    def retranslateUi(self, helloBox):
        _translate = QtCore.QCoreApplication.translate
        helloBox.setTitle(_translate("helloBox", "Hello Box"))
        self.button.setText(_translate("VideoBox", "Button"))
        self.label.setText(_translate("helloBox", "Hello World"))
