import 'package:flutter/material.dart';

class ManageBookingsPage extends StatelessWidget {
  const ManageBookingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Bookings'),
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
                'This is the Manage Bookings Page',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'List of Your Bookings:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              // Add a ListView to display a list of bookings
              ListView(
                shrinkWrap: true,
                children: const [
                  ListTile(
                    title: Text('Booking 1'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Property: Property 1'),
                        Text('Check-in: January 1, 2023'),
                        Text('Check-out: January 5, 2023'),
                      ],
                    ),
                  ),
                  ListTile(
                    title: Text('Booking 2'),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Property: Property 2'),
                        Text('Check-in: February 1, 2023'),
                        Text('Check-out: February 5, 2023'),
                      ],
                    ),
                  ),
                  // Add more booking listings as needed
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Add logic for creating a new booking
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
                  'Create New Booking',
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
