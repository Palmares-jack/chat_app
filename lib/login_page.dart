import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:chat_app/utils/spaces.dart';
import 'package:chat_app/utils/textfield_styles.dart';
import 'package:chat_app/widgets/login_text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final String _mainUrl = "https://poojabhaumik.com";

  void _login(BuildContext context) {
    if (userNameController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      debugPrint("Username: ${userNameController.text}");
      debugPrint("Password: ${passwordController.text}");

      Navigator.pushReplacementNamed(
        context,
        '/chat',
        arguments: userNameController.text,
      );

      debugPrint('Login successful!');
    } else {
      debugPrint('Login failed: Empty fields.');
    }
  }

  Future<void> _launchWebsite() async {
    final Uri url = Uri.parse(_mainUrl);
    if (!await launchUrl(url)) {
      throw 'Could not launch $_mainUrl';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
            ),
            verticalSpacing(24),
            LoginTextField(
              controller: userNameController,
              hintText: 'Enter your username',
            ),
            verticalSpacing(24),
            LoginTextField(
              hasAsterisks: true,
              controller: passwordController,
              hintText: 'Enter your password',
            ),
            verticalSpacing(32),
            ElevatedButton(
              onPressed: () => _login(context),
              child: Text('Login'),
            ),
            verticalSpacing(32),
            GestureDetector(
              onTap: _launchWebsite,
              child: Column(
                children: [
                  Text('Find us on'),
                  Text(
                    _mainUrl,
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
    );
  }
}
