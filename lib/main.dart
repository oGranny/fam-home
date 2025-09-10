import 'package:fam_home/pages/home_page.dart';
import 'package:fam_home/utils/themedata.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fam Home',
      theme: themedata,
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
