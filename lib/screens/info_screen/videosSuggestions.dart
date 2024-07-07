import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:secondlife/API/user_requests.dart';
import 'package:secondlife/common/widgets/back_button.dart';
import 'package:secondlife/common/widgets/customButtons.dart';
import 'package:secondlife/screens/QR/qr_scan_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class VideoSuggestionsScreen extends StatefulWidget {
  final String detectedObject;
  const VideoSuggestionsScreen({super.key, required this.detectedObject});

  @override
  State<VideoSuggestionsScreen> createState() => _VideoSuggestionsScreenState();
}

class _VideoSuggestionsScreenState extends State<VideoSuggestionsScreen> {
  List<dynamic> videosData = [];

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  void initializeData() async {
    UserApiService userApiService = UserApiService();
    List<dynamic> tempData =
        await userApiService.getRecycleVideos(widget.detectedObject);
    if (tempData != null) {
      setState(() {
        videosData = tempData;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              CustomBackButton(),
              Text(
                "Some related videos about recycling",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.all(20),
                  children: videosData.asMap().entries.map((entry) {
                    Map<String, dynamic> video = entry.value;
                    return GestureDetector(
                      onTap: () {
                        _launchURL(video['url']);
                      },
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 0, 0, 0),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.network(
                              video['image'],
                              width: 120,
                              height: 90,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    video['title'],
                                    style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    video['author'],
                                    style: TextStyle(color: Colors.grey[400]),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: CustomLargeButton(
                label: "Move forward to recycle",
                onPressed: () {
                  Get.to(() => QRScanScreen());
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
