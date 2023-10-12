import 'package:absolute/home/homepage.dart';
import 'package:absolute/usable/input_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  final TextEditingController _ownerNameController = TextEditingController();
  final TextEditingController _ownerEmailController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _reEnterPasswordController = TextEditingController();

  // String variables for storing input values
  String ownerName = '';
  String ownerEmail = '';
  String phoneNumber = '';
  String address = '';
  String password = '';
  String reEnterPassword = '';

  final _formkey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 50), () {
      setState(() {
        _dialogHeight = 800; // Set your preferred height
      });
    });

    // Add onChanged listeners to update string variables
    _ownerNameController.addListener(() {
      setState(() {
        ownerName = _ownerNameController.text;
      });
    });

    _ownerEmailController.addListener(() {
      setState(() {
        ownerEmail = _ownerEmailController.text;
      });
    });

    _phoneNumberController.addListener(() {
      setState(() {
        phoneNumber = _phoneNumberController.text;
      });
    });

    _addressController.addListener(() {
      setState(() {
        address = _addressController.text;
      });
    });

    _passwordController.addListener(() {
      setState(() {
        password = _passwordController.text;
      });
    });

    _reEnterPasswordController.addListener(() {
      setState(() {
        reEnterPassword = _reEnterPasswordController.text;
      });
    });
  }

  @override
  void dispose() {
    // Dispose of the controllers when the widget is disposed
    _ownerNameController.dispose();
    _ownerEmailController.dispose();
    _phoneNumberController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    _reEnterPasswordController.dispose();
    super.dispose();
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
            key: _formkey, // Assign the form key
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
                  controller: _ownerNameController,
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
                  controller: _ownerEmailController,
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
                  controller: _addressController,
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
                  controller: _passwordController,
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
                  controller: _reEnterPasswordController,
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
                        if (password != null && password.isNotEmpty) {
                          try {
                            UserCredential userCredential = await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(email: ownerEmail, password: password);
                            Fluttertoast.showToast(
                              msg: "Registered Successfully",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.black,
                              textColor: Colors.white,
                              fontSize: 20.0,
                            );
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const HomePage()),
                            );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              Fluttertoast.showToast(
                                msg: "Password Provided is too Weak",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                fontSize: 18.0,
                              );
                            } else if (e.code == "email-already-in-use") {
                              Fluttertoast.showToast(
                                msg: "Account Already exists",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.BOTTOM,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.black,
                                textColor: Colors.white,
                                fontSize: 18.0,
                              );
                            }
                          }
                        } else {
                          Fluttertoast.showToast(
                            msg: "Please Enter a Password",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            timeInSecForIosWeb: 1,
                            backgroundColor: Colors.black,
                            textColor: Colors.white,
                            fontSize: 20.0,
                          );
                        }
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
                      child: const Text(
                        'Register',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
