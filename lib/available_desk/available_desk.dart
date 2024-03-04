import 'dart:convert';

import 'package:coworking/desk/desk.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

List desklist = [];

String? deskSelected;
int deskId = -1;

class AvailableDesk extends StatefulWidget {
  const AvailableDesk(
      {super.key, required this.time, required this.date, required this.type});
  final int type;
  final String time;
  final String date;

  @override
  State<AvailableDesk> createState() => _AvailableDeskState();
}

class _AvailableDeskState extends State<AvailableDesk> {
  bool dataRecieved = false;
  String dataSubmittedmessage = "Data not recieved";
  Future<void> pushData() async {
    final url = Uri.parse(
        "https://demo0413095.mockable.io/digitalflake/api/confirm_booking");

    final body = jsonEncode({
      "workspace_id": deskId,
      'name': 'Supriya Thete',
      "booked_on": timeSelected,
      'type': widget.type
    });
    final response = await http.post(url, body: body);
    if (response.statusCode == 200) {
      setState(() {
        final data = json.decode(response.body);
        dataSubmittedmessage = data['message'];
      });
    } else {}
  }

  Future<void> fetch() async {
    final url = Uri.parse(
        'https://demo0413095.mockable.io/digitalflake/api/get_availability');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        desklist = data["availability"];

        dataRecieved = true;
      });
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Confirm booking',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: const Color.fromRGBO(73, 73, 73, 1),
                ),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.cancel))
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: (widget.type == 1) ? 'Desk ID ' : 'Room Id',
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(148, 148, 148, 1),
                          ),
                        ),
                        TextSpan(
                          text: ': $deskId',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromRGBO(73, 73, 73, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 90,
                  ),
                  Text(
                    (widget.type == 1)
                        ? 'Desk $deskSelected'
                        : 'Room No.$deskSelected',
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
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Slot ',
                        style: GoogleFonts.poppins(
                          fontSize: 10,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(148, 148, 148, 1),
                        ),
                      ),
                      TextSpan(
                        text: ': ${widget.date}, $timeSelected',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromRGBO(73, 73, 73, 1),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    mySnackBar(context);
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(159, 34),
                      backgroundColor: const Color.fromRGBO(81, 103, 235, 1)),
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

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> mySnackBar(
      BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: const Color.fromRGBO(25, 173, 30, 1),
      duration: const Duration(milliseconds: 1500),
      padding: const EdgeInsets.all(8),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.check_circle,
              color: Colors.white,
              size: 24,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  (dataSubmittedmessage == "Data not recieved")
                      ? Text(
                          'Error',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                          ),
                        )
                      : Text(
                          'Success',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: const Color.fromRGBO(255, 255, 255, 1),
                          ),
                        ),
                  Text(
                    dataSubmittedmessage,
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: const Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      showCloseIcon: true,
      closeIconColor: Colors.white,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          (widget.type == 1) ? 'Available desks' : 'Available rooms',
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
                (dataRecieved)
                    ? Wrap(
                        spacing: 12,
                        runSpacing: 12,
                        children: List.generate(
                          desklist.length,
                          (index) => Tables(
                              isbooked: desklist[index]["workspace_active"],
                              number: desklist[index]['workspace_name'],
                              id: desklist[index]['workspace_id']),
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      ),
              ],
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (deskSelected != null) {
                    setState(() {
                      pushData();
                      myDailogBox(context);
                    });
                  } else {
                    setState(() {});
                  }
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(312, 56),
                    backgroundColor: const Color.fromRGBO(81, 103, 235, 1)),
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
