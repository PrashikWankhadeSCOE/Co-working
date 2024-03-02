import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

List<ModelData> list = [
  ModelData(
    date: '31 may 2022 at 02:00PM',
    deskId: 12345,
    name: 'Supriya Thete',
  ),
  ModelData(
    date: '31 may 2022 at 02:00PM',
    deskId: 12345,
    name: 'Supriya Thete',
  )
];

class _BookingPageState extends State<BookingPage> {
  Widget myCard(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: const Color.fromRGBO(245, 247, 255, 1),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: SizedBox(
                width: 80,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Desk Id',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(73, 73, 73, 1),
                          ),
                        ),
                        Text(
                          ': ',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(73, 73, 73, 1),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Name',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(73, 73, 73, 1),
                          ),
                        ),
                        Text(
                          ': ',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(73, 73, 73, 1),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Booked on',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(73, 73, 73, 1),
                          ),
                        ),
                        Text(
                          ': ',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(73, 73, 73, 1),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      list[index].deskId.toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(30, 30, 30, 1),
                      ),
                    ),
                    Text(
                      list[index].name,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(30, 30, 30, 1),
                      ),
                    ),
                    Text(
                      list[index].date,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(30, 30, 30, 1),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Booking history',
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
        child: ListView.builder(
            itemCount: list.length,
            itemBuilder: (BuildContext context, index) {
              return myCard(index);
            }),
      ),
    );
  }
}

class ModelData {
  final int deskId;
  final String name;
  final String date;
  ModelData({
    required this.date,
    required this.deskId,
    required this.name,
  });
}
