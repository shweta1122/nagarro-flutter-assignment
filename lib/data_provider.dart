import 'package:flutter/material.dart';
import 'model/movie.dart';
import 'model/booking.dart';
import 'model/user_info.dart';
import 'model/theatre.dart';
import 'model/show.dart';

class DataProvider with ChangeNotifier {
  List<Movie> _movies = [];
  List<Booking> _bookings = [];
  UserInfo? _userInfo;

  List<Movie> get movies => _movies;
  List<Booking> get bookings => _bookings;
  UserInfo? get userInfo => _userInfo;

  void initializeData() {
    List<Theatre> commonTheatres = [
      Theatre(
        name: 'Theatre 1',
        shows: [
          Show(startTime: '10:00 AM', remainingSeats: 0, pricePerTicket: 10.0),
          Show(startTime: '1:00 PM', remainingSeats: 45, pricePerTicket: 10.0),
          Show(startTime: '4:00 PM', remainingSeats: 0, pricePerTicket: 10.0),
        ],
      ),
      Theatre(
        name: 'Theatre 2',
        shows: [
          Show(startTime: '10:00 AM', remainingSeats: 23, pricePerTicket: 15.0),
          Show(startTime: '1:00 PM', remainingSeats: 3, pricePerTicket: 15.0),
          Show(startTime: '4:00 PM', remainingSeats: 11, pricePerTicket: 15.0),
        ],
      ),
      Theatre(
        name: 'Theatre 3',
        shows: [
          Show(startTime: '10:00 AM', remainingSeats: 34, pricePerTicket: 20.0),
          Show(startTime: '1:00 PM', remainingSeats: 46, pricePerTicket: 20.0),
          Show(startTime: '4:00 PM', remainingSeats: 0, pricePerTicket: 20.0),
        ],
      ),
    ];

    _movies = [
      Movie(
        name: 'Movie 1',
        image: 'assets/movie1.jpg',
        description: 'Description of Movie 1',
        theatres: commonTheatres,
      ),
      Movie(
        name: 'Movie 2',
        image: 'assets/movie2.jpg',
        description: 'Description of Movie 2',
        theatres: commonTheatres,
      ),
    ];

    _bookings = [];

    _userInfo = null;

    notifyListeners();
  }

  void login(String email, String password) {
    _userInfo = UserInfo(
        email: email,
        mobile: '1234567890',
        password: password,
        imageBase64: '',
        bookings: []);
    notifyListeners();
  }

  void logout() {
    _userInfo = null;
    notifyListeners();
  }

  void setProfileImage(String base64Image) {
    if (userInfo != null) {
      _userInfo = userInfo!.copyWith(imageBase64: base64Image);
      notifyListeners();
    }
  }

  void confirmBooking(String movieName, String theatreName, double totalPrice,
      String showTime, int seatsBooked) {
    if (userInfo != null) {
      final newBooking = Booking(
        movieName: movieName,
        theatreName: theatreName,
        pricePaid: totalPrice,
        showTime: showTime,
        seatsBooked: seatsBooked,
      );

      _bookings.add(newBooking);

      _userInfo = userInfo!.copyWith(
        bookings: List.from(userInfo!.bookings)..add(newBooking),
      );

      notifyListeners();
    }
  }
}
