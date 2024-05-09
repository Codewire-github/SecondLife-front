import 'dart:io';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:secondlife/screens/info_screen/info_s/info_screen.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;

  File? _image;
  bool isFlashOn = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
    setState(() {
      _image = null;
    });
  }

  Future<void> _takePicture() async {
    try {
      final image = await _controller!.takePicture();

      await _controller!.dispose();
      await _updateImage(File(image.path));
      if (_image != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (BuildContext context) => InfoScreen()),
        );
      }
      await _initializeCamera();
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> _updateImage(File imageFile) async {
    setState(() {
      _image = imageFile;
    });
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.first;

    _controller = CameraController(firstCamera, ResolutionPreset.high);

    // Next, initialize the controller. This returns a Future.
    try {
      await _controller!.initialize().then((_) {
        if (!mounted) return;
        setState(() {});
      });
    } on CameraException catch (e) {
      debugPrint("camera error $e");
    }
  }

  void toggleFlash() async {
    if (_controller!.value.isInitialized) {
      if (!isFlashOn) {
        await _controller?.setFlashMode(FlashMode.torch);
      } else {
        await _controller?.setFlashMode(FlashMode.off);
      }
      setState(() {
        isFlashOn = !isFlashOn;
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.black,
      body: Stack(children: [
        Stack(
          children: [
            Container(
                height: double.infinity,
                width: double.infinity,
                margin: EdgeInsets.only(bottom: 90),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Container(
                      height: 100,
                      child: _controller!.value.isInitialized
                          ? CameraPreview(_controller!)
                          : const Center(
                              child: CircularProgressIndicator(),
                            )),
                )),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.only(top: 50, left: 20),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black.withOpacity(0.7),
                    ),
                    child: IconButton(
                      onPressed: () => {Get.back()},
                      icon: const Icon(
                        Icons.arrow_back_ios_new,
                        size: 25,
                        color: Colors.white,
                      ),
                    ),
                  )),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                  padding: const EdgeInsets.only(top: 50, right: 20),
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.black.withOpacity(0.7),
                    ),
                    child: IconButton(
                      onPressed: () {
                        toggleFlash();
                      },
                      icon: Icon(
                        Icons.flash_on,
                        size: 25,
                        color: isFlashOn ? Colors.orange : Colors.grey[400],
                      ),
                    ),
                  )),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                  padding: const EdgeInsets.only(bottom: 110),
                  child: GestureDetector(
                    onTap: () async {
                      await _takePicture();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => InfoScreen()),
                      );
                    },
                    child: Container(
                      height: 90,
                      width: 90,
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.transparent,
                          border: Border.all(
                            color: Colors.white,
                            width: 4,
                          )),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ]),
    );
  }
}
