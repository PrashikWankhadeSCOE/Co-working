import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 89,
            ),
            Center(child: Image.asset('assets/df_Icon_small.png')),
            Center(
              child: Text(
                'Co-working',
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 24,
                  color: const Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
            ),
            const SizedBox(
              height: 91,
            ),
            Text(
              'Mobile number or Email',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: const Color.fromRGBO(73, 73, 73, 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 24),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: const Color.fromRGBO(218, 218, 218, 1),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Text(
              'Password',
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: const Color.fromRGBO(73, 73, 73, 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 24),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fillColor: const Color.fromRGBO(218, 218, 218, 1),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Image.asset('assets/mdi_eye.png'),
                    )),
              ),
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(fixedSize: const Size(312, 56)),
                child: const Text('Log in'),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'New user? ',
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: const Color.fromRGBO(98, 98, 98, 1)),
                  ),
                  Text(
                    'Create an account',
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: const Color.fromRGBO(42, 29, 139, 1)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
