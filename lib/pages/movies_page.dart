import 'package:flutter/material.dart';
import 'movie_detail_page.dart';

// ignore: use_key_in_widget_constructors
class MoviesPage extends StatelessWidget {
  final List<Map<String, String>> movies = [
    {"name": "Movie 1", "image": "assets/movie1.jpg"},
    {"name": "Movie 2", "image": "assets/movie2.jpg"},
    // Add more movies here
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Image.asset(movies[index]["image"]!),
          title: Text(movies[index]["name"]!),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetailPage(movie: movies[index]),
              ),
            );
          },
        );
      },
    );
  }
}
