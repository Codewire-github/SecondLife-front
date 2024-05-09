import 'package:flutter/material.dart';
import 'package:secondlife/common/widgets/back_button.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomBackButton(),
            Container(
                height: MediaQuery.sizeOf(context).height * 0.54,
                child: Image.asset("assets/img/signupscreen/location.png")),
            Text(
              "Where are you located ?",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ]),
    );
  }
}
