import 'package:flutter/material.dart';

class KYCVerificationPage extends StatefulWidget {
  const KYCVerificationPage({Key? key}) : super(key: key);

  @override
  _KYCVerificationPageState createState() => _KYCVerificationPageState();
}

class _KYCVerificationPageState extends State<KYCVerificationPage> {
  bool isVerified = false; // Track the KYC verification status
  String selectedKYCSet = 'Tenant KYC 1'; // Track the selected KYC set

  // Define multiple sets of KYC details with updated labels
  final Map<String, String> kycSets = {
    'Tenant KYC 1': 'Name: John Doe\nID: 1234567890\nAddress: 123 Main St',
    'Tenant KYC 2': 'Name: Jane Smith\nID: 9876543210\nAddress: 456 Elm St',
    'Tenant KYC 3': 'Name: Bob Johnson\nID: 5555555555\nAddress: 789 Oak St',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('KYC Verification'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            elevation: 5.0,
            color: Colors.grey.shade100,
            margin: const EdgeInsets.all(16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Verify Tenant KYC',
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 20),
                  // Dropdown to select KYC set
                  DropdownButton<String>(
                    value: selectedKYCSet,
                    onChanged: (newValue) {
                      setState(() {
                        selectedKYCSet = newValue!;
                        isVerified = false; // Reset verification status when changing KYC set
                      });
                    },
                    items: kycSets.keys.map((String kycSet) {
                      return DropdownMenuItem<String>(
                        value: kycSet,
                        child: Text(kycSet),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  // Display selected KYC details or a placeholder
                  Text(
                    kycSets[selectedKYCSet] ?? 'No KYC details available',
                    style: const TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Simulate KYC verification by toggling the 'isVerified' state
                      setState(() {
                        isVerified = !isVerified;
                      });
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith<Color>(
                            (Set<MaterialState> states) {
                          if (isVerified) {
                            return const Color.fromRGBO(33, 37, 41, 1.0);
                          }
                          return const Color.fromRGBO(33, 84, 115, 1.0);
                        },
                      ),
                    ),
                    child: isVerified
                        ? const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Verified Successfully ',
                          style: TextStyle(color: Colors.white),
                        ),
                        Icon(
                          Icons.check_circle,
                          color: Colors.white,
                        ),
                      ],
                    )
                        : const Text(
                      'Verify KYC',
                      style: TextStyle(color: Colors.white),
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
}

