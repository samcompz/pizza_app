import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {

  const DetailsScreen( {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
      ),

    );
  }
}