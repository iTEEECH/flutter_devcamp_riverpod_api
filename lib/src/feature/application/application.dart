import 'package:flutter/material.dart';
import 'package:flutter_devcamp_riverpod_api/src/feature/characters/presentation/page/character_page.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Disney characters',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CharactersPage(),
    );
  }
}