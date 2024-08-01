import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data_provider.dart';
import '../model/booking.dart';

class CurrentBookingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataProvider>(
      builder: (context, dataProvider, child) {
        final bookings = dataProvider.userInfo?.bookings ?? [];

        if (bookings.isEmpty) {
          return Center(child: Text('No current bookings.'));
        }

        return ListView.builder(
          itemCount: bookings.length,
          itemBuilder: (context, index) {
            final booking = bookings[index];
            return ListTile(
              title: Text(booking.movieName),
              subtitle: Text("${booking.theatreName} - ${booking.showTime}\n${booking.seatsBooked} seats, USD: ${booking.pricePaid}")
            );
          },
        );
      },
    );
  }
}