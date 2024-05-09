import 'package:flutter/material.dart';

class ReduceScreen extends StatefulWidget {
  const ReduceScreen({super.key});

  @override
  State<ReduceScreen> createState() => _ReduceScreenState();
}

class _ReduceScreenState extends State<ReduceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Reduce"),
            Text(
                "Lessen the amount of waste produced by using less of the Earth's natural resources."),
            Container(
                width: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromARGB(255, 10, 150, 71),
                ),
                child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Continue",
                      style: TextStyle(color: Colors.white),
                    )))
          ],
        ),
      ),
    );
  }
}
