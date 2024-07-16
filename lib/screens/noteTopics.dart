import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteTopic extends StatefulWidget {
  const NoteTopic({super.key});

  @override
  State<NoteTopic> createState() => _NoteTopicState();
}

class _NoteTopicState extends State<NoteTopic> {
  List<Map<String, String>> topics = [
    {
      "topic": "Indus Valley Civilization",
      "image":
          "https://m.media-amazon.com/images/I/71eCLdAkkFL._AC_UF1000,1000_QL80_.jpg",
    },
    {
      "topic": "Later Vedic Period",
      "image":
          "https://m.media-amazon.com/images/I/71eCLdAkkFL._AC_UF1000,1000_QL80_.jpg",
    },
    {
      "topic": "Mahajanapadas",
      "image":
          "https://m.media-amazon.com/images/I/71eCLdAkkFL._AC_UF1000,1000_QL80_.jpg",
    },
    {
      "topic": "Mauryan Empire",
      "image":
          "https://m.media-amazon.com/images/I/71eCLdAkkFL._AC_UF1000,1000_QL80_.jpg",
    },
    {
      "topic": "Medieval India",
      "image":
          "https://m.media-amazon.com/images/I/71eCLdAkkFL._AC_UF1000,1000_QL80_.jpg",
    },
    {
      "topic": "Mughal Architecture",
      "image":
          "https://m.media-amazon.com/images/I/71eCLdAkkFL._AC_UF1000,1000_QL80_.jpg",
    },
    {
      "topic": "Regional states during Gupta Era",
      "image":
          "https://m.media-amazon.com/images/I/71eCLdAkkFL._AC_UF1000,1000_QL80_.jpg",
    },
    {
      "topic": "Sangam Age",
      "image":
          "https://m.media-amazon.com/images/I/71eCLdAkkFL._AC_UF1000,1000_QL80_.jpg",
    },
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
        body: Padding(
          padding: const EdgeInsets.all(5),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 0.88, crossAxisCount: 2),
              itemCount: topics.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(3.0),
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
                                image: NetworkImage(topics[index]['image']!),
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
                                topics[index]['topic']!,
                                style: GoogleFonts.rubik(fontSize: 16),
                              ),
                            ),
                          )
                        ],
                      )),
                );
              }),
        ));
  }
}
