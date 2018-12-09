import os
import sys

from PyQt5.QtQml import QQmlApplicationEngine
from PyQt5.QtCore import QCoreApplication, QUrl, Qt

from src import qml, components

def run(app, dir_name, mode):
    # Create QML engine
    engine = QQmlApplicationEngine()
    context = engine.rootContext()

    if mode == "prod":
        engine.addImportPath('qrc:/')
        engine.load(QUrl('qrc:/main.qml'))
    else:
        engine.addImportPath(os.path.join(dir_name, "src/resources"))
        engine.load(QUrl(os.path.join(dir_name, "src/resources/main.qml")))

    engine.quit.connect(app.quit)
    sys.exit(app.exec_())
