import 'package:flutter/material.dart';

// CounterStateful Widget
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

// LoginPage Widget
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  void loginUser() {
    print('Login successful!');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Let\'s sign you in!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.brown,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Welcome back! \nYou\'ve been missed!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.blueGrey,
                ),
              ),
              const SizedBox(height: 20),
              Image.network(
                'https://3009709.youcanlearnit.net/Alien_LIL_131338.png',
                height: 200,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: loginUser,
                child: const Text(
                  'Click me!',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w300),
                ),
              ),
              TextButton(
                onPressed: () {
                  print('Pressed on the URL!');
                },
                child: const Text('https://google.com'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
