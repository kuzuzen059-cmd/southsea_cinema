import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return const [
      Movie(
        id: 'dracula-1931',
        title: 'DRACULA (1931)',
        synopsis: 'A vampire travels to England and brings terror.',
        ageRating: 'PG',
        screeningTime: 'Friday 6 Nov 2026 19:30',
        ticketPrice: 6.00,
        posterImagePath: 'assets/images/dracula.jpg',
      ),
      Movie(
        id: 'nosferatu-1922',
        title: 'NOSFERATU (1922)',
        synopsis:
            'Vampire Count Orlok expresses interest in a new residence and real estate agent Hutter\'s wife.',
        ageRating: 'PG',
        screeningTime: 'Saturday 7 Nov 2026 20:00',
        ticketPrice: 6.00,
        posterImagePath: 'assets/images/nosferatu.jpg',
      ),
    ];
  }
}
