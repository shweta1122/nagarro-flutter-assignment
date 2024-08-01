import 'package:flutter/material.dart';

class BookingConfirmationPage extends StatelessWidget {
  final String movieName;
  final String theatreName;
  final int selectedTickets;
  final double totalPrice;

  const BookingConfirmationPage({
    Key? key,
    required this.movieName,
    required this.theatreName,
    required this.selectedTickets,
    required this.totalPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Confirmation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Booking Confirmed for $movieName',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            Text(
              'Theatre: $theatreName',
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            Text(
              'Tickets: $selectedTickets',
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            Text(
              'Total Price: \$${totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Navigate back to Home Page
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text('Go to Home Page'),
            ),
          ],
        ),
      ),
    );
  }
}