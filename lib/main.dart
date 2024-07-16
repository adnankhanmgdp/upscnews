import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:upscnews/screens/homepage.dart';
import 'package:upscnews/screens/loginpage.dart';
import 'package:upscnews/screens/otpVerification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
  }
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
        "/home": (context) => const LoginPage(),
        "/otpVerify": (context) => const OTPVerification(),
        "/": (context) => const HomePage()
      },
      initialRoute: "/",
      debugShowCheckedModeBanner: false,
    );
  }
}
