// UserInfo model
import 'booking.dart';

class UserInfo {
  final String email;
  final String mobile;
  final String password;
  final String imageBase64;
  final List<Booking> bookings;

  UserInfo({
    required this.email,
    required this.mobile,
    required this.password,
    required this.imageBase64,
    required this.bookings,
  });

  UserInfo copyWith({String? imageBase64, List<Booking>? bookings}) {
    return UserInfo(
      email: email,
      mobile: mobile,
      password: password,
      imageBase64: imageBase64 ?? this.imageBase64,
      bookings: bookings ?? this.bookings,
    );
  }
}
