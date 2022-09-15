# QML Template

## Require

- Python3+
- PyQt5+

## Usage

```bash
python3 qml_template.py
```

## Packaging

if you want to packing Python programs into ```stand-alone executables```

1. Converting ```*.qrc``` (a collection of resource) files into ```*.py``` (Python source) file

    ```bash
    $ pyrcc5 -o src/qml.py src/resources/qml.qrc

    $ pyrcc5 -o src/components.py src/resources/components/components.qrc
    ```

2. Testing

    Add ```prod``` argument to run freeze mode

    ```bash
    python3 qml_template.py prod
    ```
