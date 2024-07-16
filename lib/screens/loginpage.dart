import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upscnews/utils/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _phoneController =
      TextEditingController(text: AppConstants.phone);
  bool onTap = false;
  final _formKey = GlobalKey<FormState>();
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text("UPSC News",
              style: GoogleFonts.anton(
                  letterSpacing: 1,
                  fontWeight: FontWeight.w200,
                  color: Colors.white)),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 80,
              ),
              const Center(
                child: CircleAvatar(
                  radius: 70,
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.menu_book_sharp,
                    color: Colors.white,
                    size: 100,
                  ),
                ),
              ),
              Center(
                child: Text(
                  "UPSC News",
                  style: GoogleFonts.rubik(
                      fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Text(
                "Login with your phone number",
                style: GoogleFonts.rubik(
                    fontSize: 18, fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 15,
              ),
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: _phoneController,
                  focusNode: focusNode,
                  // maxLength: 10,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  decoration: InputDecoration(
                      // hintText: "Phone number",
                      enabledBorder: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(),
                      errorBorder: const OutlineInputBorder(),
                      border: const OutlineInputBorder(),
                      label: const Text("Phone number"),
                      labelStyle: GoogleFonts.rubik(color: Colors.black),
                      prefix: const Text("+91 ")),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value!.isEmpty) return "Enter your phone number";
                    if (value.length != 10)
                      return "Enter 10-digit phone number";

                    return null;
                  },
                  onChanged: (value) {
                    _phoneController.text = value.trim();
                    if (value.length > 10) {
                      _phoneController.text = value.substring(0, 10);
                    }
                    if (value.endsWith("-")) {
                      _phoneController.text =
                          value.substring(0, value.length - 1);
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  if (!onTap) {
                    setState(() {
                      onTap = true;
                    });
                    if (_formKey.currentState!.validate()) {
                      // If the form is valid, display a snackbar. In the real world,
                      // you'd often call a server or save the information in a database.
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                'Sending OTP to +91 ${_phoneController.text}')),
                      );
                      AppConstants.phone = _phoneController.text;
                      Navigator.pushReplacementNamed(context, "/otpVerify");
                    } else {
                      focusNode.requestFocus();
                      setState(() {
                        onTap = !onTap;
                      });
                    }
                  }
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.black,
                  ),
                  child: Center(
                    child: (onTap)
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 1.5,
                            ),
                          )
                        : Text(
                            "Continue",
                            style: GoogleFonts.rubik(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                textAlign: TextAlign.center,
                "By clicking on continue button, you agree to our terms and conditions",
                style: GoogleFonts.rubik(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.2,
              ),
              Center(
                child: Text(
                  textAlign: TextAlign.center,
                  "Developed by a UPSC Aspirant\nMade with ❤️ in India 🇮🇳",
                  style: GoogleFonts.rubik(
                    color: Colors.grey,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
