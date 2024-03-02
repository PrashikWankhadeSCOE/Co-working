import 'package:coworking/booking/booking.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AvailableDesk extends StatelessWidget {
  const AvailableDesk({super.key, required this.time, required this.date});
  final String time;
  final String date;

  void myDailogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Confirm booking',
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: const Color.fromRGBO(73, 73, 73, 1),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Desk ID',
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(148, 148, 148, 1),
                    ),
                  ),
                  Text(
                    ': 123456',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(73, 73, 73, 1),
                    ),
                  ),
                  const SizedBox(
                    width: 67,
                  ),
                  Text(
                    'Desk 14',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: const Color.fromRGBO(73, 73, 73, 1),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 13),
                child: Row(
                  children: [
                    Text(
                      'Slot ',
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(148, 148, 148, 1),
                      ),
                    ),
                    Text(
                      ': Wed 31 May, 05:00PM-06:00PM',
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(73, 73, 73, 1),
                      ),
                    ),
                  ],
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BookingPage(),
                      ),
                    );
                  },
                  style:
                      ElevatedButton.styleFrom(fixedSize: const Size(159, 34)),
                  child: Text(
                    'Confirm',
                    style: GoogleFonts.poppins(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Available desks',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
        foregroundColor: const Color.fromRGBO(0, 0, 0, 1),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  child: Text(
                    "$date, $time",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    ),
                  ),
                ),
                const Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: [
                    Tables(
                      isbooked: false,
                      number: 2,
                    ),
                    Tables(
                      isbooked: true,
                      number: 3,
                    ),
                    Tables(
                      isbooked: false,
                      number: 4,
                    ),
                    Tables(
                      isbooked: true,
                      number: 5,
                    ),
                    Tables(
                      isbooked: true,
                      number: 6,
                    ),
                    Tables(
                      isbooked: true,
                      number: 7,
                    ),
                    Tables(
                      isbooked: false,
                      number: 8,
                    ),
                    Tables(
                      isbooked: false,
                      number: 9,
                    ),
                    Tables(
                      isbooked: false,
                      number: 10,
                    ),
                    Tables(
                      isbooked: true,
                      number: 11,
                    ),
                    Tables(
                      isbooked: false,
                      number: 12,
                    ),
                    Tables(
                      isbooked: false,
                      number: 13,
                    ),
                    Tables(
                      isbooked: false,
                      number: 14,
                    ),
                    Tables(
                      isbooked: false,
                      number: 15,
                    ),
                    Tables(
                      isbooked: false,
                      number: 16,
                    ),
                    Tables(
                      isbooked: false,
                      number: 17,
                    ),
                    Tables(
                      isbooked: false,
                      number: 18,
                    ),
                    Tables(
                      isbooked: false,
                      number: 19,
                    ),
                    Tables(
                      isbooked: true,
                      number: 20,
                    ),
                    Tables(
                      isbooked: false,
                      number: 21,
                    ),
                    Tables(
                      isbooked: false,
                      number: 22,
                    ),
                    Tables(
                      isbooked: false,
                      number: 23,
                    ),
                    Tables(
                      isbooked: true,
                      number: 24,
                    ),
                    Tables(
                      isbooked: false,
                      number: 25,
                    ),
                    Tables(
                      isbooked: false,
                      number: 26,
                    ),
                    Tables(
                      isbooked: false,
                      number: 27,
                    ),
                    Tables(
                      isbooked: true,
                      number: 28,
                    ),
                    Tables(
                      isbooked: false,
                      number: 29,
                    ),
                    Tables(
                      isbooked: false,
                      number: 30,
                    ),
                    Tables(
                      isbooked: false,
                      number: 31,
                    ),
                    Tables(
                      isbooked: false,
                      number: 32,
                    ),
                    Tables(
                      isbooked: false,
                      number: 33,
                    ),
                    Tables(
                      isbooked: false,
                      number: 34,
                    ),
                    Tables(
                      isbooked: false,
                      number: 35,
                    ),
                    Tables(
                      isbooked: false,
                      number: 36,
                    ),
                    Tables(
                      isbooked: false,
                      number: 37,
                    ),
                    Tables(
                      isbooked: false,
                      number: 38,
                    ),
                    Tables(
                      isbooked: true,
                      number: 39,
                    ),
                    Tables(
                      isbooked: false,
                      number: 40,
                    ),
                  ],
                ),
              ],
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  myDailogBox(context);
                },
                style: ElevatedButton.styleFrom(fixedSize: const Size(312, 56)),
                child: Text(
                  'Book Desk',
                  style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: const Color.fromRGBO(255, 255, 255, 1)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Tables extends StatelessWidget {
  const Tables({super.key, required this.isbooked, required this.number});
  final bool isbooked;
  final int number;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        border: Border.all(
            width: 1,
            color: (!isbooked)
                ? const Color.fromRGBO(199, 207, 252, 1)
                : const Color.fromRGBO(227, 227, 227, 1)),
        color: (isbooked)
            ? const Color.fromRGBO(227, 227, 227, 1)
            : const Color.fromRGBO(240, 245, 255, 1),
      ),
      height: 42,
      width: 42,
      child: Center(
        child: Text(number.toString()),
      ),
    );
  }
}
