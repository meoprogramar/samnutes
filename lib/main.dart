import 'package:flutter/material.dart';
import 'package:sam_nutes/sam_nutes.dart';

void main() {
  runApp(SamNutes());
}

class SamNutes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "samNUTES",
      theme: ThemeData(
        // textSelectionHandleColor: Colors.red.shade300,
        // primaryColor: Colors.red.shade300,
        // accentColor: Colors.red.shade300,
        // cursorColor: Colors.red.shade300,
        primarySwatch: Colors.red,
      ),
      home: Tabulacao(),
    );
  }
}
