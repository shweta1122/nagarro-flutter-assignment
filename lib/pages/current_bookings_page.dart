import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class CurrentBookingsPage extends StatelessWidget {
  final List<Map<String, String>> bookings = [
    {"name": "Movie 1", "theatre": "Cinema A", "time": "12:00 PM", "price": "30"},
    {"name": "Movie 2", "theatre": "Cinema B", "time": "3:00 PM", "price": "25"},
    // Add more bookings here
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: bookings.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(bookings[index]["name"]!),
          subtitle: Text("${bookings[index]["theatre"]} - ${bookings[index]["time"]}"),
          trailing: Text("\$${bookings[index]["price"]}"),
        );
      },
    );
  }
}
