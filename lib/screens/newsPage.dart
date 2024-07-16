import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progressive_image/progressive_image.dart';

class NewsPage extends StatefulWidget {
  final String imageUrl;
  final String newsTitle;
  final String category;
  final String source;
  final String thumbnail;
  final String date;
  final String newsData;
  const NewsPage(
      {super.key,
      required this.imageUrl,
      required this.newsTitle,
      required this.category,
      required this.source,
      required this.thumbnail,
      required this.date,
      required this.newsData});
  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
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
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
        child: SingleChildScrollView(
          child: Card(
            color: Colors.white,
            elevation: 2,
            child: Container(
              padding: const EdgeInsets.all(5.0),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: ProgressiveImage(
                        placeholder: const AssetImage(
                            "assets/images/placeholder_image.webp"),
                        thumbnail: NetworkImage(widget.thumbnail),
                        image: NetworkImage(widget.imageUrl),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.width * 0.5),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: Text(
                      widget.newsTitle,
                      style: GoogleFonts.rubik(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Category: ${widget.category}",
                          style: GoogleFonts.rubik(
                              fontSize: 12, color: Colors.grey),
                        ),
                        Text(
                          "Source: ${widget.source}",
                          style: GoogleFonts.rubik(
                              fontSize: 12, color: Colors.grey),
                        ),
                        Text(
                          widget.date,
                          style: GoogleFonts.rubik(
                              fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 20),
                    child: Text(
                      widget.newsData,
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.rubik(
                          fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
