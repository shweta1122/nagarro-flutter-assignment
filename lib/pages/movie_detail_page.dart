import 'package:flutter/material.dart';
import 'booking_page.dart';

class MovieDetailPage extends StatelessWidget {
  final Map<String, String> movie;

  // ignore: prefer_const_constructors_in_immutables
  MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    final List<String> theatres = ["Cinema A", "Cinema B", "Cinema C"];

    return Scaffold(
      appBar: AppBar(
        title: Text(movie["name"]!),
      ),
      body: Column(
        children: [
          Image.asset(movie["image"]!),
          Text(
            movie["name"]!,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text("Short description of the movie."),
          Expanded(
            child: ListView.builder(
              itemCount: theatres.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(theatres[index]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BookingPage(
                          movie: movie["name"]!,
                          theatre: theatres[index],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
