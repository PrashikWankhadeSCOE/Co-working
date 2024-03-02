import 'dart:convert';

import 'package:coworking/desk/desk.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

List desklist = [];

String? deskSelected;
int deskId = -1;

class AvailableDesk extends StatefulWidget {
  const AvailableDesk({super.key, required this.time, required this.date});
  final String time;
  final String date;

  @override
  State<AvailableDesk> createState() => _AvailableDeskState();
}

class _AvailableDeskState extends State<AvailableDesk> {
  Future<void> fetch() async {
    final url = Uri.parse(
        'https://demo0413095.mockable.io/digitalflake/api/get_availability');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      desklist = data["availability"];
    }
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }

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
                    ': $deskId',
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
                    'Desk $deskSelected',
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
                      ': Wed 31 May, $timeSelected',
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
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Color.fromRGBO(25, 173, 30, 1),
                      content: SizedBox(
                        height: 61,
                        width: 312,
                        child: Row(children: [
                          Icon(
                            Icons.check_circle,
                            color: Colors.white,
                            size: 24,
                          )
                        ]),
                      ),
                      closeIconColor: Colors.white,
                      showCloseIcon: true,
                    ));
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
                    "${widget.date}, ${widget.time}",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 13,
                    ),
                  ),
                ),
                Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: List.generate(
                    desklist.length,
                    (index) => Tables(
                        isbooked: desklist[index]["workspace_active"],
                        number: desklist[index]['workspace_name'],
                        id: desklist[index]['workspace_id']),
                  ),
                ),
              ],
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (deskSelected != null) {
                    setState(() {
                      myDailogBox(context);
                    });
                  } else {
                    setState(() {});
                  }
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

class Tables extends StatefulWidget {
  const Tables(
      {super.key,
      required this.isbooked,
      required this.number,
      required this.id});
  final bool isbooked;
  final String number;
  final int id;

  @override
  State<Tables> createState() => _TablesState();
}

class _TablesState extends State<Tables> {
  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (deskSelected == null && !widget.isbooked) {
            deskSelected = widget.number;
            deskId = widget.id;
            isSelected = true;
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(3),
          border: Border.all(
            width: 1,
            color: (!widget.isbooked)
                ? const Color.fromRGBO(199, 207, 252, 1)
                : const Color.fromRGBO(227, 227, 227, 1),
          ),
          color: (!isSelected)
              ? (widget.isbooked)
                  ? const Color.fromRGBO(227, 227, 227, 1)
                  : const Color.fromRGBO(240, 245, 255, 1)
              : const Color.fromRGBO(77, 96, 209, 1),
        ),
        height: 42,
        width: 42,
        child: Center(
          child: Text(
            widget.number.toString(),
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: (!isSelected)
                    ? (widget.isbooked)
                        ? const Color.fromRGBO(246, 246, 246, 1)
                        : const Color.fromRGBO(91, 97, 128, 1)
                    : const Color.fromRGBO(246, 246, 246, 1)),
          ),
        ),
      ),
    );
  }
}
