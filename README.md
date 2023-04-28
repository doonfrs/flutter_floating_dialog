## Floating Dialog for Flutter
A Flutter package for creating draggable dialogs, allowing users to easily move and interact with content on the screen

![Floating Dialog Usage Example](https://github.com/doonfrs/flutter_floating_dialog/blob/main/example/assets/example.gif?raw=true
)


### Features
- Simple and minimal, you can use it to create a draggable dialog in just a few lines of code.
- Customizable dialog content: Users can add any type of widget to the dialog, allowing for a wide range of use cases.
- Simple API: The package provides an easy-to-use API for creating and controlling draggable dialogs.
- Animated opacity: The opacity of the dialog can be animated during dragging to provide visual feedback to users.

### Installation
To use this package, add floating_dialog as a dependency in your pubspec.yaml file.
```yaml
dependencies:
  floating_dialog: <latest version>
```
Then, run flutter packages get in your terminal.

### Usage
Import the package into your Dart file:
```dart
import 'package:floating_dialog/floating_dialog.dart';
```
Create a Floating widget inside Stack widget, show and hide it using a boolean variable:

```dart
  bool _showDialog = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(widget.title),
        ),
        body: Stack(
          children: [
            Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    _showDialog = true;
                  });
                },
                child: const Text('Show Dialog'),
              ),
            ),
            if (_showDialog)
              FloatingDialog(
                  onClose: () {
                    setState(() {
                      _showDialog = false;
                    });
                  },
                  child: const SizedBox(
                      height: 200,
                      width: 300,
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: Text('Dialog Title')))),
          ],
        ));
  }

```


### Developer
This package is developed by Feras Abdalrahman doonfrs@gmail.com trinavo.com.

### License
```
This package is released under the MIT license.
MIT License

Copyright (c) 2023 FERAS ABDALRAHMAN

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
```
