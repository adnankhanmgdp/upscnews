import 'package:flutter/material.dart';
import 'package:upscnews/screens/homepage.dart';
import 'package:upscnews/screens/loginpage.dart';
import 'package:upscnews/screens/otpVerification.dart';

void main() {
  runApp(const UpscNews());
}

class UpscNews extends StatefulWidget {
  const UpscNews({super.key});

  @override
  State<UpscNews> createState() => _UpscNewsState();
}

class _UpscNewsState extends State<UpscNews> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "UPSC News",
      theme: ThemeData(primarySwatch: Colors.purple),
      routes: {
        "/": (context) => const LoginPage(),
        "/otpVerify": (context) => const OTPVerification(),
        "/home": (context) => const HomePage()
      },
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
    );
  }
}
