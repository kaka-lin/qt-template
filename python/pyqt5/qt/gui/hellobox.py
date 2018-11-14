
from PyQt5 import QtCore, QtGui, QtWidgets

from gui.ui_hellobox import Ui_HelloBox

class HelloBox(QtWidgets.QGroupBox):
    """  Template box """
    def __init__(self, parent=None):
        super(HelloBox, self).__init__(parent)

        self.ui = Ui_HelloBox()
        self.ui.setupUi(self)
        self._setup_ui()

    def _setup_ui(self):
        """ """
    
    def onClick(self):
        """ """
        self.ui.label.setText("Button clicked")
