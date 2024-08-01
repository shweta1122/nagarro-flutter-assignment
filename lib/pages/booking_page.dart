import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'booking_confirmation_page.dart';
import '../data_provider.dart';

class BookingPage extends StatefulWidget {
  final String movieName;
  final String theatreName;
  final int remainingSeats;
  final double pricePerTicket;
  final String showTime;

  const BookingPage({
    Key? key,
    required this.movieName,
    required this.theatreName,
    required this.remainingSeats,
    required this.pricePerTicket,
    required this.showTime,
  }) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  int _selectedTickets = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking for ${widget.movieName}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Theatre: ${widget.theatreName}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Remaining Seats: ${widget.remainingSeats}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Price per Ticket: \$${widget.pricePerTicket}',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                const Text('Select Tickets:'),
                const SizedBox(width: 16.0),
                DropdownButton<int>(
                  value: _selectedTickets,
                  items: List.generate(
                    min(widget.remainingSeats + 1, 10 + 1),
                    (index) => DropdownMenuItem(
                      value: index,
                      child: Text(index.toString()),
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _selectedTickets = value!;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(
              'Total Price: \$${(_selectedTickets * widget.pricePerTicket).toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _selectedTickets > 0
                  ? () {
                      // if user is logged in, confirm booking
                      if (Provider.of<DataProvider>(context, listen: false)
                              .userInfo !=
                          null) {
                        Provider.of<DataProvider>(context, listen: false)
                            .confirmBooking(
                                widget.movieName,
                                widget.theatreName,
                                _selectedTickets * widget.pricePerTicket,
                                widget.showTime,
                                _selectedTickets);
                        // Navigate to Booking Confirmation Page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookingConfirmationPage(
                              movieName: widget.movieName,
                              theatreName: widget.theatreName,
                              selectedTickets: _selectedTickets,
                              totalPrice:
                                  _selectedTickets * widget.pricePerTicket,
                            ),
                          ),
                        );
                      } else {
                        // if user is not logged in, navigate to login page
                        Navigator.pushNamed(context, '/login');
                      }
                    }
                  : null,
              child: const Text('Confirm Booking'),
            ),
          ],
        ),
      ),
    );
  }
}
