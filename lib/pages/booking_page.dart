import 'package:flutter/material.dart';
import 'booking_confirmation_page.dart';

class BookingPage extends StatefulWidget {
  final String movie;
  final String theatre;

  const BookingPage({super.key, required this.movie, required this.theatre});

  @override
  // ignore: library_private_types_in_public_api
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  int _selectedSeats = 0;
  final int _pricePerSeat = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              widget.movie,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text("Cinema: ${widget.theatre}"),
            Text("Price per seat: \$$_pricePerSeat"),
            const SizedBox(height: 20),
            DropdownButton<int>(
              value: _selectedSeats,
              onChanged: (int? newValue) {
                setState(() {
                  _selectedSeats = newValue!;
                });
              },
              items: List.generate(11, (index) => index)
                  .map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text(value.toString()),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingConfirmationPage(
                      movie: widget.movie,
                      theatre: widget.theatre,
                      seats: _selectedSeats,
                      totalPrice: _selectedSeats * _pricePerSeat,
                    ),
                  ),
                );
              },
              child: const Text("Confirm Booking"),
            ),
          ],
        ),
      ),
    );
  }
}
