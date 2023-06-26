import 'package:flutter/material.dart';

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        "You Did It!",
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
            color: Colors.black.withOpacity(0.5)),
      )),
    );
  }
}
