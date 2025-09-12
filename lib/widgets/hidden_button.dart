import 'package:flutter/material.dart';

class HiddenButton extends StatelessWidget {
  final String text;
  final Image icon;
  final void Function()? onPressed;
  const HiddenButton({
    super.key,
    required this.text,
    required this.icon,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed ?? () {},
      child: Container(
        padding: const EdgeInsets.all(10),
        constraints: const BoxConstraints.tightFor(width: 100, height: 80),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            const SizedBox(height: 10),
            Text(
              text,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
