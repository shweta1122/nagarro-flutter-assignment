import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data_provider.dart';
import '../movie_detail_page.dart';

class MoviesTab extends StatelessWidget {
  const MoviesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final movies = Provider.of<DataProvider>(context).movies;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20), // Add padding around the list
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Padding(
              padding:
                  const EdgeInsets.all(10.0), // Add padding around each item
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovieDetailPage(movie: movie),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 200, // Set the width of the image
                      height: 300, // Set the height of the image
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(movie.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(
                        width:
                            16), // Add some space between the image and the text
                    Expanded(
                      child: Text(
                        movie.name,
                        style: const TextStyle(
                            fontSize: 18), // Adjust the text style as needed
                      ),
                    ),
                  ],
                ),
              ));
        },
      ),
    );
  }
}
