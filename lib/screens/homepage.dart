import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upscnews/screens/allNews.dart';
import 'package:upscnews/screens/dashboard.dart';
import 'package:upscnews/screens/notesPage.dart';
import 'package:upscnews/screens/profilePage.dart';
import 'package:upscnews/screens/quizpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int bottomIndex = 0;
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
          child: (bottomIndex == 0)
              ? const DashBoard()
              : (bottomIndex == 1)
                  ? const Allnews()
                  : (bottomIndex == 2)
                      ? const QuizPage()
                      : (bottomIndex == 3)
                          ? const NotesPage()
                          : const ProfilePage()),
      bottomNavigationBar: BottomBar(),
      floatingActionButton: FloatingActionButton(
          onPressed: _renderShowModal,
          shape: const CircleBorder(),
          backgroundColor: Colors.black,
          child: Container(
            decoration: const BoxDecoration(
                color: Colors.white, shape: BoxShape.circle),
            // padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.all(2),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: const Padding(
                padding: EdgeInsets.all(4),
                child: Image(
                  image: AssetImage("assets/images/ai-assistant.gif"),
                ),
              ),
            ),
          )),
    );
  }

  _renderShowModal() {
    return showModalBottomSheet(
      // showDragHandle: true,
      context: context,
      isDismissible: false,
      enableDrag: false,
      // isDismissible: false,
      barrierColor: const Color.fromARGB(208, 0, 0, 0),
      backgroundColor: Colors.transparent,
      builder: (context) => Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: const Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 30,
                  )),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "UPSC Topper AI Coming Soon",
                    style: GoogleFonts.rubik(
                        color: Colors.red,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      textAlign: TextAlign.center,
                      "You can ask any question related to UPSC with\nUPSC Topper AI",
                      style: GoogleFonts.rubik(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget BottomBar() {
    return NavigationBar(
      backgroundColor: Colors.black,
      elevation: 0,
      // onDestinationSelected: (value) {
      //   setState(() {
      //     bottomIndex = value;
      //     print(value);
      //   });
      // },
      selectedIndex: bottomIndex,
      surfaceTintColor: Colors.white,
      indicatorColor: Colors.black,
      destinations: [
        CustomNavigationBarItem(
            index: 0, icon: Icons.home_rounded, label: "Home"),
        CustomNavigationBarItem(index: 1, icon: Icons.newspaper, label: "News"),
        CustomNavigationBarItem(
            index: 2, icon: Icons.checklist_rounded, label: "Quiz"),
        CustomNavigationBarItem(
            index: 3, icon: Icons.note_alt_rounded, label: "Notes"),
        CustomNavigationBarItem(
            index: 4, icon: Icons.person_rounded, label: "Profile"),
      ],
    );
  }

  Widget CustomNavigationBarItem(
      {required int index, required IconData icon, required String label}) {
    return IconButton(
      onPressed: () {
        setState(() {
          bottomIndex = index;
        });
      },
      icon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: (index == bottomIndex) ? Colors.white : Colors.grey,
              size: (index == bottomIndex) ? 22 : 20,
            ),
            SizedBox(
              height: (bottomIndex == index) ? 0 : 3,
            ),
            Text(
              label,
              style: GoogleFonts.rubik(
                  color: (index == bottomIndex) ? Colors.white : Colors.grey,
                  fontSize: (index == bottomIndex) ? 14 : 12),
            )
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatefulWidget {
  const CategoryButton({super.key});

  @override
  State<CategoryButton> createState() => CategoryButtonState();
}

class CategoryButtonState extends State<CategoryButton> {
  final List<String> items = [
    'All News',
    'Politics',
    'International',
    'Sports',
  ];
  String? selectedValue;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Breaking News",
            style: GoogleFonts.rubik(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Category: ",
                style: GoogleFonts.rubik(),
              ),
              DropdownButton2<String>(
                hint: Text(
                  'All News',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: items
                    .map((String item) => DropdownMenuItem(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                value: selectedValue,
                onChanged: (String? value) {
                  setState(() {
                    selectedValue = value;
                  });
                  print(value);
                },
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  height: 40,
                  width: 140,
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
