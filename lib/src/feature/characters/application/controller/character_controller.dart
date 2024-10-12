import 'package:flutter_devcamp_riverpod_api/src/feature/characters/domain/entity/character.dart';
import 'package:flutter_devcamp_riverpod_api/src/feature/characters/domain/repository/character_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../../../../_gen/src/feature/characters/application/controller/character_controller.g.dart';

@riverpod
class CharacterController extends _$CharacterController {

  @override
  FutureOr<List<Character>> build() async {
    return fetchAllCharacters(1);
  }

  FutureOr<List<Character>> fetchAllCharacters(int page) async {
    try {
      final repository = ref.read(characterRepositoryProvider);
      final List<Character> characters = await repository.fetchAllCharacters(page);
      return characters;
    } catch (error) {
      throw Exception(error);
    }
  }
}
