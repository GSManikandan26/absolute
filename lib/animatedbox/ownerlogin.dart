import 'package:absolute/usable/input_field.dart';
import 'package:absolute/usable/style.dart';
import 'package:flutter/material.dart';

import '../usable/TextField.dart';

class OwnerLoginForm extends StatefulWidget {
  const OwnerLoginForm({Key? key});

  @override
  _OwnerLoginFormState createState() => _OwnerLoginFormState();
}

class _OwnerLoginFormState extends State<OwnerLoginForm> {
  double _dialogHeight = 0.0;
  final double _dialogWidth = 400;
  Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);

  final TextEditingController _phoneNumberController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        _dialogHeight = 800; // Set your preferred height
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Style style = Style();
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
                    'Owner Login',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    'Experience luxury and comfort at our hotel rooms, where your relaxation is our priority.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              InputField(
                title: 'Owner Name',
                isSecured: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Owner Name is required';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              InputField(
                title: 'Owner Email',
                isSecured: false,
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@') || !value.contains('.')) {
                    return 'Enter a valid email address';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CustomTextField(
                title: 'Phone Number',
                controller: _phoneNumberController,
                isSecured: false,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length != 10) {
                    return 'Enter a valid 10-digit phone number';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(
                height: 20,
              ),
              InputField(
                title: 'Address',
                isSecured: false,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Address is required';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              InputField(
                title: 'Password',
                isSecured: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  }
                  if (value.length < 8 ||
                      !value.contains(RegExp(r'[A-Za-z]')) ||
                      !value.contains(RegExp(r'[0-9]')) ||
                      !value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
                    return 'Password must be at least 8 characters long and contain at least one letter, one digit, and one special character';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              InputField(
                title: 'Re-Enter Password',
                isSecured: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Re-enter your password';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await Future.delayed(const Duration(milliseconds: 50), () {
                        setState(() {
                          _dialogHeight = 0;
                        });
                      });
                      await Future.delayed(const Duration(milliseconds: 450));
                      Navigator.of(context).pop();
                    },
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
                    child: Text(
                      'Register',
                      style: style.txtStyle(txtColor: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
