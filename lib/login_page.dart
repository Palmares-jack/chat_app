import 'package:flutter/material.dart';
import 'package:chat_app/chat_page.dart';
import 'package:chat_app/utils/spaces.dart';
import 'package:chat_app/widgets/login_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _loginUser() {
    if (_formKey.currentState?.validate() ?? false) {
      final username = _userNameController.text.trim();
      Navigator.pushReplacementNamed(
        context,
        '/chat',
        arguments: username,
      );
    } else {
      debugPrint('Form validation failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Let’s sign you in!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                verticalSpacing(10),
                const Text(
                  'Welcome back!\nYou’ve been missed!',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.blueGrey),
                ),
                verticalSpacing(20),
                Image.asset(
                  'assets/illustration.png',
                  height: 200,
                ),
                verticalSpacing(20),
                LoginTextField(
                  controller: _userNameController,
                  hintText: 'Enter your username',
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Please enter a username';
                    if (v.length < 5) return 'Username must be at least 5 characters';
                    return null;
                  },
                ),
                verticalSpacing(24),
                LoginTextField(
                  controller: _passwordController,
                  hintText: 'Enter your password',
                  hasAsterisks: true,
                  validator: (v) {
                    if (v == null || v.isEmpty) return 'Please enter a password';
                    return null;
                  },
                ),
                verticalSpacing(24),
                ElevatedButton(
                  onPressed: _loginUser,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text('Login', style: TextStyle(fontSize: 24)),
                  ),
                ),
                verticalSpacing(16),
                InkWell(
                  splashColor: Colors.red,
                  onTap: () => debugPrint('Link clicked!'),
                  onDoubleTap: () => debugPrint('Double tapped!'),
                  onLongPress: () => debugPrint('Long pressed!'),
                  child: Column(
                    children: const [
                      Text('Find us on'),
                      SizedBox(height: 4),
                      Text(
                        'https://google.com',
                        style: TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
