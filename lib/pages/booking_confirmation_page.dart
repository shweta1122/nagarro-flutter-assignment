import 'package:flutter/material.dart';

class BookingConfirmationPage extends StatelessWidget {
  final String movie;
  final String theatre;
  final int seats;
  final int totalPrice;

  const BookingConfirmationPage(
      {super.key, required this.movie,
      required this.theatre,
      required this.seats,
      required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking Confirmation"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Booking Confirmed!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text("Movie: $movie"),
            Text("Theatre: $theatre"),
            Text("Seats: $seats"),
            Text("Total Price: \$$totalPrice"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text("Go to Home Page"),
            ),
          ],
        ),
      ),
    );
  }
}
