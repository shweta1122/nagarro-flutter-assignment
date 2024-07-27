import 'package:flutter/material.dart';
import 'movies_page.dart';
import 'current_bookings_page.dart';
import 'drawer_menu.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Movie Ticket Booking App'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Movies'),
              Tab(text: 'Current Bookings'),
            ],
          ),
        ),
        drawer: DrawerMenu(),
        body: TabBarView(
          children: [
            MoviesPage(),
            CurrentBookingsPage(),
          ],
        ),
      ),
    );
  }
}
