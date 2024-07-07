import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:secondlife/API/user_requests.dart';
import 'package:secondlife/common/colors.dart';
import 'package:secondlife/common/widgets/back_button.dart';
import 'package:secondlife/screens/info_screen/videosSuggestions.dart';

class GuideScreen extends StatefulWidget {
  final String detectedObject;
  const GuideScreen({Key? key, required this.detectedObject}) : super(key: key);

  @override
  State<GuideScreen> createState() => _GuideScreenState();
}

class _GuideScreenState extends State<GuideScreen> {
  int stepNo = 0;
  List<dynamic> responseData = [];

  String getButtonText(int stepNo) {
    if (stepNo == 0) {
      return "Let's get Started";
    } else if (stepNo == responseData.length - 1) {
      return "Done";
    } else {
      return "Next";
    }
  }

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  Future<void> initializeData() async {
    MLApiService mlApiService = MLApiService();
    List<dynamic> tipsData = await mlApiService.getTips(widget.detectedObject);
    setState(() {
      responseData = tipsData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomBackButton(),
          Text(
            "Steps for recycling",
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
          ),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => VideoSuggestionsScreen(
                                detectedObject: widget.detectedObject,
                              ));
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          padding: const EdgeInsets.fromLTRB(20, 12, 12, 12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: stepNo != responseData.length - 1
                                ? primaryGreenColor
                                : Colors.black,
                          ),
                          child: Row(
                            children: [
                              Text(
                                getButtonText(stepNo),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 20),
                              Icon(
                                stepNo == responseData.length - 1
                                    ? Icons.done_rounded
                                    : Icons.east_rounded,
                                color: Colors.white,
                                size: 25,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20), // Added SizedBox for spacing
                if (responseData.isNotEmpty)
                  SizedBox(
                    height: 600,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: responseData.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: ListTile(
                            title: Text(responseData[index]['title']),
                            subtitle: Text(responseData[index]['description']),
                          ),
                        );
                      },
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
