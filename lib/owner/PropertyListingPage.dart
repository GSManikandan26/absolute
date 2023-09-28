import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'SuccessScreen.dart';
import 'UploadDetailsPage.dart';
import 'propertytype.dart';

class CardData {
  final String title;
  final String content;

  CardData({
    required this.title,
    required this.content,
  });
}

class PropertyListingPage extends StatefulWidget {
  const PropertyListingPage({super.key});

  @override
  _PropertyListingPageState createState() => _PropertyListingPageState();
}

class _PropertyListingPageState extends State<PropertyListingPage> {
  final List<CardData> steps = [
    CardData(
      title: "Step 1: Property Details",
      content: "Add property details here.",
    ),
    CardData(
      title: "Step 2: Property Type",
      content: "Select property type here.",
    ),
    CardData(
      title: "Step 3: Upload Photos",
      content: "Upload property photos here.",
    ),
    CardData(
      title: "Step 4: Complete Registration",
      content: "Review and complete the listing here.",
    ),
  ];

  List<File> imageFiles = [];




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('List Your Property'),
          centerTitle: true,
        backgroundColor:  Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              for (int i = 0; i < steps.length; i++)
                Card(
                  elevation: 5.0,
                  color: Colors.grey.shade200,
                  margin: const EdgeInsets.all(16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          steps[i].title,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Text(
                          steps[i].content,
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      if (i == 2) // Display uploaded images for the third card
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  for (int index = 0;
                                  index < imageFiles.length;
                                  index++)
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Stack(
                                        children: [
                                          Container(
                                            width: 100,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.black,
                                                width: 1,
                                              ),
                                            ),
                                            child: Image.file(
                                                imageFiles[index]), // Display the uploaded image
                                          ),
                                          Positioned(
                                            top: 0,
                                            right: 0,
                                            child: GestureDetector(
                                              onTap: () {
                                                // Remove the image when X is tapped
                                                setState(() {
                                                  imageFiles.removeAt(index);
                                                });
                                              },
                                              child: Container(
                                                decoration: const BoxDecoration(
                                                  color: Colors.transparent,
                                                  shape: BoxShape.circle,
                                                ),
                                                padding: const EdgeInsets.all(4),
                                                child: const Icon(
                                                  Icons.close,
                                                  size: 20,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            if (imageFiles.isNotEmpty) // Show plus icon button if at least one image is uploaded
                              Center(
                                child: ElevatedButton.icon(
                                  onPressed: () async {
                                    final picker = ImagePicker();
                                    final pickedImage = await picker.pickImage(
                                      source: ImageSource.gallery,
                                    );

                                    if (pickedImage != null) {
                                      setState(() {
                                        imageFiles
                                            .add(File(pickedImage.path));
                                      });
                                    }
                                  },
                                  style: ButtonStyle(
                                    backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                          (Set<MaterialState> states) {
                                        if (states
                                            .contains(MaterialState.pressed)) {
                                          return const Color.fromRGBO(
                                              33, 37, 41, 1.0);
                                        }
                                        return const Color.fromRGBO(
                                            33, 84, 115, 1.0);
                                      },
                                    ),
                                  ),
                                  icon: const Icon(Icons.add, color: Colors.white),
                                  label: const Text(
                                    "Add More",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      if (i == 2) // Display the "Upload Images" ElevatedButton
                        Center(
                          child: ElevatedButton.icon(
                            onPressed: () async {
                              final picker = ImagePicker();
                              final pickedImage = await picker.pickImage(
                                source: ImageSource.gallery,
                              );

                              if (pickedImage != null) {
                                setState(() {
                                  imageFiles.add(File(pickedImage.path));
                                });
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                  if (states
                                      .contains(MaterialState.pressed)) {
                                    return const Color.fromRGBO(
                                        33, 37, 41, 1.0);
                                  }
                                  return const Color.fromRGBO(33, 84, 115, 1.0);
                                },
                              ),
                            ),
                            icon: const Icon(Icons.image, color: Colors.white),
                            label: const Text(
                              "Upload Images",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      if (i == 0 || i == 1 || i == 3) // Display standard ElevatedButton for other cards
                        Center(
                          child: ElevatedButton(
                            onPressed: () async {
                              // Navigation logic for other cards
                              if (i == 0) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const UploadDetailsPage(),
                                  ),
                                );
                              } else if (i == 1) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const PropertyTypePage(),
                                  ),
                                );
                              } else if (i == 3) {
                                // Show a successful registration alert
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const SuccessScreen(),
                                  ),
                                );
                              }
                            },
                            style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                  if (states
                                      .contains(MaterialState.pressed)) {
                                    return const Color.fromRGBO(
                                        33, 37, 41, 1.0);
                                  }
                                  return const Color.fromRGBO(33, 84, 115, 1.0);
                                },
                              ),
                            ),
                            child: Text(
                              getButtonLabel(i),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  String getButtonLabel(int stepIndex) {
    switch (stepIndex) {
      case 0:
        return 'Upload Details';
      case 1:
        return 'Property Type';
      case 2:
        return 'Upload Photos';
      case 3:
        return 'Complete Registration';
      default:
        return 'Continue';
    }
  }
}
