import 'package:absolute/animatedbox/login_options.dart';
import 'package:absolute/owner/dashboard.dart';
import 'package:absolute/sub_vendor/sub_vendor_homepage.dart';
import 'package:absolute/usable/input_field.dart';
import 'package:absolute/user/user_home.dart';
import 'package:flutter/material.dart';

import 'forgetpassword.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  double _dialogHeight = 0.0;
  final double _dialogWidth = 350;
  Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final bool _isLoggingIn = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        _dialogHeight = 450; // Set your preferred height
      });
    });
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty || !value.contains('@') || !value.contains('.')) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    return null;
  }

  void _loginUser(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      showDialog(
        context: context,
        barrierDismissible: false, // Prevent dialog dismissal while logging in
        builder: (BuildContext context) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      );

      String email = _emailController.text.trim();
      String password = _passwordController.text.trim();

      // Simulate a login delay (Replace this with your actual login logic)
      Future.delayed(const Duration(seconds: 2), () {
        Navigator.of(context).pop(); // Close the progress indicator dialog

        if (email == 'user@gmail.com' && password == 'user') {
          // Redirect to user-specific page
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const UserHomePage(), // Replace with your user page
            ),
          );
        }
        else if (email == 'owner@gmail.com' && password == 'owner') {
          // Redirect to owner-specific page
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => OwnerDashboard(), // Replace with your owner page
            ),
          );
        }
        else if (email == 'vendor@gmail.com' && password == 'vendor') {
          // Redirect to owner-specific page
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) =>  SubVendorHomePage(), // Replace with your owner page
            ),
          );
        }
        else {
          // Invalid email/password combination, show an error message
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Login Error'),
                content: const Text('Invalid email or password.'),
                actions: <Widget>[
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        }
      });
    }
  }

  void _showAnimatedDialog(BuildContext context, var val) {
    Navigator.of(context).pop(); // Close the current dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: val,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      height: _dialogHeight,
      width: _dialogWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0, right: 6, left: 6),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  actions: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(Icons.close, color: customColor),
                    ),
                  ],
                ),
                const Column(
                  children: [
                    Text(
                      'Login as User/Owner',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                InputField(
                  title: 'Email',
                  isSecured: false,
                  controller: _emailController,
                  validator: _validateEmail,
                ),
                const SizedBox(
                  height: 20,
                ),
                InputField(
                  title: 'Password',
                  isSecured: true,
                  controller: _passwordController,
                  validator: _validatePassword,
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> const ForgotPassword()));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(right: 24.0),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(
                        color: customColor,fontSize: 15,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _isLoggingIn
                        ? const CircularProgressIndicator() // Show the circular progress indicator
                        : ElevatedButton(
                      onPressed: () => _loginUser(context), // Pass context here
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              return const Color.fromRGBO(33, 37, 41, 1.0);
                            }
                            return const Color.fromRGBO(33, 84, 115, 1.0);
                          },
                        ),
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                TextButton(
                  onPressed: () async {
                    _showAnimatedDialog(context, const LoginOptions());
                  },
                  child: Text(
                    'New User? SignUp',
                    style: TextStyle(
                      color: customColor,
                    ),
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
