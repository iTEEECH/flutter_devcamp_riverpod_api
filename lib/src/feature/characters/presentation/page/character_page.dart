import 'package:flutter/material.dart';
import 'package:flutter_devcamp_riverpod_api/src/feature/characters/application/controller/character_controller.dart';
import 'package:flutter_devcamp_riverpod_api/src/feature/characters/domain/entity/character.dart';
import 'package:flutter_devcamp_riverpod_api/src/feature/characters/presentation/widget/character_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widget/character_loading.dart';

class CharactersPage extends ConsumerStatefulWidget {
  const CharactersPage({super.key});

  @override
  ConsumerState<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends ConsumerState<CharactersPage> {
  List<Character> characters = [];
  bool isLoading = true;
  bool hasMore = true;
  int page = 1;

  Future<void> fetchCharacters() async {
    if (!hasMore) return;

    final result = await ref
        .read(characterControllerProvider.notifier)
        .fetchAllCharacters(page);

    setState(() {
      characters.addAll(result);
      isLoading = false;
      hasMore = result.length == 10;
      page++;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchCharacters();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Disney Characters'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 12.0,
          ),
          child: NotificationListener<ScrollNotification>(
            onNotification: (notification) {
              if (notification is ScrollEndNotification &&
                  notification.metrics.pixels >=
                      notification.metrics.maxScrollExtent) {
                fetchCharacters();
              }
              return false;
            },
            child: isLoading
                ? const CharacterLoading()
                : CharactersList(characters: characters),
          ),
        ),
      ),
    );
  }
}
