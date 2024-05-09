import 'package:flutter/material.dart';

class AskQuestionScreen extends StatefulWidget {
  const AskQuestionScreen({super.key});

  @override
  State<AskQuestionScreen> createState() => _AskQuestionScreenState();
}

class _AskQuestionScreenState extends State<AskQuestionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Ask question"),
      ),
    );
  }
}
