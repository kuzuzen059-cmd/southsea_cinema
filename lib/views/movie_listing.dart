import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatefulWidget {
  const MovieListing({super.key});

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 1;
  String _bookingMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),
      drawer: const NavDrawer(),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('DRACULA (1931) (PG)'),
            const Text('Southsea Cinema Room'),
            const Text('A vampire travels to England and brings terror.'),
            DropdownMenu<int>(
              initialSelection: _ticketQuantity,
              onSelected: (int? value) {
                if (value != null) {
                  setState(() {
                    _ticketQuantity = value;
                    print('Tickets selected: $_ticketQuantity');
                  });
                }
              },
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: 1, label: '1'),
                DropdownMenuEntry(value: 2, label: '2'),
                DropdownMenuEntry(value: 3, label: '3'),
                DropdownMenuEntry(value: 4, label: '4'),
                DropdownMenuEntry(value: 5, label: '5'),
              ],
            ),
            Text('Tickets selected: $_ticketQuantity'),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _bookingMessage =
                      'Added $_ticketQuantity tickets to the order';
                  print(_bookingMessage);
                });
              },
              child: const Text('Add to order'),
            ),
            Text(_bookingMessage),
          ],
        ),
      ),
    );
  }
}
