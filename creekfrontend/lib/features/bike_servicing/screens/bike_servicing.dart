import 'package:flutter/material.dart';

class ServicingScreen extends StatefulWidget {
  const ServicingScreen({super.key});

  @override
  State<ServicingScreen> createState() => _ServicingScreenState();
}

class _ServicingScreenState extends State<ServicingScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Servicing Screen", style: TextStyle(color: Colors.black)),
    );
  }
}
