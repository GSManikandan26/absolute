import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import 'PropertyListingPage.dart';

class PropertyTypePage extends StatefulWidget {
  const PropertyTypePage({super.key});

  @override
  _PropertyTypePageState createState() => _PropertyTypePageState();
}

class _PropertyTypePageState extends State<PropertyTypePage> {
  Color customColor = const Color.fromRGBO(33, 84, 115, 1.0);
  // Create a map to store the selected options for each question
  Map<String, List<String>> selectedOptions = {
    'Type of Your Property': [], // Existing question
    'Property Features:': [], // New question 1
    'Number of Bedrooms:': [], // New question 2
    'Number of BHK (Bedrooms, Hall, Kitchen):': [],
    'Security Features:': [],
    'Additional Amenities:': [],
    'Payment Methods Accepted:': [],
    // New question 3
    // Add more questions here as needed
  };

  // Define a list of questions and their corresponding options
  List<Map<String, List<String>>> questions = [
    {
      'Type of Your Property': [
        'Serviced Apartments',
        'Pay Guest Rooms',
        'Commercial Space',
        'Resort',
      ],
    },
    {
      'Property Features:': ['Swimming Pool', 'Gym', 'Parking', 'Balcony/Patio'],
    },
    {
      'Additional Features:': ['Wi-Fi', 'Laundry Facilities', 'Pets Allowed', 'Air Conditioning'],
    },
    {
      'Number of BHK (Bedrooms, Hall, Kitchen):': ['1 BHK', '2 BHK', '3 BHK', '4 BHK'],
    },
    {
      'Security Features:': ['Gated Community', 'Security Cameras', 'Security Cameras'],
    },
    {
      'Additional Amenities:': ['Breakfast Included', 'Airport Shuttle', 'Conference Room','Party space'],
    },
    {
      'Payment Methods Accepted:': ['Cash', 'Card', 'Online Payments'],
    },
    // Add more questions here as needed
  ];
  TextEditingController detailsController = TextEditingController();

  int currentQuestionIndex = 0;
  int _currentIndex = 0; // For bottom navigation bar

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  // Function to clear all selected checkboxes and text field
  void clearSelection() {
    setState(() {
      selectedOptions.forEach((key, value) {
        value.clear();
      });
      detailsController.clear(); // Clear the text field
    });
  }

  // Function to show a success dialog
  void showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Done!'),
          content: const Text('Your responses have been submitted successfully.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const PropertyListingPage()),
                      (Route<dynamic> route) => false,
                );
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    // Dispose of the controller when it's no longer needed to avoid memory leaks
    detailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final questionMap = questions[currentQuestionIndex];
    final question = questionMap.keys.first;

    return Scaffold(
      appBar: AppBar(
          title: const Text('Property Type'),
          centerTitle: true,
        backgroundColor:  Colors.white,),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var i = 0; i < questions.length; i++)
                Card(
                  elevation: 5.0,
                  color: Colors.grey.shade200,
                  margin: const EdgeInsets.only(bottom: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          questions[i].keys.first,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Column(
                          children: questions[i].values.first.map((option) {
                            return CheckboxListTile(
                              title: Text(option),
                              value: selectedOptions[question]!.contains(option),
                              onChanged: (bool? value) {
                                setState(() {
                                  if (value != null) {
                                    if (value) {
                                      selectedOptions[question]!.add(option);
                                    } else {
                                      selectedOptions[question]!.remove(option);
                                    }
                                  }
                                });
                              },
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              // Add this code inside your Column widget where you define the questions and options
              Card(
                elevation: 5.0,
                color: Colors.grey.shade200,
                margin: const EdgeInsets.only(bottom: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'More Details About the Property',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Please provide more details about the property',
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.black, width: 0),
                          color: const Color.fromARGB(255, 241, 241, 241),
                        ),
                        child: TextFormField(
                          controller: detailsController, // Assign the controller
                          maxLines: 5,
                          maxLength: 100,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Write here...',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50.0,
            vertical: 10.0,
          ),
          child: GNav(
            gap: 8,
            backgroundColor: Colors.white,
            color: Colors.black,
            activeColor: customColor,
            tabBackgroundColor: Colors.grey.shade300,
            onTabChange: _onTabTapped, // Sync tab change with page change
            selectedIndex: _currentIndex, // Set the active index
            padding: const EdgeInsets.all(16),
            tabs: [
              GButton(
                icon: Icons.clear,
                text: 'Clear',
                onPressed: clearSelection,
              ),
              GButton(
                icon: Icons.send,
                text: 'Submit',
                onPressed: () {
                  showSuccessDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}