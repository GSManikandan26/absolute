import 'package:flutter/material.dart';

class BookingHistoryPage extends StatefulWidget {
  const BookingHistoryPage({super.key});

  @override
  _BookingHistoryPageState createState() => _BookingHistoryPageState();
}

class _BookingHistoryPageState extends State<BookingHistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking History'),
        centerTitle: true,
        backgroundColor:  Colors.white,
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add your booking history content here
            Text(
              'Booking 1',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text('Property: Property Name 1'),
            SizedBox(height: 10),
            Text('Check-in: January 1, 2023'),
            SizedBox(height: 10),
            Text('Check-out: January 5, 2023'),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 20),
            Text(
              'Booking 2',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text('Property: Property Name 2'),
            SizedBox(height: 10),
            Text('Check-in: February 1, 2023'),
            SizedBox(height: 10),
            Text('Check-out: February 5, 2023'),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 20),
            // Add more booking history entries as needed
            Text(
              'Booking 3',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text('Property: Property Name 3'),
            SizedBox(height: 10),
            Text('Check-in: March 1, 2023'),
            SizedBox(height: 10),
            Text('Check-out: March 5, 2023'),
            SizedBox(height: 10),
            Divider(),

            // Add even more booking history entries as needed
          ],
        ),
      ),
    );
  }
}
