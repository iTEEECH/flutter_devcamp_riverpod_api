import 'package:flutter_devcamp_riverpod_api/src/feature/characters/data/repository/character_repositroy_impl.dart';
import 'package:flutter_devcamp_riverpod_api/src/feature/characters/domain/entity/character.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../../../../_gen/src/feature/characters/domain/repository/character_repository.g.dart';

@Riverpod(keepAlive: true)
CharacterRepository characterRepository(CharacterRepositoryRef ref) {
  return CharacterRepositoryImpl(ref);
}

abstract class CharacterRepository {
  Future<List<Character>> fetchAllCharacters(int page);
}