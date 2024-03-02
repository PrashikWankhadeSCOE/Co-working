import 'package:coworking/available_desk/available_desk.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DeskScreen extends StatefulWidget {
  const DeskScreen({super.key});

  @override
  State<DeskScreen> createState() => _DeskScreenState();
}

String timeSelected = '10:00AM - 11:00AM';

class _DeskScreenState extends State<DeskScreen> {
  bool isfull = false;

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
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Center(
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                runSpacing: 10,
                spacing: 8,
                children: [
                  TimeSlot(
                    isfull: true,
                    time: '10:00AM - 11:00AM',
                  ),
                  TimeSlot(
                    isfull: true,
                    time: '11:00AM - 12:00PM',
                  ),
                  TimeSlot(
                    isfull: false,
                    time: '01:00PM - 02:00PM',
                  ),
                  TimeSlot(
                    isfull: true,
                    time: '02:00PM - 03:00PM',
                  ),
                  TimeSlot(
                    isfull: false,
                    time: '04:00PM - 05:00PM',
                  ),
                  TimeSlot(
                    isfull: false,
                    time: '05:00PM - 06:00PM',
                  ),
                  TimeSlot(
                    isfull: true,
                    time: '06:00PM - 07:00PM',
                  ),
                  TimeSlot(
                    isfull: false,
                    time: '07:00PM - 08:00PM',
                  ),
                  TimeSlot(
                    isfull: false,
                    time: '08:00PM - 09:00PM',
                  ),
                  TimeSlot(
                    isfull: true,
                    time: '09:00PM - 10:00PM',
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AvailableDesk(
                      time: timeSelected,
                      date: 'Wed 31 May',
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(fixedSize: const Size(312, 56)),
              child: Text(
                'Next',
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ),
          ],
        ),
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
          timeSelected = widget.time;
          tapped = true;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: const Color.fromRGBO(199, 207, 252, 1),
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
