// UserInfo model


import 'theatre.dart';

class Movie {
  final String name;
  final String image;
  final String description;
  final List<Theatre> theatres;

  Movie({
    required this.name,
    required this.image,
    required this.description,
    required this.theatres,
  });
}
