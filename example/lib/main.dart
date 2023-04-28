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
}
