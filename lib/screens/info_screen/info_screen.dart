import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_mlkit_image_labeling/google_mlkit_image_labeling.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';
import 'package:secondlife/common/ML/ml.dart';
import 'package:secondlife/common/widgets/customButtons.dart';
import 'package:secondlife/screens/info_screen/guideScreen.dart';

class InfoScreen extends StatefulWidget {
  final File photo;
  const InfoScreen({super.key, required this.photo});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  late ImageLabeler imageLabeler;
  final DetectionMode _mode = DetectionMode.single;
  int noOfObjectsFound = 0;
  bool _canProcess = false;
  bool _isBusy = false;
  String _result = '';

  @override
  void initState() {
    super.initState();
    firsThingsToDo();
  }

  @override
  void dispose() {
    _canProcess = false;
    imageLabeler.close();
    super.dispose();
  }

  Future<void> firsThingsToDo() async {
    await _initializeLabeler();
    await _processImagev2(widget.photo);
  }

  @override
  Widget build(BuildContext context) {
    File selectedImage = widget.photo;
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: screenHeight * 0.4,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
          height: screenHeight * 0.6,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 232, 255, 223),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(45), topLeft: Radius.circular(45)),
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 8,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey[800],
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Plastic",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      )),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: CustomLargeButton(
                      label: "Recycle it",
                      onPressed: () {
                        Get.to(() => GuideScreen());
                      }),
                ),
              )
            ],
          ),
        )
      ],
    ));
  }

  Future<void> _initializeLabeler() async {
    final path = 'assets/ML/mobilenet.tflite';
    print("Model path: $path");
    final modelPath = await getModelPath(path);
    final options = LocalLabelerOptions(modelPath: modelPath);
    imageLabeler = ImageLabeler(options: options);
    _canProcess = true;
  }

  Future<void> _processImagev2(File imageSelected) async {
    if (!_canProcess) return;
    if (_isBusy) return;
    _isBusy = true;
    setState(() {
      _result = '';
    });
    final selectedImage = InputImage.fromFile(imageSelected);
    final labels = await imageLabeler.processImage(selectedImage);
    setState(() {
      noOfObjectsFound = labels.length;
    });

    String text = '';
    for (final label in labels) {
      text += '${label.label}';
    }
    print("I am running ===============================");
    print(text);
    setState(() {
      _result = text;
    });

    _isBusy = false;
    if (mounted) {
      setState(() {});
    }
  }
}
