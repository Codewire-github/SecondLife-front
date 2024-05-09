import 'package:flutter/material.dart';

class CustomLargeButton extends StatelessWidget {
  final String label;
  final Function() onPressed;
  const CustomLargeButton(
      {super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.8,
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 10, 150, 71),
            borderRadius: BorderRadius.circular(22.5)),
        child: TextButton(
          onPressed: onPressed,
          child: Text(
            label,
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ));
  }
}
