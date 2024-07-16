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
    {"subject": 'Science', "source": "Drishti IAS", "notes": "8"},
    {
      "subject": 'Mordern Indian History',
      "source": "Drishti IAS",
      "notes": "8"
    },
    {"subject": 'Physical Geography', "source": "Drishti IAS", "notes": "8"},
    {"subject": 'Indian Constitution', "source": "Drishti IAS", "notes": "8"},
    {
      "subject": 'International Relations',
      "source": "Drishti IAS",
      "notes": "8"
    },
    {"subject": 'Agriculture', "source": "Drishti IAS", "notes": "8"},
    {"subject": 'Economics', "source": "Drishti IAS", "notes": "8"},
    {"subject": 'Philosophy', "source": "Drishti IAS", "notes": "8"},
    {"subject": 'Public Administration', "source": "Drishti IAS", "notes": "8"},
    {"subject": 'Sociology', "source": "Drishti IAS", "notes": "8"},
    {"subject": 'Mathematics', "source": "Drishti IAS", "notes": "8"},
    {"subject": 'Law', "source": "Drishti IAS", "notes": "8"},
    {"subject": 'Anthropology', "source": "Drishti IAS", "notes": "8"},
    {"subject": 'Enviromental Studies', "source": "Drishti IAS", "notes": "8"}
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: subjects.length,
      itemBuilder: (context, index) {
        return Container(
          decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey, width: 1))),
          child: ListTile(
            title: Text(subjects[index]['subject']!),
            subtitle: Text(subjects[index]['source']!),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "${subjects[index]['notes']!} notes",
                  style: GoogleFonts.rubik(fontSize: 14),
                ),
                const Icon(
                  Icons.keyboard_arrow_right,
                  size: 25,
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NoteTopic(),
                  ));
            },
          ),
        );
      },
    );
  }
}
