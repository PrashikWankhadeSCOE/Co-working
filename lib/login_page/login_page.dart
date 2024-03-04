import 'dart:convert';

import 'package:coworking/HomeScreen/home_screen.dart';
import 'package:coworking/login_page/registration_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String message = 'Error Occured while Authentication !';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> fetch() async {
    final url =
        Uri.parse('https://demo0413095.mockable.io/digitalflake/api/login');
    final body = jsonEncode({
      'email': emailController.text,
      'password': passwordController.text,
    });
    final response = await http.post(url, body: body);
    if (response.statusCode == 200) {
      setState(() {
        final data = jsonDecode(response.body);
        message = data['message'];
      });
    } else {}
  }

  final formkey = GlobalKey<FormState>();
  // Snackbar which will show the message that will come if data is posted succesfully
  SnackBar snackbar([String? data]) {
    if (data != null && data.isNotEmpty) {
      message = data;
    }
    return SnackBar(
      backgroundColor: const Color.fromRGBO(25, 173, 30, 1),
      duration: const Duration(milliseconds: 1500),
      padding: const EdgeInsets.all(8),
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      content: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: (message == "Error Occured while Authentication !" ||
                    message == 'Please fill proper data')
                ? const Icon(
                    Icons.cancel_outlined,
                    color: Colors.white,
                    size: 24,
                  )
                : const Icon(
                    Icons.check_circle,
                    color: Colors.white,
                    size: 24,
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                (message == "Error Occured while Authentication !" ||
                        message == 'Please fill proper data')
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
                  message,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                    color: const Color.fromRGBO(255, 255, 255, 1),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      showCloseIcon: true,
      closeIconColor: Colors.white,
    );
  }

  bool hide = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Padding(
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
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      fillColor: const Color.fromRGBO(218, 218, 218, 1),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter data ';
                      } else if (!value.contains('@')) {
                        return 'Email address must contain @';
                      }
                      return null;
                    },
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
                  child: TextFormField(
                    obscureText: hide,
                    controller: passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password cannot be empty";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      fillColor: const Color.fromRGBO(218, 218, 218, 1),
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: () {
                          setState(() {
                            hide = !hide;
                          });
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Image.asset('assets/mdi_eye.png'),
                        ),
                      ),
                    ),
                  ),
                ),
                // const Spacer(),
                SizedBox(height: MediaQuery.of(context).size.height * 0.30),

                Center(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (formkey.currentState!.validate()) {
                        await fetch();
                        if (message == "Error Occured while Authentication !") {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(snackbar());
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ),
                          );

                          emailController.clear();
                          passwordController.clear();

                          ScaffoldMessenger.of(context)
                              .showSnackBar(snackbar());
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(312, 56),
                        backgroundColor: const Color.fromRGBO(81, 103, 235, 1)),
                    child: Text(
                      'Log in',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
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
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegistrationPage()),
                          );
                        },
                        child: Text(
                          'Create an account',
                          style: GoogleFonts.poppins(
                              decoration: TextDecoration.underline,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: const Color.fromRGBO(42, 29, 139, 1)),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
