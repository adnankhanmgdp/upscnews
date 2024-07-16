import 'dart:core';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}

class _quizResults {
  final String x;
  final double y;
  _quizResults(this.x, this.y);
}

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  late List<_ChartData> data;
  late List<_quizResults> quizData;
  late TooltipBehavior _tooltip;
  late TooltipBehavior _Quiztooltip;

  List<YoutubePlayerController> controllers = [
    YoutubePlayerController(
      params: const YoutubePlayerParams(
        mute: false,
        showControls: true,
        showFullscreenButton: true,
      ),
    ),
    YoutubePlayerController(
      params: const YoutubePlayerParams(
        mute: false,
        showControls: true,
        showFullscreenButton: true,
      ),
    ),
  ];

  @override
  void initState() {
    super.initState();
    controllers[0].cueVideoById(videoId: "lsJBGvyiAHI");
    controllers[1].cueVideoById(videoId: "LVlOH1EwD7o");
    // InAppWebViewPlatform.instance = InAppWebViewPlatform.instance;
    data = [
      _ChartData('used', 25),
      _ChartData('left', 5),
    ];
    quizData = [
      _quizResults("Mon", 6),
      _quizResults("Tue", 7),
      _quizResults("Wed", 8),
      _quizResults("Thu", 10),
      _quizResults("Fri", 8),
      _quizResults("Sat", 9),
      _quizResults("Sun", 8),
    ];
    _tooltip = TooltipBehavior(
      enable: true,
      builder: (data, point, series, pointIndex, seriesIndex) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "${data.x}: ${data.y.truncate()} days",
            style: GoogleFonts.rubik(color: Colors.white),
          ),
        );
      },
    );
    _Quiztooltip = TooltipBehavior(
      enable: true,
      builder: (data, point, series, pointIndex, seriesIndex) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "${data.x}: ${data.y.truncate()}/10 Marks",
            style: GoogleFonts.rubik(color: Colors.white),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 6),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                " Welcome, Zuhaib 👋",
                style: GoogleFonts.rubik(
                    fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  DashboardTopCard(
                      title: "Total News Read",
                      value: "25",
                      color: const Color.fromARGB(255, 255, 206, 203),
                      textColor: Colors.red),
                  DashboardTopCard(
                      title: "Total Quiz Completed",
                      value: "10",
                      color: const Color.fromARGB(255, 217, 255, 234),
                      textColor: Colors.green),
                  DashboardTopCard(
                      title: "Total Notes Opened",
                      value: "8",
                      color: const Color.fromARGB(255, 197, 229, 255),
                      textColor: Colors.blueAccent)
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                child: Text(
                  "Quiz Results",
                  style: GoogleFonts.rubik(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              SfCartesianChart(
                  primaryXAxis: const CategoryAxis(),
                  primaryYAxis:
                      const NumericAxis(minimum: 0, maximum: 12, interval: 2),
                  tooltipBehavior: _Quiztooltip,
                  series: <CartesianSeries<_quizResults, String>>[
                    ColumnSeries<_quizResults, String>(
                        dataSource: quizData,
                        xValueMapper: (_quizResults data, _) => data.x,
                        yValueMapper: (_quizResults data, _) => data.y,
                        name: 'Gold',
                        color: const Color.fromARGB(237, 0, 0, 0))
                  ]),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                child: Text(
                  "Topper's Approach",
                  style: GoogleFonts.rubik(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: YoutubePlayerScaffold(
                        controller: controllers[0],
                        autoFullScreen: false,
                        enableFullScreenOnVerticalDrag: false,
                        aspectRatio: 16 / 9,
                        builder: (context, player) {
                          return Column(
                            children: [
                              player,
                            ],
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: YoutubePlayerScaffold(
                        controller: controllers[1],
                        autoFullScreen: false,
                        enableFullScreenOnVerticalDrag: false,
                        aspectRatio: 16 / 9,
                        builder: (context, player) {
                          return Column(
                            children: [
                              player,
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
                child: Text(
                  "Subscription Details",
                  style: GoogleFonts.rubik(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
              Center(
                child: SfCircularChart(
                    tooltipBehavior: _tooltip,
                    onTooltipRender: (tooltipArgs) {},
                    margin: const EdgeInsets.all(0),
                    // backgroundColor: Colors.black,
                    palette: [
                      Colors.grey.shade300,
                      const Color.fromARGB(242, 0, 0, 0)
                    ],
                    series: <CircularSeries<_ChartData, String>>[
                      DoughnutSeries<_ChartData, String>(
                        dataSource: data,
                        xValueMapper: (_ChartData data, _) => data.x,
                        yValueMapper: (_ChartData data, _) => data.y,
                        name: 'Gold',
                        // dataLabelSettings: DataLabelSettings(
                        //   isVisible: true,
                        //   color: Colors.white,
                        //   builder:
                        //       (data, point, series, pointIndex, seriesIndex) {
                        //     return Text(
                        //       textAlign: TextAlign.center,
                        //       "${data.y}\ndays",
                        //       style: GoogleFonts.rubik(
                        //           color: Colors.grey.shade500),
                        //     );
                        //   },
                        // ),
                      )
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget DashboardTopCard(
      {required String title,
      required String value,
      required Color color,
      required Color textColor}) {
    return SizedBox(
      width: MediaQuery.of(context).size.width / 3.1,
      height: MediaQuery.of(context).size.width / 3.1,
      child: Card(
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: GoogleFonts.rubik(
                    color: textColor, fontWeight: FontWeight.w500),
              ),
            ),
            Text(
              value,
              style: GoogleFonts.rubik(
                  color: textColor, fontSize: 30, fontWeight: FontWeight.w500),
            )
          ],
        ),
      ),
    );
  }
}
