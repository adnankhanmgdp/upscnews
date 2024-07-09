import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(35)),
              child: const CircleAvatar(
                radius: 20,
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.menu_book_sharp,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              "UPSC News",
              style: GoogleFonts.rubik(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
          ],
        ),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        // color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    HeaderTabs(
                      text: "Today",
                      func: () {
                        setState(() {
                          selectedIndex = 0;
                        });
                      },
                      index: 0,
                    ),
                    HeaderTabs(
                      text: "Today",
                      func: () {
                        setState(() {
                          selectedIndex = 1;
                        });
                      },
                      index: 1,
                    ),
                    HeaderTabs(
                      text: "Today",
                      func: () {
                        setState(() {
                          selectedIndex = 2;
                        });
                      },
                      index: 2,
                    ),
                    HeaderTabs(
                      text: "Today",
                      func: () {
                        setState(() {
                          selectedIndex = 3;
                        });
                      },
                      index: 3,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget HeaderTabs(
      {required void Function() func,
      required String text,
      required int index}) {
    return GestureDetector(
      onTap: func,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
            color:
                (index == selectedIndex) ? Colors.black : Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20)),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Text(
          text,
          style: GoogleFonts.rubik(
              color: (index == selectedIndex) ? Colors.white : Colors.black,
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
