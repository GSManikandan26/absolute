import 'package:flutter/material.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Favorites'),
        centerTitle: true,
        backgroundColor:  Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Add your favorites content here
            const Text(
              'Your Favorite Properties',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            // You can display a list of favorite properties here
            // Example:
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Beautiful Villa'),
              subtitle: const Text('3 bedrooms, 2 bathrooms'),
              trailing: IconButton(
                icon: const Icon(Icons.favorite, color: Colors.red),
                onPressed: () {
                  // Remove from favorites or add your logic here
                },
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.apartment),
              title: const Text('Luxury Apartment'),
              subtitle: const Text('2 bedrooms, 2 bathrooms'),
              trailing: IconButton(
                icon: const Icon(Icons.favorite, color: Colors.red),
                onPressed: () {
                  // Remove from favorites or add your logic here
                },
              ),
            ),
            const SizedBox(height: 20),
            // Add more favorite properties as needed
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Cozy Cottage'),
              subtitle: const Text('2 bedrooms, 1 bathroom'),
              trailing: IconButton(
                icon: const Icon(Icons.favorite, color: Colors.red),
                onPressed: () {
                  // Remove from favorites or add your logic here
                },
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.apartment),
              title: const Text('Spacious Penthouse'),
              subtitle: const Text('4 bedrooms, 3 bathrooms'),
              trailing: IconButton(
                icon: const Icon(Icons.favorite, color: Colors.red),
                onPressed: () {
                  // Remove from favorites or add your logic here
                },
              ),
            ),
            // Add more favorite properties as needed
          ],
        ),
      ),
    );
  }
}
