import 'dart:convert';

import 'package:coworking/available_desk/available_desk.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class DeskScreen extends StatefulWidget {
  const DeskScreen({super.key, required this.calledFrom});
  final int calledFrom;

  @override
  State<DeskScreen> createState() => _DeskScreenState();
}

List slotsList = [];

String? timeSelected;

class _DeskScreenState extends State<DeskScreen> {
  bool dataRecieved = false;

  Future<void> fetchData() async {
    final url = Uri.parse(
      'https://demo0413095.mockable.io/digitalflake/api/get_slots',
    );
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        slotsList = data["slots"];
        dataRecieved = true;
      });
    } else {}
  }

  bool isfull = false;

  String formattedDate = DateFormat('EEEE d MMM').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Date & Slot',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
        ),
        foregroundColor: const Color.fromRGBO(0, 0, 0, 1),
        backgroundColor: Colors.white,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(
            height: 10,
          ),
          EasyInfiniteDateTimeLine(
            firstDate: DateTime(2023),
            focusDate: DateTime.now(),
            lastDate: DateTime(2024, 12, 31),
            onDateChange: (selectedDate) {
              setState(() {
                formattedDate = DateFormat('EEEE d MMM').format(selectedDate);
              });
            },
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: (dataRecieved)
                ? Wrap(
                    runSpacing: 10,
                    spacing: 8,
                    children: List.generate(
                      slotsList.length,
                      (index) => TimeSlot(
                        isfull: slotsList[index]["slot_active"],
                        time: slotsList[index]["slot_name"],
                      ),
                    ),
                  )
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(24),
            child: ElevatedButton(
              onPressed: () {
                (timeSelected != null)
                    ? setState(() {
                        deskSelected = null;
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AvailableDesk(
                              type: widget.calledFrom,
                              time: timeSelected!,
                              date: formattedDate,
                            ),
                          ),
                        );
                      })
                    : setState(() {});
              },
              style: ElevatedButton.styleFrom(fixedSize: const Size(312, 56)),
              child: Text(
                'Next',
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TimeSlot extends StatefulWidget {
  const TimeSlot({super.key, required this.isfull, required this.time});
  final bool isfull;
  final String time;

  @override
  State<TimeSlot> createState() => _TimeSlotState();
}

class _TimeSlotState extends State<TimeSlot> {
  bool tapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (timeSelected == null && !widget.isfull) {
            timeSelected = widget.time;
            tapped = true;
          }
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: (!widget.isfull)
                ? const Color.fromRGBO(199, 207, 252, 1)
                : const Color.fromRGBO(227, 227, 227, 1),
          ),
          borderRadius: BorderRadius.circular(4),
          color: (!tapped)
              ? (widget.isfull)
                  ? const Color.fromRGBO(227, 227, 227, 1)
                  : const Color.fromRGBO(240, 245, 255, 1)
              : const Color.fromRGBO(77, 96, 209, 1),
        ),
        height: 42,
        width: 152,
        child: Center(
          child: Text(
            widget.time,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: (!tapped)
                    ? (widget.isfull)
                        ? const Color.fromRGBO(246, 246, 246, 1)
                        : const Color.fromRGBO(91, 97, 128, 1)
                    : const Color.fromRGBO(246, 246, 246, 1)),
          ),
        ),
      ),
    );
  }
}
