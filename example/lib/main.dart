import 'package:flutter/material.dart';

import 'other_utils_example.dart';
import 'theming_example.dart';
import 'validation_example.dart';

void main() {
  runApp(const MyApp());
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Project Starter Kit Examples')),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Theming Example'),
            onTap: () => Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const ThemingExample())),
          ),
          ListTile(
            title: const Text('Validation Example'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const ValidationExample()),
            ),
          ),
          ListTile(
            title: const Text('Other Utilities Example'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const OtherUtilsExample()),
            ),
          ),
        ],
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Project Starter Kit Example',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
