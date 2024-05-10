import 'package:flutter/material.dart';
import 'package:secondlife/common/widgets/back_button.dart';
import 'package:secondlife/common/widgets/customButtons.dart';

class VideoSuggestionsScreen extends StatefulWidget {
  const VideoSuggestionsScreen({super.key});

  @override
  State<VideoSuggestionsScreen> createState() => _VideoSuggestionsScreenState();
}

class _VideoSuggestionsScreenState extends State<VideoSuggestionsScreen> {
  List<Map<String, String>> dummyVideoData = [
    {
      "videoLink": 'https://www.youtube.com/watch?v=abcdef12345',
      "author": 'John Doe',
      "title": 'Flutter Tutorial for Beginners',
    },
    {
      "videoLink": 'https://www.youtube.com/watch?v=ghijkl67890',
      "author": 'Jane Smith',
      "title": 'Advanced Flutter State Management',
    },
  ];
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
              Container(
                alignment: Alignment.center,
                child: Wrap(
                  spacing: 15,
                  runSpacing: 10.0,
                  children: dummyVideoData.asMap().entries.map((entry) {
                    Map<String, dynamic> video = entry.value;
                    return GestureDetector(
                      onTap: () {},
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 249, 255, 249),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [],
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
                  label: "Check for nearby locations", onPressed: () {}),
            ),
          )
        ],
      ),
    );
  }
}
