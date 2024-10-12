import 'package:flutter_devcamp_riverpod_api/src/feature/characters/data/remote/character_remote.dart';
import 'package:flutter_devcamp_riverpod_api/src/feature/characters/domain/entity/character.dart';
import 'package:flutter_devcamp_riverpod_api/src/feature/characters/data/model/character_model.dart';
import 'package:flutter_devcamp_riverpod_api/src/feature/characters/domain/repository/character_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterRepositoryImpl extends CharacterRepository {
  final Ref ref;

  CharacterRepositoryImpl(this.ref);

  @override
  Future<List<Character>> fetchAllCharacters(int page) async {
    try {
      // Remote call.
      final List<CharacterModel> characters = await ref.read(characterRemoteProvider).fetchAllCharacters(page);

      // Result.
      return characters
          .map((character) => character.toEntity())
          .toList(growable: false);
    } catch (err) {
      throw Exception(err);
    }
  }
}