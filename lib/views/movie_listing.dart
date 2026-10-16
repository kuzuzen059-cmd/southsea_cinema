import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  final Map<String, int> selectedTickets = {};
  final Map<String, String> bookingMessages = {};

  final List<Map<String, String>> movies = [
    {
      'title': 'The Shawshank Redemption',
      'runtime': '2h 22m',
      'rating': 'R',
      'description':
          'A banker sentenced to life in Shawshank Prison for a crime he did not commit forms a quiet friendship with a fellow inmate and holds onto hope across decades behind bars.',
    },
    {
      'title': 'The Amazing Spider-Man',
      'runtime': '2h 16m',
      'rating': 'PG-13',
      'description':
          'Peter Parker uncovers secrets about his parents while gaining spider-like powers and becoming Spider-Man.',
    },
    {
      'title': 'Wonder (2017)',
      'runtime': '1h 53m',
      'rating': 'PG',
      'description':
          'A boy with facial differences attends mainstream school for the first time and teaches his community about kindness and acceptance.',
    },
    {
      'title': '21 Jump Street',
      'runtime': '1h 49m',
      'rating': 'R',
      'description':
          'Two rookie cops go undercover as high school students to bust a drug ring and end up reliving teenage life.',
    },
    {
      'title': '22 Jump Street',
      'runtime': '1h 52m',
      'rating': 'R',
      'description':
          'The same duo goes undercover at a college to crack another drug case, testing their partnership.',
    },
    {
      'title': 'Rush Hour (1998)',
      'runtime': '97 minutes',
      'rating': 'PG-13 (US) / 15 (UK)',
      'description':
          'A Hong Kong detective and an LAPD officer work together to rescue a kidnapped diplomat’s daughter.',
    },
    {
      'title': 'Rush Hour 2 (2001)',
      'runtime': '90–91 minutes',
      'rating': 'PG-13',
      'description':
          'The mismatched duo’s Hong Kong vacation leads them into a counterfeiting conspiracy.',
    },
    {
      'title': 'Rush Hour 3 (2007)',
      'runtime': '91 minutes',
      'rating': 'PG-13',
      'description':
          'Lee and Carter travel to Paris to pursue a criminal mastermind connected to the Triad gang.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    const background = Color(0xFF171B26);
    const cardColour = Color(0xFF252B3A);
    const accent = Color(0xFF55D6BE);
    const primaryText = Color(0xFFF4F6FC);
    const secondaryText = Color(0xFFCBD2E0);

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        children: [
          const Text(
            'NOW SHOWING',
            style: TextStyle(
              color: primaryText,
              fontSize: 26,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Discover your next favourite film.',
            style: TextStyle(
              color: secondaryText,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 22),
          ...movies.map((movie) {
            final title = movie['title']!;
            final quantity = selectedTickets[title] ?? 1;

            return Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: cardColour,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.08),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: primaryText,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 10,
                      runSpacing: 8,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Icon(
                              Icons.schedule,
                              size: 17,
                              color: accent,
                            ),
                            const SizedBox(width: 5),
                            Text(
                              movie['runtime']!,
                              style: const TextStyle(
                                color: secondaryText,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            color: accent.withValues(alpha: 0.14),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Text(
                            movie['rating']!,
                            style: const TextStyle(
                              color: accent,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Text(
                      movie['description']!,
                      style: const TextStyle(
                        color: secondaryText,
                        fontSize: 14,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      'NUMBER OF TICKETS',
                      style: TextStyle(
                        color: primaryText,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(height: 6),
                    DropdownMenu<int>(
                      initialSelection: quantity,
                      label: const Text('Tickets'),
                      dropdownMenuEntries: const [
                        DropdownMenuEntry(value: 1, label: '1'),
                        DropdownMenuEntry(value: 2, label: '2'),
                        DropdownMenuEntry(value: 3, label: '3'),
                        DropdownMenuEntry(value: 4, label: '4'),
                        DropdownMenuEntry(value: 5, label: '5'),
                      ],
                      onSelected: (int? value) {
                        if (value != null) {
                          setState(() {
                            selectedTickets[title] = value;
                          });
                          print('Tickets selected: $value');
                        }
                      },
                    ),
                    const SizedBox(height: 6),
                    Text(
                      'Tickets selected: $quantity',
                      style: const TextStyle(color: secondaryText),
                    ),
                    const SizedBox(height: 14),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            bookingMessages[title] =
                                'Added $quantity tickets to the order';
                          });
                        },
                        icon: const Icon(Icons.confirmation_num_outlined),
                        label: const Text('Book Tickets'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: accent,
                          foregroundColor: background,
                          padding: const EdgeInsets.symmetric(
                            vertical: 14,
                          ),
                          textStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      bookingMessages[title] ?? '',
                      style: const TextStyle(color: secondaryText),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
