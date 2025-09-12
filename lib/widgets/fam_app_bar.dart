import 'package:flutter/material.dart';

class FamAppBar extends StatelessWidget implements PreferredSizeWidget {
  const FamAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      surfaceTintColor: Colors.white,
      title: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 25,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
              children: [
                const TextSpan(text: "fampay"),
                WidgetSpan(
                  child: Image.asset("assets/logo.png", height: 30),
                  alignment: PlaceholderAlignment.top,
                ),
              ],
            ),
          ),
        ],
      ),
      centerTitle: true,
    );
  }
}
