import 'package:flutter/material.dart';

class CounterStateful extends StatefulWidget {
  final Color buttonColor;

  const CounterStateful({Key? key, required this.buttonColor}) : super(key: key);

  @override
  State<CounterStateful> createState() => _CounterStatefulState();
}

class _CounterStatefulState extends State<CounterStateful> {
  int counter = 0;

  void increment() {
    setState(() {
      counter++;
    });
    print(counter);
  }

  @override
  void initState() {
    super.initState();
    // Add any initialization code here if needed
  }

  @override
  void dispose() {
    // Add any cleanup code here if needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: widget.buttonColor,
        onPressed: increment,
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Text(
          '$counter',
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
