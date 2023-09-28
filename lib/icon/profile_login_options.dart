import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../animatedbox/login.dart';
import '../animatedbox/ownerlogin.dart';
import '../animatedbox/userlogin.dart';
import '../usable/style.dart';

class LoginOptionsContents extends StatelessWidget {
  const LoginOptionsContents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.close, color: Colors.black),
          ),
        ],
      ),
      body: Center(
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          margin: const EdgeInsets.all(16), // Add margin to the card
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0), // Add padding to the content
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Join',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromRGBO(33, 84, 115, 1.0),
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Center(
                    child: Text(
                      'If you are not logged in and click on the owner or user',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color.fromRGBO(33, 84, 115, 1.0),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        _showAnimatedDialog(context, const UserLoginForm());
                      },
                      style: Style().btnStyle(
                        btnColor: Colors.white,
                        btnWidth: Get.width / 2,
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.person,
                            color: Color.fromRGBO(33, 84, 115, 1.0),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Join as User',
                            style: TextStyle(
                              color: Color.fromRGBO(33, 84, 115, 1.0),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Center(
                    child: Text(
                      'OR',
                      style: TextStyle(
                        color: Color.fromRGBO(33, 84, 115, 1.0),
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    height: 100,
                    child: ElevatedButton(
                      onPressed: () {
                        _showAnimatedDialog(context, const OwnerLoginForm());
                      },
                      style: Style().btnStyle(
                        btnColor: Colors.white,
                        btnWidth: Get.width / 2,
                      ),
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.business,
                            color: Color.fromRGBO(33, 84, 115, 1.0),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Join as Owner',
                            style: TextStyle(
                              color: Color.fromRGBO(33, 84, 115, 1.0),
                              fontSize: 18,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () {
                      _showAnimatedDialog(context, const LoginScreen());
                    },
                    child: const Text(
                      "Already have login? Click here To Login",
                      style: TextStyle(
                        color: Color.fromRGBO(33, 84, 115, 1.0),
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showAnimatedDialog(BuildContext context, Widget val) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Dialog(
            backgroundColor: Colors.transparent,
            child: val,
          ),
        );
      },
    );
  }
}
