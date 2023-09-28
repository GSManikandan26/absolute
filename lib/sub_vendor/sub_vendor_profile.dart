import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SubVendorProfileScreen extends StatefulWidget {
  const SubVendorProfileScreen({Key? key});

  @override
  _SubVendorProfileScreenState createState() => _SubVendorProfileScreenState();
}

class _SubVendorProfileScreenState extends State<SubVendorProfileScreen> {
  final TextEditingController _nameController =
  TextEditingController(text: "John Doe");
  final TextEditingController _phoneNumberController =
  TextEditingController(text: "+1234567890");
  final TextEditingController _emailController =
  TextEditingController(text: "john@example.com");

  final bool _isEditingName = false;
  final bool _isEditingPhoneNumber = false;
  final bool _isEditingEmail = false;

  // Variables to store the edited values

  @override
  void initState() {
    super.initState();
    // Initialize edited values with the initial values
  }

  @override
  Widget build(BuildContext context) {
    const Color customColor = Color.fromRGBO(33, 84, 115, 1.0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        backgroundColor:  Colors.white,),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade200, // Background color for the container
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 30.0,bottom: 20.0,left: 15.0,right: 15.0),
          child: Center(
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0), // Curved border radius for the card
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const Center(
                        child: Text(
                          'Profile',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: customColor,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      ClipOval(
                        child: Lottie.asset(
                          'images/profile.json', // Replace with your animation file path
                          width: 80,
                          height: 80,
                        ),
                      ),
                      const SizedBox(height: 30.0),
                      buildEditableField(
                        title: 'Name',
                        isEditing: _isEditingName,
                        controller: _nameController,
                      ),
                      const SizedBox(height: 15.0),
                      buildEditableField(
                        title: 'Phone Number',
                        isEditing: _isEditingPhoneNumber,
                        controller: _phoneNumberController,
                      ),
                      const SizedBox(height: 15.0),
                      buildEditableField(
                        title: 'Email',
                        isEditing: _isEditingEmail,
                        controller: _emailController,
                      ),
                      const SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () async {
                              // Handle login logic here
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
                              'Save',
                              style: TextStyle(color: Colors.white),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildEditableField({
    required String title,
    required bool isEditing,
    required TextEditingController controller,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        ),
        const SizedBox(height: 5),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.transparent, width: 0),
            color: const Color.fromARGB(255, 241, 241, 241),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  enabled: isEditing,
                  controller: controller,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: title,
                    hintStyle: const TextStyle(color: Colors.grey),
                  ),
                ),
              ),
              if (!isEditing)
                const IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                  onPressed: null, // Removed onPressed
                ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneNumberController.dispose();
    _emailController.dispose();
    super.dispose();
  }
}

