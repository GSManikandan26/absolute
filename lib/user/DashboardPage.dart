import 'package:flutter/material.dart';

import 'manage_bookings.dart';
import 'manage_property.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Add your dashboard content here
              const Text(
                'Welcome to Your Dashboard',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Add a DataTable widget with tabular content
              DataTable(
                columns: const [
                  DataColumn(label: Text('Property')),
                  DataColumn(label: Text('Location')),
                  DataColumn(label: Text('Price')),
                ],
                rows: const [
                  DataRow(cells: [
                    DataCell(Text('Property 1')),
                    DataCell(Text('Location 1')),
                    DataCell(Text('\$100,000')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Property 2')),
                    DataCell(Text('Location 2')),
                    DataCell(Text('\$150,000')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Property 3')),
                    DataCell(Text('Location 3')),
                    DataCell(Text('\$120,000')),
                  ]),
                  DataRow(cells: [
                    DataCell(Text('Property 4')),
                    DataCell(Text('Location 4')),
                    DataCell(Text('\$180,000')),
                  ]),
                  // Add more rows as needed
                ],
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the "Manage Property Listings" page
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ManagePropertyListingsPage(),
                    ),
                  );
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
                  'Manage Property Listings',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Navigate to the "Manage Bookings" page
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ManageBookingsPage(),
                    ),
                  );
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
                  'Manage Bookings',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              // Add more widgets and functionality as needed
            ],
          ),
        ),
      ),
    );
  }
}
