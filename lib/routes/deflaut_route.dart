import 'package:flutter/material.dart';

class DeflautRoute extends StatelessWidget {
  const DeflautRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ERROR',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Center(
        child: Text(
          'WRONG ROUTING DECLARE',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
    );
  }
}
