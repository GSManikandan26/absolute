import 'package:flutter/material.dart';

class ManagePropertyListingsPage extends StatelessWidget {
  const ManagePropertyListingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Property Listings'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'This is the Manage Property Listings Page',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'List of Your Properties:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Add a ListView to display a list of properties
              ListView(
                shrinkWrap: true,
                children: const [
                  ListTile(
                    title: Text('Property 1'),
                    subtitle: Text('Location: Location 1'),
                    trailing: Text('\$100,000'),
                  ),
                  ListTile(
                    title: Text('Property 2'),
                    subtitle: Text('Location: Location 2'),
                    trailing: Text('\$150,000'),
                  ),
                  // Add more property listings as needed
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Add logic for adding a new property listing
                },
                style: ButtonStyle(
                  backgroundColor:
                  MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return const Color.fromRGBO(33, 37, 41, 1.0);
                      }
                      return const Color.fromRGBO(33, 84, 115, 1.0);
                    },
                  ),
                ),
                child: const Text(
                  'Add New Property Listing',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
