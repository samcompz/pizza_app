import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }

  @override
  State<WelcomeScreen> createState() {
    return _WelcomeScreenState();
  }
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(
        initialIndex: 0,
        length: 2,
        vsync: this
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       
    );
  }
}
