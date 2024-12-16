import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:floating_dialog/floating_dialog.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Floating Dialog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Floating Dialog'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _showDialog = true;
                      });
                    },
                    child: const Text('Show using stack'),
                  ),
                  const SizedBox(width: 20),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return FloatingDialog(
                                onDrag: (x, y) {
                                  if (kDebugMode) {
                                    print('x: $x, y: $y');
                                  }
                                },
                                onClose: () {
                                  Navigator.of(context).pop();
                                },
                                child: const SizedBox(
                                    height: 200,
                                    width: 300,
                                    child: Align(
                                        alignment: Alignment.topCenter,
                                        child: Text('Dialog Title'))));
                          });
                    },
                    child: const Text('Show using showDialog'),
                  ),
                ],
              ),
            ),
            if (_showDialog)
              FloatingDialog(
                  onDrag: (x, y) {
                    if (kDebugMode) {
                      print('x: $x, y: $y');
                    }
                  },
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
}
