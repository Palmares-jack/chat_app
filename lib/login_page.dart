import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:social_media_buttons/social_media_buttons.dart';
import 'package:chat_app/utils/spaces.dart';
import 'package:chat_app/utils/textfield_styles.dart';
import 'package:chat_app/widgets/login_text_field.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final String _mainUrl = "https://poojabhaumik.com";

  void loginUser(BuildContext context) {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      print("Username: ${userNameController.text}");
      print("Password: ${passwordController.text}");

      Navigator.pushReplacementNamed(
        context,
        '/chat',
        arguments: userNameController.text,
      );

      print('Login successful!');
    } else {
      print('Login failed.');
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
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Let\'s sign you in!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              verticalSpacing(12),
              Text(
                'Welcome back!\nYou\'ve been missed!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                  color: Colors.blueGrey,
                ),
              ),
              verticalSpacing(24),
              Image.asset(
                'assets/illustration.png',
                height: 200,
              ),
              verticalSpacing(24),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    LoginTextField(
                      hintText: "Enter your username",
                      validator: (value) {
                        if (value != null && value.isEmpty) {
                          return "Please type your username";
                        } else if (value != null && value.length < 5) {
                          return "Your username should be more than 5 characters";
                        }
                        return null;
                      },
                      controller: userNameController,
                    ),
                    verticalSpacing(24),
                    LoginTextField(
                      hasAsterisks: true,
                      controller: passwordController,
                      hintText: 'Enter your password',
                    ),
                  ],
                ),
              ),
              verticalSpacing(24),
              ElevatedButton(
                onPressed: () => loginUser(context),
                child: Text(
                  'Login',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
                ),
              ),
              verticalSpacing(24),
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
              verticalSpacing(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialMediaButton.facebook(
                    size: 20,
                    color: Colors.blue,
                    url: "https://www.facebook.com/share/1BPmT72qMA/",
                  ),
                  SizedBox(width: 12),
                  SocialMediaButton.linkedin(
                    url:
                    "https://www.linkedin.com/in/alvic-caranzo-b724a4170/",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
