import 'package:flutter/material.dart';
import '../model/movie.dart';
import 'booking_page.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  const MovieDetailPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(movie.name),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(movie.image),
              const SizedBox(height: 16.0),
              Text(
                movie.name,
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8.0),
              Text(movie.description),
              const SizedBox(height: 16.0),
              const Text(
                'Theatres:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: movie.theatres.length,
                  itemBuilder: (context, index) {
                    final theatre = movie.theatres[index];
                    return Container(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        child: Row(
                          children: [
                            Text(theatre.name),
                            const SizedBox(width: 16.0),
                            // show button for each show
                            Expanded(
                              child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    child: Row(
                                      children:
                                          theatre.shows.map<Widget>((show) {
                                        return Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (context) {
                                                return BookingPage(
                                                  movieName: movie.name,
                                                  theatreName: theatre.name,
                                                  remainingSeats:
                                                      show.remainingSeats,
                                                  pricePerTicket:
                                                      show.pricePerTicket,
                                                  showTime: show.startTime,
                                                );
                                              }));
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  show.remainingSeats == 0
                                                      ? Colors.red
                                                      : Colors.green,
                                            ),
                                            child: Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Text(
                                                          'Time: ${show.startTime.toString()}',
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white)),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4.0),
                                                      child: Text(
                                                          'Seats: ${show.remainingSeats.toString()}',
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white)),
                                                    ),
                                                    Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(4.0),
                                                        child: Text(
                                                          'Price: \$${show.pricePerTicket.toString()}',
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                        )),
                                                  ],
                                                )),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ));
  }
}
