import sys
from PyQt5.QtCore import QTranslator, QLocale
from PyQt5.QtWidgets import QApplication
from gui.mainwindow import MainWindow

def run():
    
    translator = QTranslator()
    #translator.load(QLocale, 'main', '_', './i18n')
    
    app = QApplication(sys.argv)

    main_window = MainWindow(app, translator)
    main_window.show()

    sys.exit(app.exec_())

if __name__ == '__main__':
    run()
