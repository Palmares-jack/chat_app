import 'package:flutter/material.dart';

class CounterStateful extends StatefulWidget {
  final Color buttonColor;

  const CounterStateful({Key? key, required this.buttonColor}) : super(key: key);

  @override
  State<CounterStateful> createState() => _CounterStatefulState();
}

class _CounterStatefulState extends State<CounterStateful> {
  int _counter = 0;

  void _increment() {
    setState(() {
      _counter++;
    });
    debugPrint('Counter: $_counter');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: widget.buttonColor,
        onPressed: _increment,
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          '$_counter',
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
