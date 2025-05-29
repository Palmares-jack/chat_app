import 'package:flutter/material.dart';

class CounterStateful extends StatefulWidget {
  const CounterStateful({Key? key}) : super(key: key);

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
      floatingActionButton: FloatingActionButton(
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
