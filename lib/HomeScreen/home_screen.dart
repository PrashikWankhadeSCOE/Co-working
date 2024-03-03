import 'package:coworking/booking/booking.dart';
import 'package:coworking/desk/desk.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool selected1 = true;
  bool selected2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/df_Icon_small.png',
                      height: 22,
                      width: 22,
                    ),
                    Text(
                      'Co-working',
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: const Color.fromRGBO(83, 79, 79, 1)),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BookingPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(81, 103, 235, 1)),
                  child: Text(
                    'Booking history',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        selected1 = true;
                        selected2 = !selected1;

                        timeSelected = null;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (contex) =>
                                const DeskScreen(calledFrom: 1),
                          ),
                        );
                      },
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: (selected1)
                              ? const Color.fromRGBO(77, 96, 209, 1)
                              : const Color.fromRGBO(199, 207, 252, 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: 147,
                        width: 147,
                        child: Image.asset('assets/book_work_station.png'),
                      ),
                      Text(
                        'Book Work Station',
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        selected2 = true;
                        selected1 = !selected2;
                        timeSelected = null;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (contex) =>
                                const DeskScreen(calledFrom: 2),
                          ),
                        );
                      },
                    );
                  },
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: (selected2)
                              ? const Color.fromRGBO(77, 96, 209, 1)
                              : const Color.fromRGBO(199, 207, 252, 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: 147,
                        width: 147,
                        child: Image.asset('assets/meeting_room.png'),
                      ),
                      Text(
                        'Meeting room',
                        style: GoogleFonts.poppins(
                            fontSize: 20, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
