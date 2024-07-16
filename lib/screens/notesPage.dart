import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:upscnews/screens/noteTopics.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List<Map<String, String>> subjects = [
    {
      "subject": 'Science',
      "image": "science.png",
    },
    {
      "subject": 'Mordern Indian History',
      "image": "History.png",
    },
    {
      "subject": 'Physical Geography',
      "image": "geography.png",
    },
    {
      "subject": 'Indian Constitution',
      "image": "Constitution.png",
    },
    {
      "subject": 'International Relations',
      "image": "International Relations.png",
    },
    {
      "subject": 'Agriculture',
      "image": "Agriculture.png",
    },
    {
      "subject": 'Economics',
      "image": "Economics.png",
    },
    {
      "subject": 'Philosophy',
      "image": "Philosophy.png",
    },
    {
      "subject": 'Public Administration',
      "image": "Public Administration.png",
    },
    {
      "subject": 'Sociology',
      "image": "Sociology.png",
    },
    {
      "subject": 'Mathematics',
      "image": "Mathematics.png",
    },
    {
      "subject": 'Law',
      "image": "Law.png",
    },
    {
      "subject": 'Anthropology',
      "image": "Anthropology.png",
    },
    {
      "subject": 'Enviromental Studies',
      "image": "Enviromental Studies.png",
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.88, crossAxisCount: 2),
          itemCount: subjects.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(3.0),
              child: GestureDetector(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NoteTopic(),
                    )),
                child: Card(
                    color: Colors.white,
                    elevation: 2,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.width * 0.4,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10)),
                            child: Image(
                              image: AssetImage(
                                  "assets/images/${subjects[index]['image']!}"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Container(
                          height: 48,
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Center(
                            child: Text(
                              overflow: TextOverflow.fade,
                              textAlign: TextAlign.center,
                              subjects[index]['subject']!,
                              style: GoogleFonts.rubik(fontSize: 16),
                            ),
                          ),
                        )
                      ],
                    )),
              ),
            );
          }),
    );
  }
}
