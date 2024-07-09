import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:upscnews/utils/constants.dart';

class OTPVerification extends StatefulWidget {
  const OTPVerification({super.key});

  @override
  State<OTPVerification> createState() => _OTPVerificationState();
}

class _OTPVerificationState extends State<OTPVerification> {
  final TextEditingController _otpController = TextEditingController();
  bool onTap = false;
  final _formKey = GlobalKey<FormState>();
  FocusNode focusNode = FocusNode();
  String OTP = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    OTP = AppConstants.OTP;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.menu_book_sharp,
                        color: Colors.white,
                        size: 50,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Text(
                      "UPSC News",
                      style: GoogleFonts.rubik(
                          fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    "A 6-digit OTP has been sent to your phone",
                    style: GoogleFonts.rubik(
                        fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      "+91 ${AppConstants.phone}",
                      style: GoogleFonts.rubik(
                          fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, "/");
                      },
                      child: Text(
                        textAlign: TextAlign.center,
                        "Edit ",
                        style: GoogleFonts.rubik(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey),
                      ),
                    ),
                    const Icon(
                      Icons.edit_rounded,
                      size: 15,
                      color: Colors.grey,
                    )
                  ],
                ),
                const SizedBox(
                  height: 110,
                ),
                Form(
                    key: _formKey,
                    child: Center(
                      child: Pinput(
                        controller: _otpController,
                        defaultPinTheme: PinTheme(
                            width: 45,
                            height: 45,
                            textStyle: GoogleFonts.rubik(
                              fontSize: 20,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Colors.grey.shade200)),
                        focusedPinTheme: PinTheme(
                            width: 45,
                            height: 45,
                            textStyle: GoogleFonts.rubik(
                              fontSize: 20,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(width: 1.5),
                                color: Colors.grey.shade200)),
                        submittedPinTheme: PinTheme(
                            width: 45,
                            height: 45,
                            textStyle: GoogleFonts.rubik(
                              fontSize: 20,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(
                                    width: 1.5, color: Colors.grey.shade400),
                                color: Colors.grey.shade200)),
                        errorPinTheme: PinTheme(
                            width: 45,
                            height: 45,
                            textStyle: GoogleFonts.rubik(
                              fontSize: 20,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                border:
                                    Border.all(width: 1.5, color: Colors.red),
                                color: Colors.grey.shade200)),
                        pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                        validator: (value) {
                          if (value!.length < 6) {
                            return "Enter 6-digit OTP sent through SMS";
                          }
                          return null;
                        },
                        onChanged: (value) {
                          _otpController.value =
                              TextEditingValue(text: value.trim());
                          if (value.endsWith('-')) {
                            _otpController.value = TextEditingValue(
                                text: value.substring(0, value.length - 1));
                          }
                        },
                        length: 6,
                      ),
                    )),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: GestureDetector(
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
                                content: (_otpController.text == OTP)
                                    ? const Text('OTP verified')
                                    : const Text("Incorrect OTP")),
                          );
                          if (_otpController.text == OTP) {
                            Navigator.pushReplacementNamed(context, "/home");
                          } else {
                            setState(() {
                              onTap = false;
                            });
                          }
                        } else {
                          focusNode.requestFocus();
                          setState(() {
                            onTap = !onTap;
                          });
                        }
                      }
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.75,
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
                                "Verify OTP",
                                style: GoogleFonts.rubik(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600),
                              ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
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
      ),
    );
  }
}
