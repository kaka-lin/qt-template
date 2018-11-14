import os
import sys
from PySide2.QtWidgets import QMainWindow, QFileDialog
from gui.ui_mainwindow import Ui_MainWindow
from gui.hellotab import HelloTab

class MainWindow(QMainWindow):
    def __init__ (self, app, translator, parent=None):
        super(MainWindow, self).__init__(parent)

        self._app = app
        self._translator = translator
        app.installTranslator(translator)

        self.ui = Ui_MainWindow()
        self.ui.setupUi(self)
        self._setup_ui()
    
    def _setup_ui(self):
        ''' '''
        self._tab = HelloTab(self.ui.tab)
    
    def openFile(self):
        dir = os.path.dirname(__file__)
        file_name = QFileDialog.getOpenFileName(self, 'Open file', dir)
