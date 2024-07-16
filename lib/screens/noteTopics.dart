import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteTopic extends StatefulWidget {
  const NoteTopic({super.key});

  @override
  State<NoteTopic> createState() => _NoteTopicState();
}

class _NoteTopicState extends State<NoteTopic> {
  List<Map<String, dynamic>> topics = [
    {"topic": "Indus Valley Civilization", "source": "Drishti IAS", "notes": 8},
    {"topic": "Later Vedic Period", "source": "Drishti IAS", "notes": 8},
    {"topic": "Mahajanapadas", "source": "Drishti IAS", "notes": 8},
    {"topic": "Mauryan Empire", "source": "Drishti IAS", "notes": 8},
    {"topic": "Medieval India", "source": "Drishti IAS", "notes": 8},
    {"topic": "Mughal Architecture", "source": "Drishti IAS", "notes": 8},
    {
      "topic": "Regional states during Gupta Era",
      "source": "Drishti IAS",
      "notes": 8
    },
    {"topic": "Sangam Age", "source": "Drishti IAS", "notes": 8},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.keyboard_double_arrow_left,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(35)),
                child: const CircleAvatar(
                  radius: 17,
                  backgroundColor: Colors.black,
                  child: Icon(
                    Icons.menu_book_sharp,
                    color: Colors.white,
                    size: 25,
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
        body: ListView.builder(
          shrinkWrap: true,
          itemCount: topics.length,
          itemBuilder: (context, index) {
            return Container(
              decoration: const BoxDecoration(
                  border:
                      Border(bottom: BorderSide(color: Colors.grey, width: 1))),
              child: ListTile(
                title: Text(topics[index]['topic']!),
                subtitle: Text(topics[index]['source']!),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "${topics[index]['notes']!} notes",
                      style: GoogleFonts.rubik(fontSize: 14),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_right,
                      size: 25,
                    ),
                  ],
                ),
                onTap: () {},
              ),
            );
          },
        ));
  }
}
