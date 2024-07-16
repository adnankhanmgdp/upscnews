import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progressive_image/progressive_image.dart';
import 'package:upscnews/screens/homepage.dart';
import 'package:upscnews/screens/newsPage.dart';

class Allnews extends StatefulWidget {
  const Allnews({super.key});

  @override
  State<Allnews> createState() => _AllnewsState();
}

class _AllnewsState extends State<Allnews> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: SingleChildScrollView(
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
                    text: "Yesterday",
                    func: () {
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                    index: 1,
                  ),
                  HeaderTabs(
                    text: "This week",
                    func: () {
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                    index: 2,
                  ),
                  HeaderTabs(
                    text: "This month",
                    func: () {
                      setState(() {
                        selectedIndex = 3;
                      });
                    },
                    index: 3,
                  ),
                  HeaderTabs(
                    text: "This year",
                    func: () {
                      setState(() {
                        selectedIndex = 4;
                      });
                    },
                    index: 4,
                  ),
                ],
              ),
            ),
          ),
          const CategoryButton(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                BreakingNewsCard(
                    imageUrl:
                        "https://images.indianexpress.com/2024/07/k-chandrasekhar-rao.jpg",
                    thumbnail:
                        "https://images.indianexpress.com/2024/07/k-chandrasekhar-rao.jpg",
                    title:
                        "Battered BRS explores alliance with BJP, but pushback from other side"),
                BreakingNewsCard(
                    imageUrl:
                        "https://images.indianexpress.com/2024/07/k-chandrasekhar-rao.jpg",
                    thumbnail:
                        "https://images.indianexpress.com/2024/07/k-chandrasekhar-rao.jpg",
                    title:
                        "Battered BRS explores alliance with BJP, but pushback from other side"),
                BreakingNewsCard(
                    imageUrl:
                        "https://images.indianexpress.com/2024/07/k-chandrasekhar-rao.jpg",
                    thumbnail:
                        "https://images.indianexpress.com/2024/07/k-chandrasekhar-rao.jpg",
                    title:
                        "Battered BRS explores alliance with BJP, but pushback from other side"),
              ],
            ),
          ),
          for (int i = 0; i < 4; i++)
            NewsCard(
                imageUrl:
                    "https://images.indianexpress.com/2024/07/k-chandrasekhar-rao.jpg",
                thumbnail:
                    "https://images.indianexpress.com/2024/07/k-chandrasekhar-rao.jpg",
                newsTitle:
                    "Battered BRS explores alliance with BJP, but pushback from other side",
                category: "Politics",
                source: "The Hindu",
                date: "15 March, 2024",
                newsData:
                    "A paragraph is a series of sentences that are organized and coherent, and are all related to a single topic. Almost every piece of writing you do that is longer than a few sentences should be organized into paragraphs. This is because paragraphs show a reader where the subdivisions of an essay begin and end, and thus help the reader see the organization of the essay and grasp its main points. Paragraphs can contain many different kinds of information. A paragraph could contain a series of brief examples or a single long illustration of a general point. It might describe a place, character, or process; narrate a series of events; compare or contrast two or more things; classify items into categories; or describe causes and effects. Regardless of the kind of information they contain, all paragraphs share certain characteristics. One of the most important of these is a topic sentence."),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              textAlign: TextAlign.center,
              "Developed by a UPSC Aspirant\nMade with ❤️ in India 🇮🇳",
              style: GoogleFonts.rubik(
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget BreakingNewsCard(
      {required String title,
      required String imageUrl,
      required String thumbnail}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
          child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: ProgressiveImage(
                placeholder:
                    const AssetImage("assets/images/placeholder_image.webp"),
                thumbnail: NetworkImage(thumbnail),
                image: NetworkImage(imageUrl),
                width: MediaQuery.of(context).size.width * 0.9,
                height: MediaQuery.of(context).size.width * 0.5),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
                color: Color.fromARGB(137, 0, 0, 0),
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5))),
            child: Text(
              title,
              style: GoogleFonts.rubik(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      )),
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

  Widget NewsCard(
      {required String imageUrl,
      required String newsTitle,
      required String category,
      required String source,
      required String thumbnail,
      required String date,
      required String newsData}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NewsPage(
                      imageUrl: imageUrl,
                      newsData: newsData,
                      newsTitle: newsTitle,
                      category: category,
                      source: source,
                      date: date,
                      thumbnail: thumbnail,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          color: Colors.white,
          elevation: 2,
          child: Container(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(3),
                      child: ProgressiveImage(
                          placeholder: const AssetImage(
                              "assets/images/placeholder_image.webp"),
                          thumbnail: NetworkImage(thumbnail),
                          image: NetworkImage(imageUrl),
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: MediaQuery.of(context).size.width * 0.22),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 7,
                              ),
                              child: Text(
                                textAlign: TextAlign.left,
                                newsTitle,
                                style: GoogleFonts.rubik(
                                    fontSize: 18, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 3),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.grey,
                  height: 1,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Category: $category",
                        style:
                            GoogleFonts.rubik(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        "Source: $source",
                        style:
                            GoogleFonts.rubik(fontSize: 12, color: Colors.grey),
                      ),
                      Text(
                        date,
                        style:
                            GoogleFonts.rubik(fontSize: 12, color: Colors.grey),
                      ),
                    ],
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
