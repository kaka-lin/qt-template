# QML Template

## Require

- Python3+
- Pyside2

## Usage

```bash
python3 qt_template.py
```

## Packaging

if you want to packing Python programs into ```stand-alone executables```

1. Converting ```*.qrc``` (a collection of resource) files into ```*.py``` (Python source) file

    ```bash
    $ pyside2-rcc -o src/qml.py src/resources/qml.qrc

    $ pyside2-rcc -o src/components.py src/resources/components/components.qrc
    ```

2. Testing 

    Add ```prod``` argument to run freeze mode

    ```bash
    python3 qt_template.py prod
    ```
