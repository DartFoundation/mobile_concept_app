import 'package:flutter/material.dart';
import 'navbar/navigation_pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationPanels(),
      // routes: {
      //   '/home': (context) => const NavigationPanels(),
        
      // },
    );
  }
}
