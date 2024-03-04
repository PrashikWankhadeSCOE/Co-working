import 'dart:convert';

import 'package:coworking/HomeScreen/home_screen.dart';
import 'package:coworking/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final formkey = GlobalKey<FormState>();
  String message = 'Registration Failed !';

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();

  Future<void> fetch() async {
    final url = Uri.parse(
        'https://demo0413095.mockable.io/digitalflake/api/create_account');
    final body = jsonEncode({
      'email': emailController.text,
      'name': nameController.text,
      'mobileNo': mobileController.text,
    });
    final response = await http.post(url, body: body);
    if (response.statusCode == 200) {
      setState(() {
        final data = jsonDecode(response.body);
        message = data['message'];
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 90,
                    ),
                    Text(
                      'Create an Account',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 24,
                        color: const Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                    const SizedBox(
                      height: 58,
                    ),
                    Text(
                      'Full name',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: const Color.fromRGBO(73, 73, 73, 1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 24),
                      child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          fillColor: const Color.fromRGBO(218, 218, 218, 1),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                    Text(
                      'Mobile number',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: const Color.fromRGBO(73, 73, 73, 1),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 24),
                      child: TextFormField(
                        validator: (value) {
                          bool isNumeric(String str) {
                            try {
                              double.parse(str);
                              return true;
                            } on FormatException {
                              return false;
                            }
                          }

                          if (value!.length != 10) {
                            return 'Mobile no should be 10 digits';
                          } else if (!isNumeric(value)) {
                            return 'Should contain Digits only';
                          }
                          return null;
                        },
                        controller: mobileController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromRGBO(218, 218, 218, 1),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                    Text(
                      'Email ID',
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
                            return 'Please Enter the Data';
                          } else if (!value.contains('@')) {
                            return 'Email should contain @ Symbol';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.22),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (contex) => const HomePage(),
                          ),
                        );
                      } else {}
                    },
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(312, 56),
                        backgroundColor: const Color.fromRGBO(81, 103, 235, 1)),
                    child: Text(
                      'Create an account',
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
                        'Existing user? ',
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
                                  builder: (context) => const LoginPage()));
                        },
                        child: Text(
                          'Log In',
                          style: GoogleFonts.poppins(
                              decoration: TextDecoration.underline,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: const Color.fromRGBO(42, 29, 139, 1)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
