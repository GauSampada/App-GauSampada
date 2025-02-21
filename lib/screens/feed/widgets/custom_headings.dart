import 'package:flutter/material.dart';

class CustomHeadingsScreen extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  const CustomHeadingsScreen(
      {super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
          ),
        ),
        Spacer(),
        TextButton(onPressed: () {}, child: Text("View All"))
      ],
    );
  }
}
