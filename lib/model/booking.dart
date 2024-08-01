// UserInfo model

class Booking {
  final String movieName;
  final String theatreName;
  final String showTime;
  final double pricePaid;
  final int seatsBooked;

  Booking({
    required this.movieName,
    required this.theatreName,
    required this.showTime,
    required this.pricePaid,
    required this.seatsBooked,
  });
}
