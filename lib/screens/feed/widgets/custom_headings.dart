import 'package:flutter/material.dart';

class CustomHeadingsScreen extends StatelessWidget {
  final String label;
  final void Function()? onPressed;
  const CustomHeadingsScreen(
      {super.key, required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 12, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF2E3E5C),
            ),
          ),
          TextButton(
            onPressed: onPressed,
            child: const Text(
              "View All",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFF4A6CFA),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
