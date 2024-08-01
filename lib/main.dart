import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data_provider.dart';
import 'pages/home_page.dart';
import 'pages/login_page.dart';
import 'pages/contact_us_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => DataProvider()..initializeData(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Ticket Booking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/login': (context) => const LoginPage(),
        '/contact_us': (context) => ContactUsPage(),
      },
    );
  }
}